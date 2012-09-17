<?php

class PageAdminController extends AdminController
{   
    public static function actionsTitles() 
    {
        return array(
            "Manage"      => "Управление страницами",
            "Create"      => "Добавление страницы",
            "View"        => "Просмотр страницы",
            "Update"      => "Редактирование страницы",
            "Delete"      => "Удаление страницы",
            "GetJsonData" => "Получение данных страницы (JSON)"
        );    
    }


	public function actionManage()
	{
        $model = new Page('search');
        $model->unsetAttributes();

        if(isset($_GET['Page']))
        {	
            $model->attributes = $_GET['Page'];
        }    

        $this->render('manage', array(
        	"model" => $model
        ));
	}


	public function actionCreate()
	{
		$model = new Page(ActiveRecordModel::SCENARIO_CREATE);
        $form  = new BaseForm('content.PageForm', $model);

		if(isset($_POST['Page']))
		{
			$model->attributes = $_POST['Page'];
			if($model->save())
            {
                $this->redirect(array('view', 'id' => $model->id));
            }
		}

		$this->render('create', array('form' => $form));
	}


	public function actionView($id)
	{	
		$model = $this->loadModel($id);
		
		if (isset($_GET['json'])) 
		{
			echo CJSON::encode($model);
		}
		else 
		{
			$this->render('view', array('model' => $model));
		}	
	}


	public function actionUpdate($id)
	{
        $model = $this->loadModel($id);

		$form = new BaseForm('content.PageForm', $model);
		
		if(isset($_POST['Page']))
		{
			$model->attributes = $_POST['Page'];
			if($model->save())
            {

                $this->redirect(array('view', 'id'=>$model->id));
            }
		}

		$this->render('update', array(
			'form' => $form,
		));
	}


	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			$this->loadModel($id)->delete();

			if(!isset($_GET['ajax']))
            {
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
            }
		}
		else
        {
            throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
        }
	}
	
	
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax'] === 'page-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}


	public function loadModel($id)
	{
		$model=Page::model()->findByPk((int) $id);
		if($model===null)
        {   echo
            $this->pageNotFound();
        }

		return $model;
	}


    public function actionGetJsonData($id)
    {
        echo CJSON::encode($this->loadModel($id));
    }
}
