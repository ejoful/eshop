<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Cart */

$this->title = Yii::t('app', 'Update Cart: {nameAttribute}', [
    'nameAttribute' => $model->cartid,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Carts'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cartid, 'url' => ['view', 'id' => $model->cartid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="cart-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
