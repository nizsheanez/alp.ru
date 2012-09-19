<?php

class Gallery extends ActiveRecordModel
{
    const PAGE_SIZE = 15;

    const PHOTOS_DIR = 'upload/gallery';

    const STATE_ACTIVE = '1';
    const STATE_HIDDEN = '0';

    const PHOTO_SMALL_WIDTH  = "230";
    const PHOTO_SMALL_HEIGHT = "200";
    const PHOTO_BIG_WIDTH    = "580";


    public function name()
    {
        return 'Галерея';
    }


    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }


    public function behaviors()
    {
        return CMap::mergeArray(parent::behaviors(), array(
            'FileManager'     => array(
                'class'          => 'application.components.activeRecordBehaviors.AttachmentBehavior',
                'attached_model' => 'FileManager'
            ),
            'MetaTagBehavior' => array(
                'class' => 'application.components.activeRecordBehaviors.MetaTagBehavior'
            ),
            'Sortable'=>array(
                'class' => 'ext.sortable.SortableBehavior'
            )
        ));
    }


    public function tableName()
    {
        return 'gallery';
    }


    public function scopes()
    {
        return array(
            'last'   => array('order' => 'date DESC'),
            'active' => array('condition' => "is_published = '" . self::STATE_ACTIVE . "'")
        );
    }

    public function ordered()
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->mergeWith(array(
            'order' => $alias.'.order DESC'
        ));
        return $this;
    }

    public $roles;


    public function rules()
    {
        return array(
            array(
                'title, is_published', 'required'
            ), array(
                'meta_tags, roles, date', 'safe',
            ), array(
                'title', 'length',
                'max' => 250
            ), array(
                'id, user_id, title, text, state, date, date_create', 'safe',
                'on' => 'search'
            ),
        );
    }


    public function relations()
    {
        return array(
            'files'    => array(
                self::HAS_MANY, 'FileManager', 'object_id',
                'condition' => 'files.model_id = "' . get_class($this) . '" AND files.tag="files"',
                'order'     => 'files.order DESC'
            )
        );
    }


    public function search()
    {
        $alias = $this->getTableAlias();

        $criteria = new CDbCriteria;
        $criteria->compare($alias . '.id', $this->id, true);
        $criteria->compare($alias . '.title', $this->title, true);

        $criteria->order = $alias . '.order DESC';


        return new ActiveDataProvider(get_class($this), array(
            'criteria' => $criteria
        ));
    }


    public function beforeSave()
    {
        if (parent::beforeSave())
        {
            return true;
        }
    }


    public function getContent()
    {
        if (RbacModule::isAllow('GalleryAdmin_Update'))
        {
            $this->text .= "<br/> <a href='{$this->updateUrl}' class='admin_link'>Редактировать</a>";
        }

        return $this->text;
    }


    public function getHref()
    {
        return Yii::app()->controller->url("/gallery/gallery/view", array('id' => $this->id));
    }


    public function getUpdateUrl()
    {
        return "/gallery/galleryAdmin/update/id/{$this->id}";
    }
}
