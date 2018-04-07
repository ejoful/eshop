<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%cart}}".
 *
 * @property int $cartid
 * @property int $userid 用户id
 * @property int $itemid 宝贝id
 * @property int $skuid sku
 * @property int $quantity 数量
 */
class Cart extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%cart}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['userid', 'itemid', 'skuid'], 'required'],
            [['userid', 'itemid', 'skuid', 'quantity'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cartid' => Yii::t('app', 'Cartid'),
            'userid' => Yii::t('app', '用户id'),
            'itemid' => Yii::t('app', '宝贝id'),
            'skuid' => Yii::t('app', 'sku'),
            'quantity' => Yii::t('app', '数量'),
        ];
    }

    /**
     * @inheritdoc
     * @return CartQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CartQuery(get_called_class());
    }
}
