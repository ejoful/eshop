<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%category_group}}".
 *
 * @property int $cat_group_id 分类组id
 * @property string $name 分类组名称
 * @property int $position 排序
 * @property string $cids 分类id，cid1,cid2,cid3
 */
class CategoryGroup extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%category_group}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'position', 'cids'], 'required'],
            [['name'], 'string', 'max' => 100],
            [['position'], 'string', 'max' => 1],
            [['cids'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cat_group_id' => Yii::t('app', '分类组id'),
            'name' => Yii::t('app', '分类组名称'),
            'position' => Yii::t('app', '排序'),
            'cids' => Yii::t('app', '分类id，cid1,cid2,cid3'),
        ];
    }

    /**
     * @inheritdoc
     * @return CategoryGroupQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new CategoryGroupQuery(get_called_class());
    }
}
