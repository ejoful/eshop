<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\ItemPropSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="item-prop-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'pid') ?>

    <?= $form->field($model, 'child_template') ?>

    <?= $form->field($model, 'cid') ?>

    <?= $form->field($model, 'features') ?>

    <?= $form->field($model, 'is_allow_alias') ?>

    <?php // echo $form->field($model, 'is_color_prop') ?>

    <?php // echo $form->field($model, 'is_enum_prop') ?>

    <?php // echo $form->field($model, 'is_input_prop') ?>

    <?php // echo $form->field($model, 'is_item_prop') ?>

    <?php // echo $form->field($model, 'is_key_prop') ?>

    <?php // echo $form->field($model, 'is_material') ?>

    <?php // echo $form->field($model, 'is_sale_prop') ?>

    <?php // echo $form->field($model, 'is_taosir') ?>

    <?php // echo $form->field($model, 'material_do') ?>

    <?php // echo $form->field($model, 'modified_time') ?>

    <?php // echo $form->field($model, 'modified_type') ?>

    <?php // echo $form->field($model, 'multi') ?>

    <?php // echo $form->field($model, 'must') ?>

    <?php // echo $form->field($model, 'name') ?>

    <?php // echo $form->field($model, 'parent_pid') ?>

    <?php // echo $form->field($model, 'parent_vid') ?>

    <?php // echo $form->field($model, 'required') ?>

    <?php // echo $form->field($model, 'sort_order') ?>

    <?php // echo $form->field($model, 'status') ?>

    <?php // echo $form->field($model, 'taosir_do') ?>

    <?php // echo $form->field($model, 'child_path') ?>

    <?php // echo $form->field($model, 'type') ?>

    <?php // echo $form->field($model, 'attr_keys') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
