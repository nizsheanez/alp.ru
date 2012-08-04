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
        $this->clips['sidebar_top'] = Setting::getValue('reviews_sidebar_top');

        $this->render('view', array(
            'model'      => $this->loadModel($id, array('published'))
        ));
    }


    public function actionIndex()
    {
        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';

        $model         = Review::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria'   => $model->published()->ordered()->getDbCriteria(),
            'pagination' => false
        ));

        $this->cur_link = 'reviews';
        $this->clips['sidebar_top'] = Setting::getValue('reviews_sidebar_top');

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


