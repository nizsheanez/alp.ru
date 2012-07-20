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
        $this->back_left   = '';
        $this->back_center = '';
        $this->cur_link = 'reviews';


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

        $this->back_left   = '';
        $this->back_center = '';
        $this->cur_link = 'reviews';


        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


