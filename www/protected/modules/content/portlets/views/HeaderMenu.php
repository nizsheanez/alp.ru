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
            $cur_link = parse_url(Yii::app()->request->getRequestUri(), PHP_URL_PATH);
            $url = strpos($link->url, '/') !== 0 ? '/'.$link->url : $link->url;
            $class    = $cur_link == $url ? ' active' : ' no_active';
            echo CHtml::tag('li', array('class'=> $class), CHtml::link($link->title, $url));
            if (count($links) != ++$i)
            {
                echo Chtml::tag('li', array('class'=>"divider"));
            }
        }
        ?>
    </ul>
</div>