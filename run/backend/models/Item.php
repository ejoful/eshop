<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item}}".
 *
 * @property int $itemid
 * @property int $catid 类目
 * @property int $type 宝贝类型
 * @property string $title 宝贝标题
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
            [['catid', 'type', 'title', 'price', 'num', 'purchase_place', 'pc_des', 'online_time', 'window_reco', 'userid'], 'required'],
            [['catid', 'num', 'transid', 'userid'], 'integer'],
            [['img_video', 'item_video', 'pc_des', 'mob_des', 'warranty'], 'string'],
            [['price', 'discount_price'], 'number'],
            [['type'], 'string', 'max' => 4],
            [['title'], 'string', 'max' => 120],
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
            'itemid' => Yii::t('app', 'Itemid'),
            'catid' => Yii::t('app', '类目'),
            'type' => Yii::t('app', '宝贝类型'),
            'title' => Yii::t('app', '宝贝标题'),
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
