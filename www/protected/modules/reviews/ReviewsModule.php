<?php

class ReviewsModule extends WebModule
{
    public static function name()
    {
        return 'Отзывы';
    }


    public static function description()
    {
        return 'Новости сайта';
    }


    public static function version()
    {
        return '1.0';
    }


	public function init()
	{
		$this->setImport(array(
			'reviews.models.*',
			'reviews.components.*',
		));
	}

    public static function adminMenu()
    {
        return array(
			'Все отзывы'      => '/reviews/reviewAdmin/manage',
			'Добавить отзыв' => '/reviews/reviewAdmin/create'
        );
    }
}
