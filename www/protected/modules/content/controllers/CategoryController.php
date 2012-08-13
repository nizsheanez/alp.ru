<?php

class CategoryController extends BaseController
{
    public static function actionsTitles()
    {
        return array(
            "View"    => "Просмотр товара",
            "Index"   => "Список товаров",
            "Service" => "Сервис",
            "Prices" => "Цены",
            "Price" => "Цена",
        );
    }


    public function actionService()
    {
        $page = Page::model()->findByAttributes(array('url'=>'service'));
        $this->setMetaTags($page);
        $this->sidebar_top = $page->sidebar_top;
        $this->sidebar_top_title = $page->sidebar_top_title;

        $this->render('service', array('html' => Category::getHtmlTree()));
    }


    public function actionPrices()
    {
        $page = Page::model()->findByAttributes(array('url'=>'prices'));
        $this->setMetaTags($page);
        $this->sidebar_top = $page->sidebar_top;
        $this->page_title = $page->title;
        $this->sidebar_top_title = $page->sidebar_top_title;


        $this->cur_link = 'prices';
        $this->render('prices', array('html' => Category::getHtmlTree(false, 1), 'page' => $page));
    }


    public function actionPrice($id = null, $alias = null)
    {
        $model = $category = $this->loadModel($alias ? $alias : $id, array('published'), $alias ? 'alias' : null);

        $this->cur_link = 'prices';
        $this->sidebar_top = $model->sidebar_top;
        $this->sidebar_top_title = $model->sidebar_top_title;
        $this->setMetaTags($model);

        $page = Page::model()->findByAttributes(array('url'=>'prices'));
        $this->page_title = $page->title;


        $page = Page::model()->findByAttributes(array('url'=>'prices'));
        $this->page_title = $page->title;
        $this->setMetaTags($page);


        $this->cur_chapter = $model->alias;

        $this->render('price', array(
            'model' => $category
        ));
    }


    public function actionView($id = null, $alias = null)
    {
        $model = $category = $this->loadModel($alias ? $alias : $id, array('published'), $alias ? 'alias' : null);

        $this->setMetaTags($model);
        $this->cur_chapter = $model->alias;
        $this->sidebar_top = $model->sidebar_top;
        $this->sidebar_top_title = $model->sidebar_top_title;

        $this->render('view', array(
            'model' => $category
        ));
    }

    public function actionIndex()
    {

    }
}


