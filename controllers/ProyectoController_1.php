<?php

namespace app\controllers;

use Yii;
use app\modules\catalogs\models\Proyecto;
use app\modules\catalogs\models\ProyectoSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\UploadedFile;

/**
 * ProyectoController implements the CRUD actions for Proyecto model.
 */
class ProyectoController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Proyecto models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProyectoSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Proyecto model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Proyecto model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Proyecto();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            // get the uploaded file instance. for multiple file uploads
            // the following data will return an array
            $image = UploadedFile::getInstance($model, 'image');

            // store the source file name
            $model->NombreAdjunto = $image->name;
            $ext = pathinfo($image->name, PATHINFO_EXTENSION);
//            $ext = end((explode(".", $image->name)));

            // generate a unique file name
            $model->ArchivoAdjunto = Yii::$app->security->generateRandomString().".{$ext}";

            // the path to save file, you can set an uploadPath
            // in Yii::$app->params (as used in example below)
            $path = Yii::$app->params['uploadPath'] . $model->ArchivoAdjunto;

            if($model->save()){
                $image->saveAs($path);
                return $this->redirect(['/catalogs/proyecto', 'id' => $model->IdProyecto]);
            } else {
                // error in saving model
            }            
            
            
            
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Proyecto model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['view', 'id' => $model->IdProyecto]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Proyecto model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Proyecto model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Proyecto the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Proyecto::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
