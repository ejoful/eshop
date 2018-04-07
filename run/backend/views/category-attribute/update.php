<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model backend\models\CategoryAttribute */

$this->title = Yii::t('app', 'Update Category Attribute: {nameAttribute}', [
    'nameAttribute' => $model->catattrid,
]);
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Category Attributes'), 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->catattrid, 'url' => ['view', 'id' => $model->catattrid]];
$this->params['breadcrumbs'][] = Yii::t('app', 'Update');
?>
<div class="category-attribute-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
