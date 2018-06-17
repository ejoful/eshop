<?php

namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use backend\models\Item;
use backend\models\ItemSku;

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
        print_r($model->itemSkus);
        $sku_array = [];
        foreach($model->itemSkus as $item_sku) {
            
        }
//         $sku_models = ItemSku::find()
//         ->where(['itemid' => $id])
//         ->all();
//         print_r($sku_models);
        die;
        return $this->render('index', ['model' => $model]);
    }
    
    protected function findModel($id)
    {
        if (($model = Item::findOne($id)) !== null) {
            return $model;
        }
    
        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }

}
