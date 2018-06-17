<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model backend\models\ItemPropValue */

$this->title = Yii::t('app', 'Create Item Prop Value');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Item Prop Values'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="item-prop-value-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
