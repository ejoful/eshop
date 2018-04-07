<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%attribute}}".
 *
 * @property int $attrid
 * @property string $name
 */
class Attribute extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%attribute}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'attrid' => Yii::t('app', 'Attrid'),
            'name' => Yii::t('app', 'Name'),
        ];
    }

    /**
     * @inheritdoc
     * @return AttributeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new AttributeQuery(get_called_class());
    }
}
