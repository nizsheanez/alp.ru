<?php

class ArticleAdminController extends AdminController
{   
    public static function actionsTitles() 
    {
        return array(
            "View"   => "Просмотр статьи",
            "Create" => "Добавление статьи",
            "Update" => "Редактирование статьи",
            "Delete" => "Удаление статьи",
            "Manage" => "Управление статьями"
        );    
    }


	public function actionView($id)
	{
		$this->render('view', array(
			'model' => $this->loadModel($id),
		));
	}


	public function actionCreate()
	{
		$model = new Article;
		
		$form = new BaseForm('articles.ArticleForm', $model);
		
		// $this->performAjaxValidation($model);

		if(isset($_POST[get_class($model)]))
		{
			$model->attributes = $_POST[get_class($model)];
			if($model->save())
            {   
                $this->redirect(array('view', 'id' => $model->id));
            }
		}

		$this->render('create', array(
			'form' => $form,
		));
	}


	public function actionUpdate($id)
	{
		$model = $this->loadModel($id);

		$form = new BaseForm('articles.ArticleForm', $model);

		// $this->performAjaxValidation($model);

		if(isset($_POST[get_class($model)]))
		{
			$model->attributes = $_POST[get_class($model)];
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


	public function actionManage()
	{
		$model=new Article('search');
		$model->unsetAttributes();
		if(isset($_GET[get_class($model)]))
        {
            $model->attributes = $_GET[get_class($model)];
        }

		$this->render('manage', array(
			'model' => $model,
		));
	}


	public function loadModel($id)
	{
		$model = Article::model()->findByPk((int) $id);
		if($model === null)
        {
            $this->pageNotFound();
        }

		return $model;
	}


	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax'] === 'article-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
