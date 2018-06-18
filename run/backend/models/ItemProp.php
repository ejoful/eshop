<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "{{%item_prop}}".
 *
 * @property int $pid 属性 ID 例：品牌的PID=20000
 * @property string $name 属性名
 * @property string $child_template 属性的模板（卖家自行输入属性时需要用到）
 * @property int $cid 类目ID
 * @property string $features 属性的feature列表
 * @property int $is_allow_alias 是否允许别名。可选值：true（是），false（否）
 * @property int $is_color_prop 是否颜色属性。可选值:true(是),false(否)
 * @property int $is_enum_prop 是否是可枚举属性。可选值:true(是),false(否)
 * @property int $is_input_prop 在is_enum_prop是true的前提下，是否是卖家可以自行输入的属性（注：如果is_enum_prop返回false，该参数统一返回false）。可选值:true(是),false(否)。<b>对于品牌和型号属性（包括子属性）：如果用户是C卖家，则可自定义属性；如果是B卖家，则不可自定义属性，而必须要授权的属性。</b>
 * @property int $is_item_prop 是否商品属性。可选值:true(是),false(否)
 * @property int $is_key_prop 是否关键属性。可选值:true(是),false(否)
 * @property int $is_material 是否是材质 属性项
 * @property int $is_sale_prop 是否销售属性。可选值:true(是),false(否)
 * @property int $is_taosir 是否度量衡属性项
 * @property int $material_do 材质属性信息
 * @property string $modified_time 属性修改时间（增量类目专用）
 * @property string $modified_type 三种枚举类型：modify，add，delete（增量类目专用）
 * @property int $multi 发布产品或商品时是否可以多选。可选值:true(是),false(否)
 * @property int $must 发布产品或商品时是否为必选属性。可选值:true(是),false(否)
 * @property int $parent_pid 上级属性ID
 * @property int $parent_vid 上级属性值ID
 * @property string $required 发布产品或商品时是否为必选属性(与must相同)。可选值:true(是),false(否)
 * @property int $sort_order 排列序号。取值范围:大于零的整排列序号。取值范围:大于零的整数
 * @property int $status 状态。可选值:0(正常),1(删除)
 * @property int $taosir_do 度量衡相关信息
 * @property string $child_path 类目子属性路径,由该子属性上层的类目属性和类目属性值组成,格式pid:vid;pid:vid.取类目子属性需要传child_path,cid
 * @property string $type 属性值类型。可选值： multiCheck(枚举多选) optional(枚举单选) multiCheckText(枚举可输入多选) optionalText(枚举可输入单选) text(非枚举可输入)
 * @property string $attr_keys 属性的Key，支持多条，以“,”分隔
 */
class ItemProp extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%item_prop}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'cid', 'is_allow_alias', 'material_do', 'parent_pid', 'parent_vid', 'required', 'sort_order', 'taosir_do', 'type'], 'required'],
            [['cid', 'material_do', 'parent_pid', 'parent_vid', 'sort_order'], 'integer'],
            [['modified_time'], 'safe'],
            [['modified_type'], 'string'],
            [['name', 'features', 'required', 'child_path', 'attr_keys'], 'string', 'max' => 100],
            [['child_template'], 'string', 'max' => 500],
            [['is_allow_alias', 'is_color_prop', 'is_enum_prop', 'is_input_prop', 'is_item_prop', 'is_key_prop', 'is_material', 'is_sale_prop', 'is_taosir', 'multi', 'must', 'status', 'taosir_do'], 'string', 'max' => 1],
            [['type'], 'string', 'max' => 20],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pid' => Yii::t('app', '属性 ID 例：品牌的PID=20000'),
            'name' => Yii::t('app', '属性名'),
            'child_template' => Yii::t('app', '属性的模板（卖家自行输入属性时需要用到）'),
            'cid' => Yii::t('app', '类目ID'),
            'features' => Yii::t('app', '属性的feature列表'),
            'is_allow_alias' => Yii::t('app', '是否允许别名。可选值：true（是），false（否）'),
            'is_color_prop' => Yii::t('app', '是否颜色属性。可选值:true(是),false(否)'),
            'is_enum_prop' => Yii::t('app', '是否是可枚举属性。可选值:true(是),false(否)'),
            'is_input_prop' => Yii::t('app', '在is_enum_prop是true的前提下，是否是卖家可以自行输入的属性（注：如果is_enum_prop返回false，该参数统一返回false）。可选值:true(是),false(否)。<b>对于品牌和型号属性（包括子属性）：如果用户是C卖家，则可自定义属性；如果是B卖家，则不可自定义属性，而必须要授权的属性。</b>'),
            'is_item_prop' => Yii::t('app', '是否商品属性。可选值:true(是),false(否)'),
            'is_key_prop' => Yii::t('app', '是否关键属性。可选值:true(是),false(否)'),
            'is_material' => Yii::t('app', '是否是材质 属性项'),
            'is_sale_prop' => Yii::t('app', '是否销售属性。可选值:true(是),false(否)'),
            'is_taosir' => Yii::t('app', '是否度量衡属性项'),
            'material_do' => Yii::t('app', '材质属性信息'),
            'modified_time' => Yii::t('app', '属性修改时间（增量类目专用）'),
            'modified_type' => Yii::t('app', '三种枚举类型：modify，add，delete（增量类目专用）'),
            'multi' => Yii::t('app', '发布产品或商品时是否可以多选。可选值:true(是),false(否)'),
            'must' => Yii::t('app', '发布产品或商品时是否为必选属性。可选值:true(是),false(否)'),
            'parent_pid' => Yii::t('app', '上级属性ID'),
            'parent_vid' => Yii::t('app', '上级属性值ID'),
            'required' => Yii::t('app', '发布产品或商品时是否为必选属性(与must相同)。可选值:true(是),false(否)'),
            'sort_order' => Yii::t('app', '排列序号。取值范围:大于零的整排列序号。取值范围:大于零的整数'),
            'status' => Yii::t('app', '状态。可选值:0(正常),1(删除)'),
            'taosir_do' => Yii::t('app', '度量衡相关信息'),
            'child_path' => Yii::t('app', '类目子属性路径,由该子属性上层的类目属性和类目属性值组成,格式pid:vid;pid:vid.取类目子属性需要传child_path,cid'),
            'type' => Yii::t('app', '属性值类型。可选值： multiCheck(枚举多选) optional(枚举单选) multiCheckText(枚举可输入多选) optionalText(枚举可输入单选) text(非枚举可输入)'),
            'attr_keys' => Yii::t('app', '属性的Key，支持多条，以“,”分隔'),
        ];
    }

    /**
     * @inheritdoc
     * @return ItemPropQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ItemPropQuery(get_called_class());
    }
}
