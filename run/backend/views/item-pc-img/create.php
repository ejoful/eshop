<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ItemPcImg */

$this->title = Yii::t('app', 'Create Item Pc Img');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Pc Imgs'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-pc-img-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
