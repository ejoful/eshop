<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_prop_value}}".
 *
 * @property int $vid 属性值ID
 * @property int $cid 类目ID
 * @property int $pid 属性 ID
 * @property string $sid
 * @property string $prop_name 属性名
 * @property string $name 属性值
 * @property string $name_alias 属性值别名
 * @property string $spell 首字母拼写
 * @property int $is_parent 是否为父类目属性
 * @property int $status 状态。可选值:0(正常),1(删除)
 * @property int $sort_order 排列序号。取值范围:大于零的整数
 * @property string $features 	属性值feature
 * @property string $modified_type 三种枚举类型：modify，add，delete (增量类目专用)
 * @property string $last_modified 	最近修改时间。格式:yyyy-MM-dd HH:mm:ss
 * @property int $leaf 是否叶子节点
 * @property int $spuid
 * @property int $child_pid
 */
class ItemPropValue extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_prop_value}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['vid', 'cid', 'pid', 'sid', 'prop_name', 'name', 'name_alias', 'spell', 'sort_order', 'leaf', 'spuid'], 'required'],
            [['vid', 'cid', 'pid', 'spuid', 'child_pid'], 'integer'],
            [['modified_type'], 'string'],
            [['last_modified'], 'safe'],
            [['sid'], 'string', 'max' => 50],
            [['prop_name', 'name', 'name_alias', 'spell', 'features'], 'string', 'max' => 100],
            [['is_parent', 'status', 'sort_order', 'leaf'], 'string', 'max' => 1],
            [['vid', 'cid', 'pid'], 'unique', 'targetAttribute' => ['vid', 'cid', 'pid']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'vid' => Yii::t('app', '属性值ID'),
            'cid' => Yii::t('app', '类目ID'),
            'pid' => Yii::t('app', '属性 ID'),
            'sid' => Yii::t('app', 'Sid'),
            'prop_name' => Yii::t('app', '属性名'),
            'name' => Yii::t('app', '属性值'),
            'name_alias' => Yii::t('app', '属性值别名'),
            'spell' => Yii::t('app', '首字母拼写'),
            'is_parent' => Yii::t('app', '是否为父类目属性'),
            'status' => Yii::t('app', '状态。可选值:0(正常),1(删除)'),
            'sort_order' => Yii::t('app', '排列序号。取值范围:大于零的整数'),
            'features' => Yii::t('app', '	属性值feature'),
            'modified_type' => Yii::t('app', '三种枚举类型：modify，add，delete (增量类目专用)'),
            'last_modified' => Yii::t('app', '	最近修改时间。格式:yyyy-MM-dd HH:mm:ss'),
            'leaf' => Yii::t('app', '是否叶子节点'),
            'spuid' => Yii::t('app', 'Spuid'),
            'child_pid' => Yii::t('app', 'Child Pid'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemPropValueQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemPropValueQuery(get_called_class());
    }
}
