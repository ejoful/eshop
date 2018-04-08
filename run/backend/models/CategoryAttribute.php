<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%category_attribute}}".
 *
 * @property int $catattrid
 * @property int $attrid 属性id
 * @property int $position 排序
 */
class CategoryAttribute extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category_attribute}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['attrid', 'position'], 'required'],
            [['attrid'], 'integer'],
            [['position'], 'string', 'max' => 2],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'catattrid' => Yii::t('app', 'Catattrid'),
            'attrid' => Yii::t('app', '属性id'),
            'position' => Yii::t('app', '排序'),
        ];
    }

    /**
     * @inheritdoc
     * @return CategoryAttributeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryAttributeQuery(get_called_class());
    }
}