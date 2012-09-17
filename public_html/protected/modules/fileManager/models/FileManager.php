<?php

class FileManager extends ActiveRecordModel
{
    const UPLOAD_PATH  = 'upload/fileManager';
    const FILE_POSTFIX = '';

    public $extension;

    public $size;

    public $error;


    public function name()
    {
        return 'Файловый менеджер';
    }


    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }


    public function tableName()
    {
        return 'file_manager';
    }


    public function primaryKey()
    {
        return 'id';
    }


    public function rules()
    {
        return array(
            array(
                'nameWithoutExt', 'length',
                'min'      => 1,
                'max'      => 900,
                'tooShort' => 'Название файла должно быть меньше 1 сим.',
                'tooLong'  => 'Пожалуйста, сократите наименование файла до 900 сим.'
            )
        );
    }


    public function behaviors()
    {
        return array( //            'sortable' => array(
//                'class' => 'application.components.activeRecordBehaviors.SortableBehavior'
//            )
        );
    }


    public function parent($model_id, $id)
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "$alias.model_id='$model_id' AND $alias.object_id='$id'",
            'order'     => "$alias.order DESC"
        ));
        return $this;
    }


    public function tag($tag)
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "$alias.tag='$tag'"
        ));
        return $this;
    }


    public function getDeleteUrl()
    {
        return Yii::app()->controller->url('fileManagerAdmin/delete', array('id' => $this->id));
    }


    public function setExt($val)
    {
        $this->extension = $val;
        $this->mimeType  = $this->mimeByExt($val);
    }


    public function getIsImage()
    {
        return in_array($this->extension, array(
            'png', 'jpeg', 'jpg', 'tiff', 'ief', 'gif'
        ));
    }


    public function getIsSound()
    {
        return in_array($this->extension, array(
            'wma', 'mp3'
        ));
    }


    public function getIsExcel()
    {
        return in_array($this->extension, array(
            'xl', 'xla', 'xlb', 'xlc', 'xld', 'xlk', 'xll', 'xlm', 'xls', 'xlt', 'xlv', 'xlw'
        ));
    }


    public function getIsWord()
    {
        return in_array($this->extension, array(
            'doc', 'dot', 'docx'
        ));
    }


    public function getIsArchive()
    {
        return in_array($this->extension, array(
            'zip', 'rar', 'tar', 'gz'
        ));
    }


    public function getIcon()
    {
        $folder = Yii::app()->getModule('fileManager')->assetsUrl() . '/img/fileIcons/';
        if ($this->isImage)
        {
            $name = 'image';
        }
        elseif ($this->isSound)
        {
            $name = 'sound';
        }
        elseif ($this->isExcel)
        {
            $name = 'excel';
        }
        elseif ($this->isWord)
        {
            $name = 'word';
        }
        elseif ($this->isArchive)
        {
            $name = 'archive';
        }
        elseif (is_file('.' . $folder . $this->extension . '.png'))
        {
            $name = $this->extension;
        }
        else
        {
            $name = 'any';
        }
        return CHtml::image($folder . $name . '.png', '', array('height' => 24));
    }


    public function getHandler($field = false)
    {
        Yii::import('upload.extensions.upload.Upload');
        $param = $field ? $_FILES[$field] : self::UPLOAD_PATH . $this->name;
        return new Upload($param);
    }


    public function save()
    {
        if (!parent::save())
        {
            $this->error = Yii::t('FileManagerModule.main', 'Не удалось сохранить изменения');
            return false;
        }
        return true;
    }


    public static function str2url($str)
    {
        $str = self::rus2translit($str); // переводим в транслит
        $str = mb_strtolower($str); // в нижний регистр
        $str = preg_replace('~[^-a-z0-9_\s]+~u', '-', $str); // заменям все ненужное нам на "-"
        $str = trim($str, "-"); // удаляем начальные и конечные '-'
        return $str;
    }


    public function setExtraProperties($field, &$handler, $options)
    {
        $info = getimagesize($_FILES[$field]['tmp_name']);

        if (isset($options['save_y']) && $options['save_y'])
        {
            $size             = isset($options['min_y']) ? $options['min_y'] : 0;
            $handler->image_y = ($info[1] > $size) ? $info[1] : $size;
        }

        if (isset($options['save_x']) && $options['save_x'])
        {
            $size             = isset($options['min_x']) ? $options['min_x'] : 0;
            $handler->image_x = ($info[0] > $size) ? $info[0] : $size;
        }
    }


    public function saveFile()
    {
        $file     = CUploadedFile::getInstanceByName('file');
        $new_file = FileSystem::vaultResolveCollision(self::UPLOAD_PATH, $file->name);
        if ($file->saveAs('./' . self::UPLOAD_PATH . '/' . $new_file))
        {
            $this->name = $new_file;
            $this->title = $this->name;
            $this->fill();
            return true;
        }
        else
        {
            $this->error = $file->getError();
            return false;
        }
    }


    /**
     * @return string formatted file size
     */
    public function getFormatSize()
    {
        $file = self::UPLOAD_PATH . $this->name;
        $size = $this->size;

        $metrics[0] = 'bytes';
        $metrics[1] = 'KB';
        $metrics[2] = 'MB';
        $metrics[3] = 'GB';
        $metric     = 0;

        while (floor($size / 1024) > 0)
        {
            ++$metric;
            $size /= 1024;
        }

        $ret = round($size, 1) . " " . (isset($metrics[$metric]) ? $metrics[$metric] : '??');
        return $ret;
    }


    public function getSrc()
    {
        return Yii::app()->baseUrl . '/' . self::UPLOAD_PATH . '/' . $this->name;
    }


    public function afterFind()
    {
        parent::afterFind();
        $this->fill();
    }


    public function fill()
    {
        $file            = self::UPLOAD_PATH . '/' . $this->name;
        $this->size      = ($file &&
            is_file($file)) ? filesize($file) : NULL; //$this->formatSize($this->basePath.$this->name);
        $this->extension = pathinfo($this->name, PATHINFO_EXTENSION);
    }


    public function getNameWithoutExt()
    {
        $name   = pathinfo($this->name, PATHINFO_FILENAME);
        $params = array(' ' => '');
        if (self::FILE_POSTFIX)
        {
            $params[self::FILE_POSTFIX] = '';
        }
        return strtr($name, $params);
    }


    public function beforeSave()
    {
        if (parent::beforeSave())
        {
            if ($this->isNewRecord)
            {
                $model = FileManager::model()->parent($this->model_id, $this->object_id)->limit(1)
                    ->find();
                $this->order = $model ? $model->order + 1 : 1;
                $this->title;
            }

            return true;
        }
        else
        {
            return false;
        }
    }


    public function beforeDelete()
    {
        if (parent::beforeDelete())
        {
            if (is_file(self::UPLOAD_PATH . $this->name))
            {
                FileSystem::deleteFileWithSimilarNames(self::UPLOAD_PATH . '/crop', $this->name);
                FileSystem::deleteFileWithSimilarNames(self::UPLOAD_PATH . '/watermark', $this->name);
                @unlink('./' . self::UPLOAD_PATH . $this->name);
            }

            return true;
        }

        return false;
    }


    public function search()
    {
        $criteria = new CDbCriteria;
        $criteria->compare('object_id', $this->object_id, true);
        $criteria->compare('model_id', $this->model_id, true);
        $criteria->compare('tag', $this->tag, true);
        $criteria->compare('title', $this->title, true);
        $criteria->compare('order', $this->order);

        return new ActiveDataProvider(get_class($this), array(
            'criteria' => $criteria
        ));
    }


    public function getContent()
    {
        if (file_exists($this->path))
        {
            return file_get_contents($this->path);
        }
    }


    public function getUrl()
    {
        return "http://" . $_SERVER["HTTP_HOST"] . "/" . self::UPLOAD_PATH . $this->name;
    }

    public function crop($width = null, $height = null, $crop = false, $attrs = '')
    {
        return ImageHelper::thumb($this->path, $this->name, $width, $height, $crop, $attrs);
    }
}
