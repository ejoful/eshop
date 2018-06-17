<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_cat}}".
 *
 * @property int $cid 商品所属类目ID
 * @property string $features Feature对象列表 目前已有的属性： 若Attr_key为 udsaleprop，attr_value为1 则允许卖家在改类目新增自定义销售属性,不然为不允许
 * @property int $is_parent 该类目是否为父类目(即：该类目是否还有子类目)
 * @property string $spell 汉语拼音首字母拼写
 * @property string $name 类目名称
 * @property int $spuid
 * @property int $leaf 是否叶子节点，0：非叶子节点，1：叶子节点，2：还有子目录，20000:3376399，手卷钢琴，品牌，EVA
 * @property int $parent_cid 父类目ID=0时，代表的是一级的类目
 * @property int $sort_order 排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数
 * @property int $status 状态。可选值:0(正常),1(删除)
 * @property int $taosir_cat 是否度量衡类目
 * @property string $created 类目在原系统创建时间
 * @property string $modified 类目在原系统修改时间
 * @property int $depth 层级
 */
class ItemCat extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_cat}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['cid', 'is_parent', 'spell', 'name', 'leaf', 'parent_cid', 'sort_order', 'taosir_cat'], 'required'],
            [['cid', 'spuid', 'parent_cid'], 'integer'],
            [['created', 'modified'], 'safe'],
            [['features'], 'string', 'max' => 30],
            [['is_parent', 'status', 'taosir_cat', 'depth'], 'string', 'max' => 1],
            [['spell', 'name'], 'string', 'max' => 100],
            [['leaf', 'sort_order'], 'string', 'max' => 4],
            [['cid'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'cid' => Yii::t('app', '商品所属类目ID'),
            'features' => Yii::t('app', 'Feature对象列表 目前已有的属性： 若Attr_key为 udsaleprop，attr_value为1 则允许卖家在改类目新增自定义销售属性,不然为不允许'),
            'is_parent' => Yii::t('app', '该类目是否为父类目(即：该类目是否还有子类目)'),
            'spell' => Yii::t('app', '汉语拼音首字母拼写'),
            'name' => Yii::t('app', '类目名称'),
            'spuid' => Yii::t('app', 'Spuid'),
            'leaf' => Yii::t('app', '是否叶子节点，0：非叶子节点，1：叶子节点，2：还有子目录，20000:3376399，手卷钢琴，品牌，EVA'),
            'parent_cid' => Yii::t('app', '父类目ID=0时，代表的是一级的类目'),
            'sort_order' => Yii::t('app', '排列序号，表示同级类目的展现次序，如数值相等则按名称次序排列。取值范围:大于零的整数'),
            'status' => Yii::t('app', '状态。可选值:0(正常),1(删除)'),
            'taosir_cat' => Yii::t('app', '是否度量衡类目'),
            'created' => Yii::t('app', '类目在原系统创建时间'),
            'modified' => Yii::t('app', '类目在原系统修改时间'),
            'depth' => Yii::t('app', '层级'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemCatQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemCatQuery(get_called_class());
    }
}
