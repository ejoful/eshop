<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%sku_attribute_name}}".
 *
 * @property int $attr_name_id 属性名编号
 * @property string $name 属性名
 * @property string $cartid 商品分类编号
 */
class SkuAttributeName extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%sku_attribute_name}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 100],
            [['cartid'], 'string', 'max' => 300],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'attr_name_id' => Yii::t('app', '属性名编号'),
            'name' => Yii::t('app', '属性名'),
            'cartid' => Yii::t('app', '商品分类编号'),
        ];
    }

    /**
     * @inheritdoc
     * @return SkuAttributeNameQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new SkuAttributeNameQuery(get_called_class());
    }
}
