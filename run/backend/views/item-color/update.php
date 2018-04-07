<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemColor */

$this->title = Yii::t('app', 'Update Item Color: {nameAttribute}', [
    'nameAttribute' => $model->colorid,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Colors'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->colorid, 'url' => ['view', 'id' => $model->colorid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="item-color-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
