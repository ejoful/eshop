<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_prop_img}}".
 *
 * @property int $id 属性图片ID。如果是新增不需要填写
 * @property string $properties 属性列表。调用taobao.itemprops.get获取，属性必须是颜色属性，格式:pid:vid。
 * @property string $pic_path 图片地址(传入图片相对地址即可,即不需包含 http://img02.taobao.net/bao/uploaded )
 * @property int $num_iid 商品数字ID，必选
 * @property int $position 图片序号
 * @property string $created 图片创建时间
 */
class ItemPropImg extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_prop_img}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['properties', 'pic_path', 'num_iid'], 'required'],
            [['num_iid'], 'integer'],
            [['created'], 'safe'],
            [['properties'], 'string', 'max' => 2500],
            [['pic_path'], 'string', 'max' => 300],
            [['position'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', '属性图片ID。如果是新增不需要填写'),
            'properties' => Yii::t('app', '属性列表。调用taobao.itemprops.get获取，属性必须是颜色属性，格式:pid:vid。'),
            'pic_path' => Yii::t('app', '图片地址(传入图片相对地址即可,即不需包含 http://img02.taobao.net/bao/uploaded )'),
            'num_iid' => Yii::t('app', '商品数字ID，必选'),
            'position' => Yii::t('app', '图片序号'),
            'created' => Yii::t('app', '图片创建时间'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemPropImgQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemPropImgQuery(get_called_class());
    }
}
