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
        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $this->render('service', array('html' => Category::getHtmlTree()));
    }


    public function actionPrices()
    {
        $this->cur_link = 'price';
        $page = Page::model()->findByAttributes(array('url'=>'prices'));
        $this->render('prices', array('html' => Category::getHtmlTree(false, 1), 'page' => $page));
    }


    public function actionPrice($id = null, $alias = null)
    {
        $model = $category = $this->loadModel($alias ? $alias : $id, array('published'), $alias ? 'alias' : null);

        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $this->cur_link = 'price';
        $this->clips['sidebar_top'] = $model->sidebar_top;

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
        $this->clips['sidebar_top'] = $model->sidebar_top;

        $this->render('view', array(
            'model' => $category
        ));
    }

    public function actionIndex()
    {

    }
}


