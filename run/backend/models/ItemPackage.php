<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_package}}".
 *
 * @property int $packageid
 * @property string $name 套餐类型
 */
class ItemPackage extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_package}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'packageid' => Yii::t('app', 'Packageid'),
            'name' => Yii::t('app', '套餐类型'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemPackageQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemPackageQuery(get_called_class());
    }
}
