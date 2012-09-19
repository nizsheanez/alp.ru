<?php
return CMap::mergeArray(require(dirname(__FILE__) . '/main.php'), array(
    'components' => array(
        'db' => array(
            'connectionString'      => 'mysql:host=u326839.mysql.masterhost.ru;dbname=u326839_3',
            'emulatePrepare'        => true,
            'username'              => 'u326839',
            'password'              => 'inatic6infet',
            'charset'               => 'utf8',
            'schemaCachingDuration' => 86400,
            'enableProfiling'  => true,
        )
    )
));

