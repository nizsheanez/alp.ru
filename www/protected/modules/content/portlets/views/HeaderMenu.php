<?php
$data = array(
    'main'       => '/',
    'cooperation'=> "/page/cooperation",
    "reviews"    => "/reviews",
    "photo"      => "/photo",
    "price"      => "/prices",
    "contacts"   => "/page/contacts"
);
?>
<div class="header-menu-wrapper">
    <ul class="header-menu">
        <?php
        $i = 0;
        foreach ($links as $link)
        {
            if (Yii::app()->controller->cur_link)
            {
                $cur_link = Yii::app()->controller->cur_link;
            }
            else
            {
                $cur_link =  parse_url(Yii::app()->request->getRequestUri(), PHP_URL_PATH);
            }
            $class    = $cur_link == $link->url ? ' active' : ' no_active';
            echo CHtml::tag('li', array('class'=> $class), CHtml::link($link->title, $link->url));
            if (count($links) != ++$i)
            {
                echo Chtml::tag('li', array('class'=>"divider"));
            }
        }
        ?>
    </ul>
</div>