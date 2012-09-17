<?php

class NewsModule extends WebModule
{
    public static $active = true;

    public static function name()
    {
        return 'Новости';
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
			'news.models.*',
			'news.components.*',
		));
	}

	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			return true;
		}
		else
        {
            return false;
        }
	}


    public static function adminMenu()
    {
        return array(
			'Все новости'      => '/news/newsAdmin/manage/News_sort/date.desc',
			'Добавить новость' => '/news/newsAdmin/create'
        );
    }
}
