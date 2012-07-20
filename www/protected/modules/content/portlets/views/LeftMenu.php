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
<ul class="sidebar-menu">
    <?php
    foreach ($data as $key=> $val)
    {
        $class = Yii::app()->controller->cur_link == $key ? ' active' : ' no_active';
        ?>
        <li class="<?php echo $key . $class ?>">
            <a href="<?php echo $val ?>"></a>
        </li>
        <?php
    }
    ?>
</ul>