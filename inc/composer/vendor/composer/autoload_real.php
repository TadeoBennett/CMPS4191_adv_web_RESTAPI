<?php

// autoload_real.php @generated by Composer

class ComposerAutoloaderInite2e0bc5c63f32d33e5c9d8b88cf6784f
{
    private static $loader;

    public static function loadClassLoader($class)
    {
        if ('Composer\Autoload\ClassLoader' === $class) {
            require __DIR__ . '/ClassLoader.php';
        }
    }

    /**
     * @return \Composer\Autoload\ClassLoader
     */
    public static function getLoader()
    {
        if (null !== self::$loader) {
            return self::$loader;
        }

        require __DIR__ . '/platform_check.php';

        spl_autoload_register(array('ComposerAutoloaderInite2e0bc5c63f32d33e5c9d8b88cf6784f', 'loadClassLoader'), true, true);
        self::$loader = $loader = new \Composer\Autoload\ClassLoader(\dirname(__DIR__));
        spl_autoload_unregister(array('ComposerAutoloaderInite2e0bc5c63f32d33e5c9d8b88cf6784f', 'loadClassLoader'));

        require __DIR__ . '/autoload_static.php';
        call_user_func(\Composer\Autoload\ComposerStaticInite2e0bc5c63f32d33e5c9d8b88cf6784f::getInitializer($loader));

        $loader->register(true);

        return $loader;
    }
}