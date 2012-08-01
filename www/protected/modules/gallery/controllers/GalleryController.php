<?php

class GalleryController extends BaseController
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
        $this->cur_link = 'photo';
        $this->clips['sidebar_top'] = Setting::getValue('gallery_sidebar_top');

        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';

        $this->render('view', array(
            'model'      => $this->loadModel($id, array('published'))
        ));
    }


    public function actionIndex()
    {
        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $model         = Gallery::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria'   => $model->published()->ordered()->getDbCriteria(),
            'pagination' => false
        ));

        $this->cur_link = 'photo';
        $this->clips['sidebar_top'] = Setting::getValue('gallery_sidebar_top');

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


