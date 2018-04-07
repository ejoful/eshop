<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_pc_img}}".
 *
 * @property int $id
 * @property int $itemid 宝贝id
 * @property string $name 图片名字
 * @property string $path 图片路径
 * @property int $position 排序
 */
class ItemPcImg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_pc_img}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['itemid', 'name', 'path', 'position'], 'required'],
            [['itemid'], 'integer'],
            [['name'], 'string', 'max' => 100],
            [['path'], 'string', 'max' => 200],
            [['position'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'itemid' => Yii::t('app', '宝贝id'),
            'name' => Yii::t('app', '图片名字'),
            'path' => Yii::t('app', '图片路径'),
            'position' => Yii::t('app', '排序'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemPcImgQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemPcImgQuery(get_called_class());
    }
}
