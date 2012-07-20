<?php
$menu_items = array(
    'cleaning'  => '<p>КЛИНИНГОВЫЕ<br/>УСЛУГИ</p>',
    'fasads'    => '<p>ФАСАДНЫЕ<br/>РАБОТЫ</p>',
    'crovel'    => '<p>КРОВЕЛЬНЫЕ<br/>РАБОТЫ</p>',
    'media'     => '<p>МЕТАЛЛО-<br/>КОНСТРУКЦИИ</p>',
    'electro'   => '<p>ЭЛЕКТРОМОНТАЖ<br/>ОБОРУДОВАНИЯ</p>',
    'light'     => '<p>СВЕТ, РЕКЛАМА,<br/>БАННЕРЫ</p>',
    'shnow'     => '<p>ОЧИСТКА<br/>ОТ СНЕГА</p>',
    'condition' => '<p>МОНТАЖ КОНДИЦИОНЕРОВ</p>',
    'private'   => '<p>ЧАСТНЫМ<br/>ЗАКАЗЧИКАМ</p>'
);
?>
<ul class="top-menu">
    <?php
    foreach ($menu_items as $key => $val)
    {
        $class = Yii::app()->controller->cur_chapter == $key ? ' active' : '';
        ?>
        <li class="<?php echo $key . $class ?>">
            <a href="/chapter/<?php echo $key ?>">
                <span></span>
                <?php echo $val ?>
            </a>
        </li>
        <?php } ?>
</ul>