<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\Attribute */

$this->title = Yii::t('app', 'Update Attribute: {nameAttribute}', [
    'nameAttribute' => $model->name,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Attributes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->attrid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="attribute-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
