<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item}}".
 *
 * @property int $num_iid 商品数字id
 * @property int $cid 叶子类目id
 * @property int $type 宝贝类型
 * @property string $title 宝贝标题
 * @property string $input_str 用户自行输入的子属性名和属性值，结构:"父属性值;一级子属性名;一级子属性值;二级子属性名;自定义输入值,....",如：“耐克;耐克系列;科比系列;科比系列;2K5,Nike乔丹鞋;乔丹系列;乔丹鞋系列;乔丹鞋系列;json5”，多个自定义属性用','分割，input_str需要与input_pids一一对应，注：通常一个类目下用户可输入的关键属性不超过1个。所有属性别名加起来不能超过3999字节。此处不可以使用“其他”、“其它”和“其她”这三个词。
 * @property string $input_pids 用户自行输入的类目属性ID串，结构："pid1,pid2,pid3"，如："20000"（表示品牌） 注：通常一个类目下用户可输入的关键属性不超过1个。
 * @property string $sku_properties 更新的sku的属性串，调用taobao.itemprops.get获取。格式:pid1:vid;pid2:vid,多个sku属性之间用逗号分隔。该字段内的属性需要在props字段同时包含。如果新增商品包含了sku，则此字段一定要传入,字段长度要控制在512个字节以内。
 * @property string $props 商品属性列表。格式:pid:vid;pid:vid。属性的pid调用taobao.itemprops.get取得，属性值的vid用taobao.itempropvalues.get取得vid。 如果该类目下面没有属性，可以不用填写。如果有属性，必选属性必填，其他非必选属性可以选择不填写.属性不能超过35对。所有属性加起来包括分割符不能超过549字节，单个属性没有限制。 如果有属性是可输入的话，则用字段input_str填入属性的值
 * @property string $property_alias 属性值别名。如pid:vid:别名;pid1:vid1:别名1 ，其中：pid是属性id vid是属性值id。总长度不超过512字节
 * @property string $img_video 主图视频
 * @property string $price 价格（元）
 * @property string $discount_price 促销价
 * @property int $num 数量（件）
 * @property string $business_code 商家编码
 * @property string $product_barcode 商品条形码
 * @property string $purchase_place 采购地
 * @property string $item_video 宝贝视频
 * @property string $pc_des 电脑端描述
 * @property string $mob_des 手机端描述
 * @property int $transid 物流服务
 * @property string $warranty 售后服务
 * @property string $online_time 上架时间
 * @property int $window_reco 橱窗推荐
 * @property int $userid 卖家编号
 * @property string $created 创建时间
 */
class Item extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid', 'type', 'title', 'price', 'num', 'purchase_place', 'pc_des', 'online_time', 'window_reco', 'userid'], 'required'],
            [['cid', 'num', 'transid', 'userid'], 'integer'],
            [['input_str', 'input_pids', 'sku_properties', 'props', 'img_video', 'item_video', 'pc_des', 'mob_des', 'warranty'], 'string'],
            [['price', 'discount_price'], 'number'],
            [['created'], 'safe'],
            [['type'], 'string', 'max' => 4],
            [['title'], 'string', 'max' => 120],
            [['property_alias'], 'string', 'max' => 512],
            [['business_code', 'product_barcode'], 'string', 'max' => 100],
            [['purchase_place'], 'string', 'max' => 30],
            [['online_time'], 'string', 'max' => 20],
            [['window_reco'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'num_iid' => Yii::t('app', '商品数字id'),
            'cid' => Yii::t('app', '叶子类目id'),
            'type' => Yii::t('app', '宝贝类型'),
            'title' => Yii::t('app', '宝贝标题'),
            'input_str' => Yii::t('app', '用户自行输入的子属性名和属性值，结构:\"父属性值;一级子属性名;一级子属性值;二级子属性名;自定义输入值,....\",如：“耐克;耐克系列;科比系列;科比系列;2K5,Nike乔丹鞋;乔丹系列;乔丹鞋系列;乔丹鞋系列;json5”，多个自定义属性用\',\'分割，input_str需要与input_pids一一对应，注：通常一个类目下用户可输入的关键属性不超过1个。所有属性别名加起来不能超过3999字节。此处不可以使用“其他”、“其它”和“其她”这三个词。'),
            'input_pids' => Yii::t('app', '用户自行输入的类目属性ID串，结构：\"pid1,pid2,pid3\"，如：\"20000\"（表示品牌） 注：通常一个类目下用户可输入的关键属性不超过1个。'),
            'sku_properties' => Yii::t('app', '更新的sku的属性串，调用taobao.itemprops.get获取。格式:pid1:vid;pid2:vid,多个sku属性之间用逗号分隔。该字段内的属性需要在props字段同时包含。如果新增商品包含了sku，则此字段一定要传入,字段长度要控制在512个字节以内。'),
            'props' => Yii::t('app', '商品属性列表。格式:pid:vid;pid:vid。属性的pid调用taobao.itemprops.get取得，属性值的vid用taobao.itempropvalues.get取得vid。 如果该类目下面没有属性，可以不用填写。如果有属性，必选属性必填，其他非必选属性可以选择不填写.属性不能超过35对。所有属性加起来包括分割符不能超过549字节，单个属性没有限制。 如果有属性是可输入的话，则用字段input_str填入属性的值'),
            'property_alias' => Yii::t('app', '属性值别名。如pid:vid:别名;pid1:vid1:别名1 ，其中：pid是属性id vid是属性值id。总长度不超过512字节'),
            'img_video' => Yii::t('app', '主图视频'),
            'price' => Yii::t('app', '价格（元）'),
            'discount_price' => Yii::t('app', '促销价'),
            'num' => Yii::t('app', '数量（件）'),
            'business_code' => Yii::t('app', '商家编码'),
            'product_barcode' => Yii::t('app', '商品条形码'),
            'purchase_place' => Yii::t('app', '采购地'),
            'item_video' => Yii::t('app', '宝贝视频'),
            'pc_des' => Yii::t('app', '电脑端描述'),
            'mob_des' => Yii::t('app', '手机端描述'),
            'transid' => Yii::t('app', '物流服务'),
            'warranty' => Yii::t('app', '售后服务'),
            'online_time' => Yii::t('app', '上架时间'),
            'window_reco' => Yii::t('app', '橱窗推荐'),
            'userid' => Yii::t('app', '卖家编号'),
            'created' => Yii::t('app', '创建时间'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemQuery(get_called_class());
    }
}
