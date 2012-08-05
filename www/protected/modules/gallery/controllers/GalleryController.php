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
        $page = Page::model()->findAllByAttributes(array('url' => 'gallery'));
        $this->setMetaTags($page);
        $this->clips['sidebar_top'] = $page->sidebar_top;

        $this->meta_title = 'ВертикАльП - промышленный альпинизм, любые виды высотных работ';
        $model         = Gallery::model();
        $data_provider = new ActiveDataProvider(get_class($model), array(
            'criteria'   => $model->published()->ordered()->getDbCriteria()
        ));
        $pagination = new YearPagination();
        $pagination->model = $model;
        $data_provider->setPagination($pagination);

        $this->cur_link = 'photo';

        $this->render('index', array(
            'data_provider' => $data_provider
        ));
    }

}


