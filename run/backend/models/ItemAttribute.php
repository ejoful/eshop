<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_attribute}}".
 *
 * @property int $id
 * @property int $itemid 商品
 * @property int $attrid 宝贝属性
 * @property string $value 宝贝属性值
 */
class ItemAttribute extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_attribute}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['itemid', 'attrid', 'value'], 'required'],
            [['itemid', 'attrid'], 'integer'],
            [['value'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'itemid' => Yii::t('app', '商品'),
            'attrid' => Yii::t('app', '宝贝属性'),
            'value' => Yii::t('app', '宝贝属性值'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemAttributeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemAttributeQuery(get_called_class());
    }
}
