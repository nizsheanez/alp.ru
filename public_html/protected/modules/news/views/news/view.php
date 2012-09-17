<?php $this->page_title = 'Наши <span>Работы</span>'; ?>
<div class="news-detail">
    <h3><?php echo $model->title . ' | ' . date('d.m.Y', strtotime($model->date)) ?></h3>
    <?php echo $model->content; ?>

    <br clear='all'/>

    <?php $this->widget('fileManager.portlets.FileList', array(
    'model' => $model,
    'tag'   => 'files'
)) ?>
</div>