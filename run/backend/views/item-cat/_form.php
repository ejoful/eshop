<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemCat */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-cat-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cid')->textInput() ?>

    <?= $form->field($model, 'features')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'is_parent')->textInput() ?>

    <?= $form->field($model, 'spell')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'spuid')->textInput() ?>

    <?= $form->field($model, 'leaf')->textInput() ?>

    <?= $form->field($model, 'parent_cid')->textInput() ?>

    <?= $form->field($model, 'sort_order')->textInput() ?>

    <?= $form->field($model, 'status')->textInput() ?>

    <?= $form->field($model, 'taosir_cat')->textInput() ?>

    <?= $form->field($model, 'created')->textInput() ?>

    <?= $form->field($model, 'modified')->textInput() ?>

    <?= $form->field($model, 'depth')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
