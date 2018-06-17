<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemProp */

$this->title = Yii::t('app', 'Update Item Prop: {nameAttribute}', [
    'nameAttribute' => $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Props'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->pid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="item-prop-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
