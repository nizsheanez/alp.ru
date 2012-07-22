<?php

class NewsController extends BaseController
{
    public static function actionsTitles()
    {
        return array(
            "View"  => "Просмотр новости",
            "Index" => "Список новостей",
            "Mark"  => "Список новостей",
        );
    }


    public function actionView($id)
    {
        $this->render('view', array(
            'news'      => $this->loadModel($id, array('active'))
        ));
    }


    public function actionIndex()
    {
        $model         = News::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria' => $model->active()->last()->getDbCriteria()
        ));

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


