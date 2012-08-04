<?php
/**
 * @property id
 * @property title
 *
 * @property products
 */
class Category extends ActiveRecordModel
{
    const PAGE_SIZE = 10;

    const UPLOAD_PATH = 'upload/category';

    const LFT   = 'lft';
    const RGT   = 'rgt';
    const DEPTH = 'depth';

    public $parentId;


    public static function model($className = __CLASS__)
    {
        return parent::model($className);
    }


    public function tableName()
    {
        return 'category';
    }


    public function name()
    {
        return 'Модель Category';
    }


    public function rules()
    {
        return array(
            array(
                'title, icon, alias', 'length',
                'max' => 250
            ), array(
                'title', 'required'
            ), array(
                'for_price, text', 'length',
                'max' => 25000
            ), array(
                'is_published, back_left, back_center', 'safe'
            ), array(
                'text', 'length',
                'max' => 25000
            ), array(
                'title', 'safe',
                'on' => 'search'
            ),
        );
    }


    public function relations()
    {
        return array();
    }


    public function search()
    {
        $criteria = new CDbCriteria;
        $criteria->compare('title', $this->title, true);
        $criteria->order = 'lft ASC';
        return new ActiveDataProvider(get_class($this), array(
            'criteria'   => $criteria
        ));
    }


    public function behaviors()
    {
        return CMap::mergeArray(parent::behaviors(), array(
            'tree'       => array(
                'class'         => 'application.components.activeRecordBehaviors.NestedSetBehavior',
                'leftAttribute' => self::LFT,
                'rightAttribute'=> self::RGT,
                'levelAttribute'=> self::DEPTH,
            ),
            'MetaTagBehavior' => array(
                'class' => 'application.components.activeRecordBehaviors.MetaTagBehavior'
            )
        ));
    }


    public function scopes()
    {
        return array(
            'orderByLft'   => array('order'=> self::LFT),
            'orderByRgt'   => array('order'=> self::RGT),
            'orderByDepth' => array('order'=> self::DEPTH),
            'isSystem'     => array('condition'=> 'is_system=1'),
        );
    }


    public function uploadFiles()
    {
        return array(
            'icon'        => array(
                'dir' => self::UPLOAD_PATH
            ),
            'back_left'   => array('dir' => self::UPLOAD_PATH),
            'back_center' => array('dir' => self::UPLOAD_PATH)

        );
    }


    /*
    * Выводит дерево в виде вложенных списков, без рекурсии
    */
    public static function getHtmlTree($a = true, $depth = null)
    {
        $models = self::getRoot()->descendants($depth)->findAll();
        $depth  = 0;
        $res    = '';

        foreach ($models as $n=> $item)
        {
            if ($item->depth == $depth)
            {
                $res .= CHtml::closeTag('li') . "\n";
            }
            else if ($item->depth > $depth)
            {
                $res .= CHtml::openTag('ul') . "\n";
            }
            else
            {
                $res .= CHtml::closeTag('li') . "\n";

                for ($i = $depth - $item->depth; $i; $i--)
                {
                    $res .= CHtml::closeTag('ul') . "\n";
                    $res .= CHtml::closeTag('li') . "\n";
                }
            }

            $res .= CHtml::openTag('li', array(
                'id'   => 'items_' . $item->id,
            ));
            $res .= CHtml::tag('div', array(), CHtml::link($item->title, $a ? $item->href : $item->priceHref, array(
                'class' => 'depth_' . $item->depth
            )));
            $depth = $item->depth;
        }

        for ($i = $depth; $i; $i--)
        {
            $res .= CHtml::closeTag('li') . "\n";
            $res .= CHtml::closeTag('ul') . "\n";
        }

        return $res;
    }


    public static function getTreeCheckList()
    {
        $models = self::getRoot()->descendants()->findAll();

        $res = '';
        foreach ($models as $n=> $item)
        {
            $res .= '<dl style="margin-left:' . (30 * ($item->depth - 2)) . 'px">';
            $res .= '<dt>';
            $res .= CHtml::checkBox("Categories[{$item->id}]", false, array('value'=> $item->id));
            $res .= '</dt>';
            $res .= '<dd>';
            $res .= CHtml::label($item->title, '');
            $res .= '</dd>';
            $res .= '</dl>';
        }

        return $res;
    }


    public static function getRoot()
    {
        return self::model()->roots()->find();
    }


    /**** URL's and LINK's *****/

    public function getHref()
    {
        if ($this->alias)
        {
            $data = array('alias' => $this->alias);
        }
        else
        {
            $data = array('id'=> $this->id);
        }
        return Yii::app()->controller->url('/content/category/view', $data);
    }


    public function getBackLeft()
    {
        if ($this->back_left)
        {
            $img = '/' . self::UPLOAD_PATH . '/' . $this->back_left;
        }
        else
        {
            if ($this->depth > 2 && $this->parent->back_left)
            {
                $img = '/' . self::UPLOAD_PATH . '/' . $this->parent->back_left;
                ;
            }
            else
            {
                $img = '/images/left.jpg';
            }
        }

        return "style='background: url({$img}) no-repeat'";
    }


    public function getBackCenter()
    {
        if ($this->back_center)
        {
            $img = '/' . self::UPLOAD_PATH . '/' . $this->back_center;
            return "style='background: url({$img}) no-repeat'";
        }
        else
        {
            return '';
        }
    }


    public function getAddChildUrl()
    {
        return Yii::app()->controller->url('/content/categoryAdmin/create', array('parent_id'=> $this->id));
    }


    public function getManageUrl()
    {
        return Yii::app()->controller->url('/content/categoryAdmin/manage');
    }


    public function getPriceHref()
    {
        return Yii::app()->controller->url('/content/category/price', array('id'=> $this->id));
    }


    /***** Events *****/

    public function beforeSave()
    {
        if (parent::beforeSave())
        {
            return true;
        }
        return false;
    }


    public function beforeDelete()
    {
        if (parent::beforeDelete())
        {
            return true;
        }
        return false;
    }
}