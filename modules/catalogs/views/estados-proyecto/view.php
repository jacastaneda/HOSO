<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\EstadosProyecto */
?>
<div class="estados-proyecto-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdEstadoProyecto',
            'EstadoProyecto',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
