<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Item;
use backend\models\ItemSku;
use backend\models\ItemPropValue;
use backend\models\ItemProp;
use backend\models\ItemPropImg;
use backend\models\ItemImg;
use backend\models\Sku;

class ItemController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }
    
    public function actionIndex($id)
    {
        $model = $this->findModel($id);
//         print_r($model);die();
        $sids_arr = explode(';', $model->props);
        $prop_models = ItemProp::find()
        ->where(['cid' => $model->cid])
        ->orderBy('sort_order asc')
        ->all();
        
        $props_value_models = ItemPropValue::find()
        ->where(['cid' => $model->cid])
        ->where(['sid' => $sids_arr])
        ->all();
        $prop_alias_strs_arr = explode(';', $model->property_alias);
        $prop_alias_arr = [];
        foreach ($prop_alias_strs_arr as $prop_alias_str) {
            $key = substr($prop_alias_str, 0, strrpos($prop_alias_str, ':'));
            $value = substr($prop_alias_str, strrpos($prop_alias_str, ':') + 1);
            $prop_alias_arr[$key] = $value;
        }
        foreach ($props_value_models as &$props_value_model) {
            if (isset($prop_alias_arr[$props_value_model->sid])) {
                $props_value_model->name = $prop_alias_arr[$props_value_model->sid];
            }
        }
        unset($props_value_model);
//         print_r($props_value_models);die();
        $prop_img_models = ItemPropImg::find()
        ->where(['num_iid' => $id])
        ->all();
        $prop_img_arr = [];
        foreach ($prop_img_models as $prop_img_model) {
            $prop_img_arr[$prop_img_model->properties] = $prop_img_model->pic_path;
        }
        $input_pids_arr = explode(',', $model->input_pids);
        //         print_r($input_pids_arr);die();
        $input_str_arr = explode(',', $model->input_str);
        $props_str_arr = [];
        $sale_prop_arr = [];
        foreach ($prop_models as $prop) {
            foreach ($props_value_models as $prop_value) {
                if ($prop_value->pid == $prop->pid) {
                    if (empty($props_str_arr[$prop->pid]['pid'])) {
                        $props_str_arr[$prop->pid]['pid'] = $prop->pid;
                        $props_str_arr[$prop->pid]['prop_name'] = $prop->name;
                    }
                    // 清空值
                    $arr = [];
                    $arr['value'] = $prop_value->name;
                    if ($prop->is_color_prop == 1) {
                        $arr['sid'] = $prop_value->sid;
                        $arr['pic_path'] = '';
                        if (!empty($prop_img_arr[$prop_value->sid])) {
                            $arr['pic_path'] = $prop_img_arr[$prop_value->sid];
                        }
                        
                    }
                    $props_str_arr[$prop->pid]['prop_value'][] = $arr;
                    $props_str_arr[$prop->pid]['is_sale_prop'] = $prop->is_sale_prop;
                    $props_str_arr[$prop->pid]['is_color_prop'] = $prop->is_color_prop;
                }
            }
            foreach ($input_pids_arr as $input_key => $input_pid) {
                if ($prop->pid == $input_pid) {
                    $input_value_arr = explode(';', $input_str_arr[$input_key]);
                    $props_str_arr[$prop->pid]['pid'] = $prop->pid;
                    $props_str_arr[$prop->pid]['prop_name'] = $prop->name;
                    $props_str_arr[$prop->pid]['sid'] = '';
                    $props_str_arr[$prop->pid]['prop_value'][] = ['value' => $input_value_arr[2]];
                    $props_str_arr[$prop->pid]['is_sale_prop'] = $prop->is_sale_prop;
                    $props_str_arr[$prop->pid]['is_color_prop'] = $prop->is_color_prop;
                }
            }
            if ($prop->is_sale_prop == 1) {
                $sale_prop_arr[] = $props_str_arr[$prop->pid];
            }
        }
        
        $item_img_models = ItemImg::find()
        ->where(['num_iid' => $id])
        ->all();
        
        // sku信息
        $sku_models = Sku::find()
        ->select('sku_id,properties,quantity,price,')
        ->where(['num_iid' => $id])
        ->andWhere(['status' => 0])
        ->asArray()
        ->all();
        $sku_arr = [];
        foreach( $sku_models as $sku_model) {
            $sku_arr[$sku_model['properties']] = $sku_model;
        }
        $sku_str = json_encode($sku_arr);
//         print_r($sku_str);
//         print_r($sale_prop_arr);
//         print_r($props_str_arr);
//             die();
        
        $keys = [];
        foreach ($sale_prop_arr as $sale_prop) {
            $keys[] = array_column($sale_prop['prop_value'], 'sid');
        }
        $keys_str = json_encode($keys);
        
        return $this->render('index', [
            'model' => $model,
            'props_str_arr' => $props_str_arr,
            'sale_prop_arr' => $sale_prop_arr,
            'item_img_models' => $item_img_models,
            'sku_str' => $sku_str,
            'keys_str' => $keys_str
        ]);
    }
    
    protected function findModel($id)
    {
        if (($model = Item::findOne($id)) !== null) {
            return $model;
        }
    
        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

}
