<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sku}}".
 *
 * @property int $sku_id sku的id
 * @property int $num_iid Sku所属商品数字id，可通过 taobao.item.get 获取。必选
 * @property string $properties Sku属性串。格式:pid:vid;pid:vid,如:1627207:3232483;1630696:3284570,表示:机身颜色:军绿色;手机套餐:一电一充。
 * @property int $quantity Sku的库存数量。sku的总数量应该小于等于商品总数量(Item的NUM)。取值范围:大于零的整数
 * @property string $price Sku的销售价格。商品的价格要在商品所有的sku的价格之间。精确到2位小数;单位:元。如:200.07，表示:200元7分
 * @property int $outer_id Sku的商家外部id
 * @property string $lang Sku文字的版本。可选值:zh_HK(繁体),zh_CN(简体);默认值:zh_CN
 * @property int $spec_id 产品的规格信息
 * @property string $change_prop pid:vid:vid1,vid2,vid3;pid:vid:vid1,vid2，基础色数据
 * @property string $properties_name sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……
 * @property int $status sku状态。 0:正常 ；1:删除
 * @property string $created sku创建时间
 * @property string $modified sku修改时间
 */
class Sku extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sku}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['num_iid', 'properties', 'quantity', 'price', 'spec_id'], 'required'],
            [['num_iid', 'quantity', 'outer_id', 'spec_id'], 'integer'],
            [['properties', 'lang', 'properties_name'], 'string'],
            [['price'], 'number'],
            [['created', 'modified'], 'safe'],
            [['change_prop'], 'string', 'max' => 900],
            [['status'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'sku_id' => Yii::t('app', 'sku的id'),
            'num_iid' => Yii::t('app', 'Sku所属商品数字id，可通过 taobao.item.get 获取。必选'),
            'properties' => Yii::t('app', 'Sku属性串。格式:pid:vid;pid:vid,如:1627207:3232483;1630696:3284570,表示:机身颜色:军绿色;手机套餐:一电一充。'),
            'quantity' => Yii::t('app', 'Sku的库存数量。sku的总数量应该小于等于商品总数量(Item的NUM)。取值范围:大于零的整数'),
            'price' => Yii::t('app', 'Sku的销售价格。商品的价格要在商品所有的sku的价格之间。精确到2位小数;单位:元。如:200.07，表示:200元7分'),
            'outer_id' => Yii::t('app', 'Sku的商家外部id'),
            'lang' => Yii::t('app', 'Sku文字的版本。可选值:zh_HK(繁体),zh_CN(简体);默认值:zh_CN'),
            'spec_id' => Yii::t('app', '产品的规格信息'),
            'change_prop' => Yii::t('app', 'pid:vid:vid1,vid2,vid3;pid:vid:vid1,vid2，基础色数据'),
            'properties_name' => Yii::t('app', 'sku所对应的销售属性的中文名字串，格式如：pid1:vid1:pid_name1:vid_name1;pid2:vid2:pid_name2:vid_name2……'),
            'status' => Yii::t('app', 'sku状态。 0:正常 ；1:删除'),
            'created' => Yii::t('app', 'sku创建时间'),
            'modified' => Yii::t('app', 'sku修改时间'),
        ];
    }

    /**
     * @inheritdoc
     * @return SkuQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new SkuQuery(get_called_class());
    }
}
