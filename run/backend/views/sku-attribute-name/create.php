<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\SkuAttributeName */

$this->title = Yii::t('app', 'Create Sku Attribute Name');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sku Attribute Names'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sku-attribute-name-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
