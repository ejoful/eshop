<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\modelsItemPropValueSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Item Prop Values');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-prop-value-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Item Prop Value'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'vid',
            'cid',
            'pid',
            'sid',
            'prop_name',
            //'name',
            //'name_alias',
            //'spell',
            //'is_parent',
            //'status',
            //'sort_order',
            //'features',
            //'modified_type',
            //'last_modified',
            //'leaf',
            //'spuid',
            //'child_pid',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
