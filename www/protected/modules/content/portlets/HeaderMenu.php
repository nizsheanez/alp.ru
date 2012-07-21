<?php

class HeaderMenu extends Portlet
{	
	public function renderContent()
	{
        $links = Menu::model()->findByPk(1)->links;
		$this->render('HeaderMenu', array('links' => $links));
	}
}