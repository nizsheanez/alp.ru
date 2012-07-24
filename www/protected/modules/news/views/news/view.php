<?php if (isset($thumb)): ?>
    <?php echo $thumb; ?>
    <br/>
    <br/>
<?php endif ?>

<?php echo $model->content; ?>

<br clear='all' />

<?php $this->widget('fileManager.portlets.FileList', array(
    'model' => $model,
    'tag' => 'files'
)) ?>



