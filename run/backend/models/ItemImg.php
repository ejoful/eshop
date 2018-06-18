<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_img}}".
 *
 * @property int $id 商品图片id(如果是更新图片，则需要传该参数)
 * @property int $num_iid 商品数字ID，该参数必须
 * @property int $position 图片序号
 * @property string $path 图片路径
 * @property int $is_major 是否将该图片设为主图,可选值:true,false;默认值:false(非主图)
 * @property int $is_rectangle 是否3:4长方形图片，绑定3:4主图视频时用于上传3:4商品主图
 * @property string $created 添加时间
 */
class ItemImg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_img}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['num_iid'], 'required'],
            [['num_iid'], 'integer'],
            [['created'], 'safe'],
            [['position', 'is_major', 'is_rectangle'], 'string', 'max' => 1],
            [['path'], 'string', 'max' => 200],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '商品图片id(如果是更新图片，则需要传该参数)'),
            'num_iid' => Yii::t('app', '商品数字ID，该参数必须'),
            'position' => Yii::t('app', '图片序号'),
            'path' => Yii::t('app', '图片路径'),
            'is_major' => Yii::t('app', '是否将该图片设为主图,可选值:true,false;默认值:false(非主图)'),
            'is_rectangle' => Yii::t('app', '是否3:4长方形图片，绑定3:4主图视频时用于上传3:4商品主图'),
            'created' => Yii::t('app', '添加时间'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemImgQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemImgQuery(get_called_class());
    }
}
