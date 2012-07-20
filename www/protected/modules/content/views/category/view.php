<?php $this->page_title = $model->title; ?>
<div class="category">
    <div class="head">
        <div class="history">
            <div class="chapter"></div>
            <?php
            if ($model->depth > 2)
            {
                $title = strtr($model->parent->title, array('металлоконструкции'=>'металло-конструкции'));
                echo CHtml::link(
                    $title . "&nbsp;> ", $model->parent->href, array('class' => 'parent'));
            }?>
        </div>
        <div class="title">
            <?php echo $model->title ?>
        </div>
    </div>
    <div class="details">
        <div class="text">
            <div class="decoration">
                <div class="children">
                    <?php echo $this->renderPartial('_children', array('model'=> $model)) ?>
                </div>
                <div class="icon">
                    <?php
                    if ($model->icon)
                    {
                        echo ImageHelper::thumb(Category::UPLOAD_PATH, $model->icon, 153, 104);
                    } ?>
                </div>
            </div>

            <?php echo $model->text ?>
        </div>
    </div>

</div>

