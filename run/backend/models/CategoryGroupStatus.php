<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%category_group_status}}".
 *
 * @property int $cat_group_id 分类组id
 * @property int $expanded 是否展开
 * @property int $uid 用户id
 */
class CategoryGroupStatus extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category_group_status}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cat_group_id', 'expanded', 'uid'], 'required'],
            [['cat_group_id', 'uid'], 'integer'],
            [['expanded'], 'string', 'max' => 1],
            [['cat_group_id'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cat_group_id' => Yii::t('app', '分类组id'),
            'expanded' => Yii::t('app', '是否展开'),
            'uid' => Yii::t('app', '用户id'),
        ];
    }

    /**
     * @inheritdoc
     * @return CategoryGroupStatusQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryGroupStatusQuery(get_called_class());
    }
}
