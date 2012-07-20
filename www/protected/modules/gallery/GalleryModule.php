<?php

class GalleryModule extends WebModule
{
    public static function name()
    {
        return 'Галлерея фотографий';
    }


    public static function description()
    {
        return '';
    }


    public static function version()
    {
        return '1.0';
    }


	public function init()
	{
		$this->setImport(array(
			'gallery.models.*',
			'gallery.components.*',
		));
	}

    public static function adminMenu()
    {
        return array(
			'Все галлереи'      => '/gallery/galleryAdmin/manage',
			'Добавить галлерею' => '/gallery/galleryAdmin/create'
        );
    }
}
