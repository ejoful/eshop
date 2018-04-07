<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_color}}".
 *
 * @property int $colorid
 * @property string $color 颜色
 * @property string $des 备注
 * @property string $img_name 图片名
 * @property string $img_path 图片路径
 */
class ItemColor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_color}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['color', 'des'], 'string', 'max' => 100],
            [['img_name'], 'string', 'max' => 50],
            [['img_path'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'colorid' => Yii::t('app', 'Colorid'),
            'color' => Yii::t('app', '颜色'),
            'des' => Yii::t('app', '备注'),
            'img_name' => Yii::t('app', '图片名'),
            'img_path' => Yii::t('app', '图片路径'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemColorQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemColorQuery(get_called_class());
    }
}
