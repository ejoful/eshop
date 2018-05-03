<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sku_attribute_value}}".
 *
 * @property int $id 属性值编号
 * @property string $title 属性值标题
 * @property string $value 属性值
 * @property int $attr_name_id 属性名编号
 */
class SkuAttributeValue extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sku_attribute_value}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'value', 'attr_name_id'], 'required'],
            [['attr_name_id'], 'integer'],
            [['title', 'value'], 'string', 'max' => 300],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '属性值编号'),
            'title' => Yii::t('app', '属性值标题'),
            'value' => Yii::t('app', '属性值'),
            'attr_name_id' => Yii::t('app', '属性名编号'),
        ];
    }

    /**
     * @inheritdoc
     * @return SkuAttributeValueQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new SkuAttributeValueQuery(get_called_class());
    }
}
