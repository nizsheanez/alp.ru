<?php

class ReviewController extends BaseController
{
    public static function actionsTitles()
    {
        return array(
            "View"  => "Просмотр новости",
            "Index" => "Все отзывы",
        );
    }


    public function actionView($id)
    {
        $this->cur_link = 'reviews';
        $page = Page::model()->findByAttributes(array('url' => 'news'));
        $this->sidebar_top = $page->sidebar_top;
        $this->sidebar_top_title = $page->sidebar_top_title;

        $this->render('view', array(
            'model'      => $this->loadModel($id, array('published'))
        ));
    }


    public function actionIndex()
    {
        $page = Page::model()->findByAttributes(array('url'=>'reviews'));
        $this->setMetaTags($page);
        $this->sidebar_top = $page->sidebar_top;
        $this->sidebar_top_title = $page->sidebar_top_title;
        $this->page_title = $page->title;

        $model         = Review::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria'   => $model->published()->ordered()->getDbCriteria(),
        ));
        $pagination = new YearPagination();
        $pagination->model = $model;
        $data_provider->setPagination($pagination);

        $this->cur_link = 'reviews';

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


