<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel backend\models\ItemPropSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Item Props');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-prop-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a(Yii::t('app', 'Create Item Prop'), ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'pid',
            'child_template',
            'cid',
            'features',
            'is_allow_alias',
            //'is_color_prop',
            //'is_enum_prop',
            //'is_input_prop',
            //'is_item_prop',
            //'is_key_prop',
            //'is_material',
            //'is_sale_prop',
            //'is_taosir',
            //'material_do',
            //'modified_time',
            //'modified_type',
            //'multi',
            //'must',
            //'name',
            //'parent_pid',
            //'parent_vid',
            //'required',
            //'sort_order',
            //'status',
            //'taosir_do',
            //'child_path',
            //'type',
            //'attr_keys',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
