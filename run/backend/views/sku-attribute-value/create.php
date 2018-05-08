<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\SkuAttributeValue */

$this->title = Yii::t('app', 'Create Sku Attribute Value');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Sku Attribute Values'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="sku-attribute-value-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
