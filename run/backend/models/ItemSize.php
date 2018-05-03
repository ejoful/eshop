<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_size}}".
 *
 * @property int $item_size_id
 * @property string $type 类型
 * @property string $size 尺码
 */
class ItemSize extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_size}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['type', 'size'], 'required'],
            [['type'], 'string'],
            [['size'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'item_size_id' => Yii::t('app', 'Item Size ID'),
            'type' => Yii::t('app', '类型'),
            'size' => Yii::t('app', '尺码'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemSizeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemSizeQuery(get_called_class());
    }
}
