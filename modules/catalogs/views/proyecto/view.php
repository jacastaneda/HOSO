<?php

use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\modules\catalogs\models\Proyecto */
?>
<div class="proyecto-view">
 
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'IdProyecto',
            'NombreProyecto',
            'HorasSolicitadas',
            'Ubicacion',
            'FechaIni',
            'FechaFin',
            'IdInstitucion',
            'IdEstadoProyecto',
            'IdPersonaAsesor',
            'NumeroPersonas',
            'EstadoRegistro',
        ],
    ]) ?>

</div>
