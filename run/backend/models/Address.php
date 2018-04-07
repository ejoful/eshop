<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%address}}".
 *
 * @property int $addressid
 * @property int $userid 用户id
 * @property string $province 省
 * @property string $city 市
 * @property string $district 区
 * @property string $address 地址
 * @property string $zip_code 邮编
 */
class Address extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%address}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['userid', 'province', 'city', 'district', 'address', 'zip_code'], 'required'],
            [['userid'], 'integer'],
            [['province', 'city', 'district'], 'string', 'max' => 30],
            [['address'], 'string', 'max' => 1000],
            [['zip_code'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'addressid' => Yii::t('app', 'Addressid'),
            'userid' => Yii::t('app', '用户id'),
            'province' => Yii::t('app', '省'),
            'city' => Yii::t('app', '市'),
            'district' => Yii::t('app', '区'),
            'address' => Yii::t('app', '地址'),
            'zip_code' => Yii::t('app', '邮编'),
        ];
    }

    /**
     * @inheritdoc
     * @return AddressQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new AddressQuery(get_called_class());
    }
}
