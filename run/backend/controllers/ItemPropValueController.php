<?php

namespace backend\controllers;

use Yii;
use backend\models\ItemPropValue;
use backend\modelsItemPropValueSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * ItemPropValueController implements the CRUD actions for ItemPropValue model.
 */
class ItemPropValueController extends Controller
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

    /**
     * Lists all ItemPropValue models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new modelsItemPropValueSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single ItemPropValue model.
     * @param integer $vid
     * @param integer $cid
     * @param integer $pid
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($vid, $cid, $pid)
    {
        return $this->render('view', [
            'model' => $this->findModel($vid, $cid, $pid),
        ]);
    }

    /**
     * Creates a new ItemPropValue model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new ItemPropValue();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'vid' => $model->vid, 'cid' => $model->cid, 'pid' => $model->pid]);
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing ItemPropValue model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $vid
     * @param integer $cid
     * @param integer $pid
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($vid, $cid, $pid)
    {
        $model = $this->findModel($vid, $cid, $pid);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'vid' => $model->vid, 'cid' => $model->cid, 'pid' => $model->pid]);
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing ItemPropValue model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $vid
     * @param integer $cid
     * @param integer $pid
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($vid, $cid, $pid)
    {
        $this->findModel($vid, $cid, $pid)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the ItemPropValue model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $vid
     * @param integer $cid
     * @param integer $pid
     * @return ItemPropValue the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($vid, $cid, $pid)
    {
        if (($model = ItemPropValue::findOne(['vid' => $vid, 'cid' => $cid, 'pid' => $pid])) !== null) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
