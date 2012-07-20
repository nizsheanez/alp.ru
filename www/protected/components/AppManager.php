<?php

class AppManager
{
    public static function getModulesData($active = null, $check_allowed_links = false)
    {
        $modules = array();

        $modules_dirs = scandir(MODULES_PATH);
        foreach ($modules_dirs as $ind => $module_dir)
        {
            if ($module_dir[0] == '.')
            {
                continue;
            }

            $module_class = ucfirst($module_dir) . 'Module';
            $module_path  = MODULES_PATH . $module_dir . '/' . $module_class . '.php';

            if (!file_exists($module_path))
            {
                continue;
            }

            require_once $module_path;

            $vars = get_class_vars($module_class);

            if ($active !== null)
            {
            	if (!array_key_exists('active', $vars))
            	{
        			continue;
            	}

				if ($active && !$vars['active'])
				{
					continue;
				}
            }

            $module = array(
                'description' => call_user_func(array($module_class, 'description')),
                'version'     => call_user_func(array($module_class, 'version')),
                'name'        => call_user_func(array($module_class, 'name')),
                'class'       => $module_class,
                'dir'         => $module_dir
            );

            if (method_exists($module_class, 'adminMenu'))
            {
                $module['admin_menu'] = call_user_func(array($module_class, 'adminMenu'));

                $settins_count = Setting::model()->count("module_id = '{$module_dir}'");
                if ($settins_count)
                {
                    $module['admin_menu']['Настройки'] = '/main/SettingAdmin/manage/module_id/' . $module_dir;
                }

                if ($check_allowed_links)
                {
                    foreach ($module['admin_menu'] as $title => $url)
                    {
                        $url = explode('/', trim($url, '/'));

                        if (count($url) < 3)
                        {
                            continue;
                        }

                        list($module_name, $controller, $action) = $url;

                        $auth_item = ucfirst($controller) . '_' . $action;

                        if (!RbacModule::isAllow($auth_item))
                        {
                            unset($module['admin_menu'][$title]);
                        }
                    }
                }
            }

            $modules[$module_class] = $module;
        }

        return $modules;
    }


    public function getModuleActions($module_class, $use_admin_prefix = false)
    {
        $actions = array();

        $controllers_dir = MODULES_PATH . lcfirst(str_replace('Module', '', $module_class)) . '/controllers/';

        $controllers = scandir($controllers_dir);
        foreach ($controllers as $controller)
        {
            if ($controller[0] == ".")
            {
                continue;
            }

            $class = str_replace('.php', '', $controller);
            if (!class_exists($class, false))
            {
                require_once $controllers_dir . $controller;
            }

            $reflection = new ReflectionClass($class);

            if (!in_array($reflection->getParentClass()->name, array('BaseController', 'AdminController')))
            {
                continue;
            }

            $actions_titles = call_user_func(array($class, 'actionsTitles'));

            $methods = $reflection->getMethods(ReflectionMethod::IS_PUBLIC);
            foreach ($methods as $method)
            {
                if (in_array($method->name, array('actionsTitles', 'actions')) || mb_substr($method->name, 0, 6, 'utf-8') != 'action')
                {
                    continue;
                }

                $action = str_replace('action', '', $method->name);

                $action_name = str_replace('Controller', '', $class) . '_' . $action;

				$title = isset($actions_titles[$action]) ? $actions_titles[$action] : "";
				if ($title && $use_admin_prefix && strpos($action_name, "Admin_") !== false)
				{
					$title.= " (админка)";
				}

                $actions[$action_name] = $title;
            }

        }

        return $actions;
    }


    public function getActionModule($action)
    {
        $controller_file = array_shift(explode("_", $action)) . "Controller.php";

        $modules_dirs = scandir(MODULES_PATH);
        foreach ($modules_dirs as $dir)
        {
            if ($dir[0] == ".")
            {
                continue;
            }

            $controllers = scandir(MODULES_PATH . "/" . $dir . "/controllers");

            if (in_array($controller_file, $controllers))
            {
                return ucfirst($dir) . "Module";
            }
        }
    }


    public static function getModuleName($id)
    {
        $module = Yii::app()->getModule($id);
        if ($module)
        {
            return $module->name();
        }
    }


    public static function getModels($params = array())
    {
        $result = array();

        $modules_dirs = scandir(MODULES_PATH);
        foreach ($modules_dirs as $module_dir)
        {
            if ($module_dir[0] == '.')
            {
                continue;
            }

            $module_class = ucfirst($module_dir) . 'Module';

            if (array_key_exists('active', $params))
            {
                $active_attr = new ReflectionProperty($module_class, 'active');
                if ($active_attr->getValue() !== $params['active'])
                {
                    continue;
                }
            }

            $models_dir = MODULES_PATH . $module_dir . '/models';
            if (!file_exists($models_dir))
            {
                continue;
            }

            $models_files = scandir($models_dir);
            foreach ($models_files as $model_file)
            {
                if ($model_file[0] == '.')
                {
                    continue;
                }

                $model_class = str_replace('.php', null, $model_file);

                $model = ActiveRecordModel::model($model_class);

                if (isset($params['meta_tags']))
                {
                    $behaviors = $model->behaviors();
                    $behaviors = ArrayHelper::extract($behaviors, 'class');

                    if (!in_array('application.components.activeRecordBehaviors.MetaTagBehavior', $behaviors))
                    {
                        continue;
                    }
                }

                $result[$model_class] = $model->name();
            }
        }

        return $result;
    }
}





































