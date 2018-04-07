<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ItemSku */

$this->title = Yii::t('app', 'Create Item Sku');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Skus'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-sku-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
