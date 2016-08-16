<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Carrera */
?>
<div class="carrera-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdCarrera',
            'Nombre',
            'NombreCorto',
            'IdFacultad',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
