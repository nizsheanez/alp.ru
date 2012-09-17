<?php

class TopMenu extends Portlet
{	
	const MENU_NAME = 'Главное меню';

	public function renderContent()
	{
		$this->render('TopMenu');
	}
}