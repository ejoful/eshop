<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemPropValue */

$this->title = Yii::t('app', 'Update Item Prop Value: {nameAttribute}', [
    'nameAttribute' => $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Prop Values'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'vid' => $model->vid, 'cid' => $model->cid, 'pid' => $model->pid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="item-prop-value-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
