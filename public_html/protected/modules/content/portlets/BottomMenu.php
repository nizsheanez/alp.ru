<?php

class BottomMenu extends Portlet
{	
	const MENU_NAME = 'Нижнее меню';

	public function renderContent()
	{
        $sections = Menu::model()->findByAttributes(array('name' => self::MENU_NAME))
                                 ->getSections();

		$this->render('BottomMenu', array('sections' => $sections));
	}
}