<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_sku}}".
 *
 * @property int $skuId SKU编号
 * @property int $itemid 宝贝id
 * @property string $sku_attr SKU属性
 * @property string $price 价格（元）
 * @property string $promotion_price 促销价
 * @property int $num 数量（件）
 * @property string $business_code 商家编码
 * @property string $product_barcode 商品条形码
 */
class ItemSku extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_sku}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['itemid', 'price', 'promotion_price', 'num'], 'required'],
            [['itemid', 'num'], 'integer'],
            [['price', 'promotion_price'], 'number'],
            [['sku_attr'], 'string', 'max' => 200],
            [['business_code', 'product_barcode'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'skuId' => Yii::t('app', 'SKU编号'),
            'itemid' => Yii::t('app', '宝贝id'),
            'sku_attr' => Yii::t('app', 'SKU属性'),
            'price' => Yii::t('app', '价格（元）'),
            'promotion_price' => Yii::t('app', '促销价'),
            'num' => Yii::t('app', '数量（件）'),
            'business_code' => Yii::t('app', '商家编码'),
            'product_barcode' => Yii::t('app', '商品条形码'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemSkuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemSkuQuery(get_called_class());
    }
}
