<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_sku}}".
 *
 * @property int $skuId
 * @property int $itemid 宝贝id
 * @property int $colorid 颜色分类id
 * @property int $packageid 套餐id
 * @property string $price 价格（元）
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
            [['itemid', 'price', 'num'], 'required'],
            [['itemid', 'colorid', 'packageid', 'num'], 'integer'],
            [['price'], 'number'],
            [['business_code', 'product_barcode'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'skuId' => Yii::t('app', 'Sku ID'),
            'itemid' => Yii::t('app', '宝贝id'),
            'colorid' => Yii::t('app', '颜色分类id'),
            'packageid' => Yii::t('app', '套餐id'),
            'price' => Yii::t('app', '价格（元）'),
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
