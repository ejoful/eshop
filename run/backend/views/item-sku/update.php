<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemSku */

$this->title = Yii::t('app', 'Update Item Sku: {nameAttribute}', [
    'nameAttribute' => $model->skuId,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Skus'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->skuId, 'url' => ['view', 'id' => $model->skuId]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="item-sku-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
