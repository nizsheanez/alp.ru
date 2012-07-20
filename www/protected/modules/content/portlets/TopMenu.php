<?php

class TopMenu extends Portlet
{	
	const MENU_NAME = 'Верхнее меню';

	public function renderContent()
	{
		$this->render('TopMenu');
	}
}