<?php

abstract class ActiveRecordModel extends CActiveRecord
{
    const SCENARIO_CREATE = 'create';
    const SCENARIO_UPDATE = 'update';


    abstract public function name();


    public function behaviors()
    {
        return array(
            'NullValue'          => array(
                'class' => 'application.components.activeRecordBehaviors.NullValueBehavior'
            ),
            'UserForeignKey'     => array(
                'class' => 'application.components.activeRecordBehaviors.UserForeignKeyBehavior'
            ),
            'UploadFile'         => array(
                'class' => 'application.components.activeRecordBehaviors.UploadFileBehavior'
            ),
            'DateFormat'         => array(
                'class' => 'application.components.activeRecordBehaviors.DateFormatBehavior'
            ),
            'Timestamp'          => array(
                'class' => 'application.components.activeRecordBehaviors.TimestampBehavior'
            ),
            'MaxMin'             => array(
                'class' => 'application.components.activeRecordBehaviors.MaxMinBehavior'
            ),
            'Scopes'             => array(
                'class' => 'application.components.activeRecordBehaviors.ScopesBehavior'
            )
        );
    }


    public function attributeLabels()
    {
        $meta = $this->meta();

        $labels = array();

        foreach ($meta as $field_data)
        {
            $labels[$field_data["Field"]] = Yii::t('main', $field_data["Comment"]);
        }

        return $labels;
    }


    public function __get($name)
    {
        try
        {
            return parent::__get($name);
        } catch (CException $e)
        {
            $method_name = StringHelper::underscoreToCamelcase($name);
            $method_name = 'get' . ucfirst($method_name);

            if (method_exists($this, $method_name))
            {
                return $this->$method_name();
            }
            else
            {
                throw new CException($e->getMessage());
            }
        }
    }


    public function __set($name, $val)
    {
        try
        {
            return parent::__set($name, $val);
        } catch (CException $e)
        {
            $method_name = StringHelper::underscoreToCamelcase($name);
            $method_name = 'set' . ucfirst($method_name);

            if (method_exists($this, $method_name))
            {
                return $this->$method_name($val);
            }
            else
            {
                throw new CException($e->getMessage());
            }
        }
    }


    public function __toString()
    {
        $attributes = array(
            'name', 'title', 'description', 'id'
        );

        foreach ($attributes as $attribute)
        {
            if (array_key_exists($attribute, $this->attributes))
            {
                return $this->$attribute;
            }
        }
    }


    public function meta()
    {
        $table = Yii::app()->db->quoteTableName($this->tableName());
        $meta  = Yii::app()->db->cache(1000)->createCommand("SHOW FUll columns FROM " . $table)->queryAll();

        foreach ($meta as $ind => $field_data)
        {
            $meta[$field_data["Field"]] = $field_data;
            unset($meta[$ind]);
        }

        return $meta;
    }


    public function optionsTree($name = 'name', $id = null, $result = array(), $value = 'id', $spaces = 0, $parent_id = null)
    {
        $objects = $this->findAllByAttributes(array(
            'parent_id' => $parent_id
        ));

        foreach ($objects as $object)
        {
            if ($object->id == $id)
            {
                continue;
            }

            $result[$object->$value] = str_repeat("_", $spaces) . $object->$name;

            if ($object->childs)
            {
                $spaces += 2;

                $result = $this->optionsTree($name, $id, $result, $value, $spaces, $object->id);
            }
        }

        return $result;
    }


    public function offset($num)
    {
        $this->getDbCriteria()->mergeWith(array(
            'offset' => $num,
        ));

        return $this;
    }


    public function in($row, $values, $operator = 'AND')
    {
        $this->getDbCriteria()->addInCondition($row, $values, $operator);
        return $this;
    }


    public function notIn($row, $values, $operator = 'AND')
    {
        $this->getDbCriteria()->addNotInCondition($row, $values, $operator);
        return $this;
    }


    public function notEqual($param, $value)
    {
        $this->getDbCriteria()->mergeWith(array(
            'condition' => "`{$param}` != '{$value}'",
        ));

        return $this;
    }


    public function last()
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->mergeWith(array(
            'order' => $alias . '.date DESC',
        ));

        return $this;
    }


    public function published()
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->addCondition($alias . '.is_published=1');
        return $this;
    }


    public function ordered()
    {
        $alias = $this->getTableAlias();
        $this->getDbCriteria()->mergeWith(array(
            'order' => $alias . '.`order`',
        ));

        return $this;
    }


    public function limit($num)
    {
        $this->getDbCriteria()->mergeWith(array(
            'limit' => $num,
        ));

        return $this;
    }


    public $is_transaction_owner = false;


    public function beforeSave()
    {
        if (parent::beforeSave())
        {
            return true;
        }
        return false;
    }


    public function afterSave()
    {
        if (parent::afterSave())
        {
            return true;
        }
        return false;
    }


}
