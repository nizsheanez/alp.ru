<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title><?php echo $this->meta_title; ?></title>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">

    <meta name="description" content="<?php echo $this->meta_description ?>"/>
    <meta name="keywords" content="<?php echo $this->meta_keywords ?>"/>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>

    <?php
    $cs = Yii::app()->clientScript;
    $cs->registerCssFile(Yii::app()->assetManager->publish(Yii::getPathOfAlias('webroot.css.site') . '/style.less'));
    $cs->registerCoreScript('jquery');
    $cs->registerScriptFile('/js/site/scripts.js');
    ?>
</head>
<body>

<div class="container main">
    <div class="header">
        <div class="phone"><?php echo Setting::getValue('phone') ?></div>
    </div>
    <div class="top-info">
        <div class="menu">
            <?php $this->widget('content.portlets.HeaderMenu') ?>
        </div>
        <div class="top_info_wrapper">
            <div class="man">
            </div>
            <div class="pull-right sidebar-top">
                <h3><?= $this->sidebar_top_header ?></h3>
                <div class="divider"></div>
                <?= $this->clips['sidebar_top'] ?>
            </div>
        </div>
        <div>
            <?php $this->widget('content.portlets.TopMenu') ?>
        </div>
    </div>
    <div class="content">
        <div class="content-left">
            <div class="divider-long"></div>
            <div class="page-header">
                <?php echo $this->page_title ?>
            </div>
            <div class="divider-long"></div>
            <?php echo $content; ?>
        </div>
        <div class="pull-right sidebar">
            <?php echo $this->clips['sidebar'] ?>
        </div>
    </div>
    <footer>
        <div class="statistic">
            <?php echo Setting::getValue('footer')?>
        </div>
        <div class="copyright">Copyright © 2011 BSU, Все права защищены.</div>
    </footer>

</div>

</body>
</html>
