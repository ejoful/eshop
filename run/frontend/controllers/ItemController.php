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
        
        $input_pids_arr = explode(',', $model->input_pids);
        //         print_r($input_pids_arr);die();
        $input_str_arr = explode(',', $model->input_str);
        $props_strs_arr = [];
        foreach ($prop_models as $prop) {
            $props_strs_arr[$prop->name] = '';
            foreach ($props_value_models as $prop_value) {
                if ($prop_value->pid == $prop->pid) {
                    if (empty($props_str_arr[$prop_value->prop_name])) {
                        $props_str_arr[$prop_value->prop_name] = '&nbsp;' . $prop_value->name;
                    } else {
                        $props_str_arr[$prop_value->prop_name] .=  '&nbsp;' . $prop_value->name;
                    }
                }
            }
            foreach ($input_pids_arr as $input_key => $input_pid) {
                $input_value_arr = explode(';', $input_str_arr[$input_key]);
                $props_str_arr[$input_value_arr[1]] = $input_value_arr[2];
            }            
        }
//         print_r($props_str_arr);die();
        
        
        return $this->render('index', ['model' => $model, 'props_str_arr' => $props_str_arr]);
    }
    
    protected function findModel($id)
    {
        if (($model = Item::findOne($id)) !== null) {
            return $model;
        }
    
        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

}
