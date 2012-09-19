<?php
$modules_includes = array();
$modules_dirs     = scandir(MODULES_PATH);

foreach ($modules_dirs as $module)
{
    if ($module[0] == ".")
    {
        continue;
    }

    $modules[] = $module;

    $modules_includes[] = "application.modules.{$module}.*";
    $modules_includes[] = "application.modules.{$module}.models.*";
    $modules_includes[] = "application.modules.{$module}.portlets.*";
    $modules_includes[] = "application.modules.{$module}.forms.*";
    $modules_includes[] = "application.modules.{$module}.components.*";
    $modules_includes[] = "application.modules.{$module}.components.zii.*";
}


$modules['gii'] = array(
    'class'          => 'system.gii.GiiModule',
    'generatorPaths' => array('application.gii'),
    'password'       => 'giisecret',
    'ipFilters'      => array(
        '127.0.0.1',
        '::1'
    )
);

return array(
    'language'   => 'ru',
    'basePath'   => dirname(__FILE__) . DIRECTORY_SEPARATOR . '..',
    'name'       => '',
    'preload'    => array('log'),

    'import'     => array_merge($modules_includes, array(
        'application.components.*',
        'application.components.validators.*',
        'application.components.zii.*',
        'application.components.formElements.*',
        'application.components.baseWidgets.*',
        'application.libs.tools.*',
        'ext.yiiext.filters.setReturnUrl.ESetReturnUrlFilter',
        'application.modules.srbac.controllers.SBaseController',
    )),

    'modules'    => $modules,

    'components' => array(
        'assetManager' => array(
            'class'       => 'AssetManager',
            'parsers'     => array(
                'sass' => array( // key == the type of file to parse
                    'class'   => 'ext.assetManager.Sass',
                    // path alias to the parser
                    'output'  => 'css',
                    // the file type it is parsed to
                    'options' => array(
                        'syntax' => 'sass'
                    )
                ),
                'scss' => array( // key == the type of file to parse
                    'class'   => 'ext.assetManager.Sass',
                    // path alias to the parser
                    'output'  => 'css',
                    // the file type it is parsed to
                    'options' => array(
                        'syntax' => 'scss',
                        'style'  => 'compressed'
                    )
                ),
                'less' => array( // key == the type of file to parse
                    'class'   => 'ext.assetManager.Less',
                    // path alias to the parser
                    'output'  => 'css',
                    // the file type it is parsed to
                    'options' => array(
                        'syntax' => 'scss',
                        'style'  => 'compressed'
                    )
                ),
            ),
            'newDirMode'  => 0755,
            'newFileMode' => 0644
        ),
        'clientScript' => array(
            'class'    => 'CClientScript',
            'packages' => require_once('packages.php')
        ),
        'session'      => array(
            'autoStart'=> true
        ),
        'user'         => array(
            'allowAutoLogin' => true,
            'class'          => 'WebUser'
        ),
        'metaTags'     => array(
            'class' => 'application.modules.main.components.MetaTags'
        ),
        'image'        => array(
            'class'  => 'application.extensions.image.CImageComponent',
            'driver' => 'GD'
        ),
        'dater'        => array(
            'class' => 'application.components.DaterComponent'
        ),
        'text'         => array(
            'class' => 'application.components.TextComponent'
        ),
        'urlManager'   => array(
            'urlFormat'      => 'path',
            'showScriptName' => false,
            'rules'          => array(
                ''                                         => 'content/page/main',
                'page/<id:\d+>'                            => 'content/page/view',
                'page/<url:.*>'                            => 'content/page/view',
                'chapter/<id:\d+>'                         => 'content/category/view',
                'chapter/<alias:.*>'                       => 'content/category/view',
                'service'                                  => 'content/category/service',
                'prices'                                   => 'content/category/prices',
                'price/<id:\d+>'                           => 'content/category/price',

                'reviews'                                  => 'reviews/review/index',
                'photo'                                    => 'gallery/gallery/index',
                'admin'                                    => 'main/mainAdmin',
                'search'                                   => 'main/main/search',
                'feedback'                                 => 'main/feedback/create',

                'login'                                    => 'users/user/login',
                'logout'                                   => 'users/user/logout',
                'registration'                             => 'users/user/registration',
                'activateAccount/<code:.*>/<email:.*>'     => 'users/user/activateAccount',
                'activateAccountRequest'                   => 'users/user/activateAccountRequest',
                'changePasswordRequest'                    => 'users/user/changePasswordRequest',
                'changePassword/<code:.*>/<email:.*>'      => 'users/user/changePassword',
                'admin/login'                              => 'users/userAdmin/login',

                'news/<id:\d+>'                            => 'news/news/view',
                'news'                                     => 'news/news/index',

                '<controller:\w+>/<id:\d+>'                => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>'   => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>'            => '<controller>/<action>',
                '<controller:\w+>/<id:\d+>'                => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>'   => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>'            => '<controller>/<action>',
            ),
        ),

        'errorHandler' => array(
            'errorAction' => 'main/main/error',
        ),

        'authManager'  => array(
            'class'           => 'CDbAuthManager',
            'connectionID'    => 'db',
            'itemTable'       => 'auth_items',
            'assignmentTable' => 'auth_assignments',
            'itemChildTable'  => 'auth_items_childs',
            'defaultRoles'    => array('guest')
        ),

        'log'          => array(
            'class' => 'CLogRouter',
            'routes'=> array(
                array(
                    // направляем результаты профайлинга в ProfileLogRoute (отображается
                    // внизу страницы)
                    'class'  => 'CProfileLogRoute',
                    'levels' => 'profile',
                    'enabled'=> true,
                ),
                array(
                    'class'      => 'CWebLogRoute',
                    'categories' => 'application',
                    'levels'     => 'error, warning, trace, profile, info',
                    'enabled'=> true,
                ),
            ),
        ),

        'preload'      => array('log'),
        'cache'        => array(
            'class'=> 'system.caching.CFileCache',
        ),
    ),
    'params'     => array(
        'save_site_actions' => false
    )
);

