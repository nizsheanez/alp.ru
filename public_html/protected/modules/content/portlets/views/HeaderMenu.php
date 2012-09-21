<?php
$data = array(
    'main'       => '/',
    'cooperation'=> "/page/cooperation",
    "reviews"    => "/reviews",
    "photo"      => "/photo",
    "price"      => "/prices",
    "service"   => "/service",
    "contacts"   => "/page/contacts"
);
?>
<div class="header-menu-wrapper">
    <ul class="header-menu">
        <?php
        $i = 0;
        foreach ($links as $link)
        {
            $cur_link = Yii::app()->controller->cur_link ? Yii::app()->controller->cur_link : parse_url(Yii::app()->request->getRequestUri(), PHP_URL_PATH);
            $url = strpos($link->url, '/') !== 0 ? '/'.$link->url : $link->url;
            $cmp_url = isset($data[$cur_link]) ? $data[$cur_link] : $cur_link;
            $class    = $cmp_url == $url ? ' active' : ' no_active';
            echo CHtml::tag('li', array('class'=> $class), CHtml::link($link->title, $url));
            if (count($links) != ++$i)
            {
                echo Chtml::tag('li', array('class'=>"divider"));
            }
        }
        ?>
    </ul>
</div>