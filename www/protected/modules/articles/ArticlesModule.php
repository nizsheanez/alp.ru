<?php

class ArticlesModule extends WebModule
{
    public static $active = false;


    public static function name()
    {
        return 'База знаний';
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
            'articles.controllers.*',
			'articles.models.*',
            'articles.portlets.*',
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
			'Все материалы'     => '/articles/articleAdmin/manage',
			'Добавить материал' => '/articles/articleAdmin/create',
			'Список разделов'   => '/articles/articleSectionAdmin/manage',
			'Добавить раздел'   => '/articles/articleSectionAdmin/create'
        );
    }
}
