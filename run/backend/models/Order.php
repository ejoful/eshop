<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%order}}".
 *
 * @property string $orderid 订单号
 * @property int $userid 用户id
 * @property int $itemid 宝贝id
 * @property int $skuid skuid
 * @property int $quantity 数量
 * @property int $couponid 优惠券
 * @property string $pay_amount 实付款
 * @property string $shipping_address 收货地址
 * @property string $note 买家备注
 * @property string $zip_code 邮编
 * @property string $shipping_id 物流单号
 * @property string $shipping_time 寄送时间
 * @property string $pay_time 支付时间
 * @property string $alipay_number 支付宝交易号
 * @property int $pay_status 支付状态（0 未支付，1已支付）
 * @property string $close_type 关闭类型
 * @property string $close_time 关闭时间
 * @property string $cloase_reason 关闭原因
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%order}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['orderid', 'userid', 'itemid', 'skuid', 'quantity', 'pay_amount', 'shipping_address', 'zip_code', 'pay_status'], 'required'],
            [['userid', 'itemid', 'skuid', 'couponid'], 'integer'],
            [['pay_amount'], 'number'],
            [['note'], 'string'],
            [['shipping_time', 'pay_time', 'close_time'], 'safe'],
            [['orderid', 'shipping_id', 'alipay_number'], 'string', 'max' => 50],
            [['quantity'], 'string', 'max' => 3],
            [['shipping_address'], 'string', 'max' => 600],
            [['zip_code'], 'string', 'max' => 20],
            [['pay_status'], 'string', 'max' => 1],
            [['close_type', 'cloase_reason'], 'string', 'max' => 300],
            [['orderid'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'orderid' => Yii::t('app', '订单号'),
            'userid' => Yii::t('app', '用户id'),
            'itemid' => Yii::t('app', '宝贝id'),
            'skuid' => Yii::t('app', 'skuid'),
            'quantity' => Yii::t('app', '数量'),
            'couponid' => Yii::t('app', '优惠券'),
            'pay_amount' => Yii::t('app', '实付款'),
            'shipping_address' => Yii::t('app', '收货地址'),
            'note' => Yii::t('app', '买家备注'),
            'zip_code' => Yii::t('app', '邮编'),
            'shipping_id' => Yii::t('app', '物流单号'),
            'shipping_time' => Yii::t('app', '寄送时间'),
            'pay_time' => Yii::t('app', '支付时间'),
            'alipay_number' => Yii::t('app', '支付宝交易号'),
            'pay_status' => Yii::t('app', '支付状态（0 未支付，1已支付）'),
            'close_type' => Yii::t('app', '关闭类型'),
            'close_time' => Yii::t('app', '关闭时间'),
            'cloase_reason' => Yii::t('app', '关闭原因'),
        ];
    }

    /**
     * @inheritdoc
     * @return OrderQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new OrderQuery(get_called_class());
    }
}
