<div class="title">Цены</div>
<br/>
    <div class="text">
        <?php echo Page::model()->findByAttributes(array('url'=>'prices'))->getContent(); ?>
    </div>
<br/>

<div class="service">
    <?php echo $html ?>
</div>