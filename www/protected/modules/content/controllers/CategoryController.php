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
        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $this->cur_link = 'price';
        $this->render('prices', array('html' => Category::getHtmlTree(false, 1)));
    }


    public function actionPrice($id = null, $alias = null)
    {
        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $this->cur_link = 'price';
        $model = $category = $this->loadModel($alias ? $alias : $id, array('published'), $alias ? 'alias' : null);

        $this->cur_chapter = $model->alias;
        $this->back_center = $model->getBackCenter();
        $this->back_left   = $model->getBackLeft();

        $this->render('price', array(
            'model' => $category
        ));
    }


    public function actionView($id = null, $alias = null)
    {
        $model = $category = $this->loadModel($alias ? $alias : $id, array('published'), $alias ? 'alias' : null);

        $this->cur_chapter = $model->alias;
        $this->back_center = $model->getBackCenter();
        $this->back_left   = $model->getBackLeft();

        $this->render('view', array(
            'model' => $category
        ));
    }


    public function actionIndex()
    {

    }
}


