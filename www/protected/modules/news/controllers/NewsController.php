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
        $model = News::model()->findByAttributes(array('url' => 'news'));
        $this->sidebar_top = $model->sidebar_top;
        $this->sidebar_top_title = $model->sidebar_top_title;

        $this->render('view', array(
            'model'      => $this->loadModel($id, array('active'))
        ));
    }


    public function actionIndex()
    {
        $page = Page::model()->findByAttributes(array('url'=>'news'));
        $this->page_title = $page->title;
        $this->setMetaTags($page);
        $this->sidebar_top = $page->sidebar_top;
        $this->sidebar_top_title = $page->sidebar_top_title;

        $model         = News::model();
        $data_provider = new ActiveDataProvider($model->last());
        $pagination = new YearPagination();
        $pagination->model = $model;
        $data_provider->setPagination($pagination);

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


