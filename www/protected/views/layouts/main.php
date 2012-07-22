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
    $cs->registerCssFile(Yii::app()->assetManager->publish(
        Yii::getPathOfAlias('webroot.css.site') . '/style.less'));
    $cs->registerCoreScript('jquery');
    $cs->registerScriptFile('/js/site/scripts.js');
    ?>
</head>
<body>

<div class="container main">
    <div class="header">
        <div class="logo"></div>
        <div class="slogan">
            <?php echo Setting::getValue('slogan') ?>
        </div>
        <div class="phones">
            <div class="phone"><?php echo Setting::getValue('phone1') ?></div>
            <div class="phone"><?php echo Setting::getValue('phone2') ?></div>
            <div class="phone"><?php echo Setting::getValue('phone3') ?></div>
        </div>
        <div class="phone-icon"></div>
    </div>
    <div class="top-info">
        <div class="menu">
            <?php $this->widget('content.portlets.HeaderMenu') ?>
        </div>
        <div class="top_info_wrapper">
            <div class="pull-left man">
            </div>
            <div class="pull-left sidebar-top">
                <h3><?= $this->sidebar_top_header ?></h3>

                <div class="divider"></div>
                <?= $this->clips['sidebar_top'] ?>
            </div>
        </div>
        <div>
            <?php $this->widget('content.portlets.TopMenu') ?>
        </div>
    </div>
    <div class="clr"></div>
    <div class="content">
        <div class="pull-left content-left">
            <div class="divider-long"></div>
            <div class="page-header">
                <?php echo $this->page_title ?>
            </div>
            <div class="divider-long"></div>
            <?php echo $content; ?>
        </div>
        <div class="pull-left sidebar">
            <div class="divider-short"></div>
            <div class="page-header">Наши <span>Новости</span></div>
            <div class="divider-short"></div>
            <div class="sidebar-content">
                <?php
                foreach (News::model()->active()->limit(3)->findAll() as $model)
                {
                    echo CHtml::tag('h5', array('class' => 'news-title'), $model->title . ' |');
                    echo CHtml::tag('div', array('class' => 'news-date'),
                        date('d.m.Y', strtotime($model->date)));
                    $tail = CHtml::tag('span', array('class' => 'news-more'), 'фото &raquo;');
                    echo CHtml::tag('div', array('class' => 'news-preview'),
                        Yii::app()->text->cut($model->content, 220) . '... ' . $tail);
                }
                ?>
            </div>
        </div>
    </div>
    <div class="clr"></div>
    <footer>
        <div class="statistic">
            <?php echo Setting::getValue('footer')?>
        </div>
        <div class="copyright">Copyright © 2011 BSU, Все права защищены.</div>
    </footer>

</div>

</body>
</html>
