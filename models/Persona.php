<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "persona".
 *
 * @property integer $IdPersona
 * @property string $Nombres
 * @property string $Apellidos
 * @property string $CarnetEstudiante
 * @property string $CarnetEmpleado
 * @property string $DUI
 * @property string $NIT
 * @property string $Direccion
 * @property string $Telefono
 * @property string $Sexo
 * @property string $Cargo
 * @property integer $UserId
 * @property string $TipoPersona
 * @property integer $IdCarrera
 * @property string $ArchivoAdjunto
 * @property string $NombreAdjunto
 * @property string $EstadoRegistro
 *
 * @property Horas[] $horas
 * @property Proyecto[] $idProyectos
 * @property UserAccounts $user
 * @property Carrera $idCarrera
 * @property Proyecto[] $proyectos
 */
class Persona extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'persona';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['Nombres', 'Apellidos', 'Sexo'], 'required'],
            [['UserId', 'IdCarrera'], 'integer'],
            [['Nombres', 'Apellidos', 'CarnetEstudiante', 'CarnetEmpleado'], 'string', 'max' => 100],
            [['DUI', 'Direccion'], 'string', 'max' => 10],
            [['NIT'], 'string', 'max' => 17],
            [['Telefono'], 'string', 'max' => 8],
            [['Sexo', 'EstadoRegistro'], 'string', 'max' => 1],
            [['Cargo'], 'string', 'max' => 25],
            [['TipoPersona'], 'string', 'max' => 2],
            [['ArchivoAdjunto', 'NombreAdjunto'], 'string', 'max' => 150],
            [['UserId'], 'exist', 'skipOnError' => true, 'targetClass' => UserAccounts::className(), 'targetAttribute' => ['UserId' => 'id']],
            [['IdCarrera'], 'exist', 'skipOnError' => true, 'targetClass' => Carrera::className(), 'targetAttribute' => ['IdCarrera' => 'IdCarrera']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'IdPersona' => Yii::t('app', 'Id Persona'),
            'Nombres' => Yii::t('app', 'Nombres'),
            'Apellidos' => Yii::t('app', 'Apellidos'),
            'CarnetEstudiante' => Yii::t('app', 'Carnet Estudiante'),
            'CarnetEmpleado' => Yii::t('app', 'Carnet Empleado'),
            'DUI' => Yii::t('app', 'Dui'),
            'NIT' => Yii::t('app', 'Nit'),
            'Direccion' => Yii::t('app', 'Direccion'),
            'Telefono' => Yii::t('app', 'Telefono'),
            'Sexo' => Yii::t('app', 'Sexo'),
            'Cargo' => Yii::t('app', 'Cargo'),
            'UserId' => Yii::t('app', 'User ID'),
            'TipoPersona' => Yii::t('app', 'Tipo Persona'),
            'IdCarrera' => Yii::t('app', 'Id Carrera'),
            'ArchivoAdjunto' => Yii::t('app', 'Archivo Adjunto'),
            'NombreAdjunto' => Yii::t('app', 'Nombre Adjunto'),
            'EstadoRegistro' => Yii::t('app', 'Estado Registro'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getHoras()
    {
        return $this->hasMany(Horas::className(), ['IdPersona' => 'IdPersona'])->inverseOf('idPersona');
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdProyectos()
    {
        return $this->hasMany(Proyecto::className(), ['IdProyecto' => 'IdProyecto'])->viaTable('horas', ['IdPersona' => 'IdPersona']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(UserAccounts::className(), ['id' => 'UserId'])->inverseOf('personas');
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getIdCarrera()
    {
        return $this->hasOne(Carrera::className(), ['IdCarrera' => 'IdCarrera'])->inverseOf('personas');
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProyectos()
    {
        return $this->hasMany(Proyecto::className(), ['IdPersonaAsesor' => 'IdPersona'])->inverseOf('idPersonaAsesor');
    }

    /**
     * @inheritdoc
     * @return PersonaQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PersonaQuery(get_called_class());
    }
}
