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
        $this->clips['sidebar_top'] = Setting::getValue('news_sidebar_top');

        $this->render('view', array(
            'model'      => $this->loadModel($id, array('active'))
        ));
    }


    public function actionIndex()
    {
        $page = Page::model()->findByAttributes(array('url'=>'news'));
        $this->setMetaTags($page);
        $this->clips['sidebar_top'] = $page->sidebar_top;

        $model         = News::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria' => $model->active()->last()->getDbCriteria(),
        ));
        $pagination = new YearPagination();
        $pagination->model = $model;
        $data_provider->setPagination($pagination);

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


