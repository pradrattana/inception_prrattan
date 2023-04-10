<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/documentation/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// a helper function to lookup "env_FILE", "env", then fallback
if (!function_exists('getenv_docker')) {
	// https://github.com/docker-library/wordpress/issues/588 (WP-CLI will load this file 2x)
	function getenv_docker($env, $default) {
		if ($fileEnv = getenv($env . '_FILE')) {
			return rtrim(file_get_contents($fileEnv), "\r\n");
		}
		else if (($val = getenv($env)) !== false) {
			return $val;
		}
		else {
			return $default;
		}
	}
}

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', getenv_docker('WORDPRESS_DB_NAME', 'database_name_here') );

/** Database username */
define( 'DB_USER', getenv_docker('WORDPRESS_DB_USER', 'username_here') );

/** Database password */
define( 'DB_PASSWORD', getenv_docker('WORDPRESS_DB_PASSWORD', 'password_here') );

/** Database hostname */
define( 'DB_HOST', getenv_docker('WORDPRESS_DB_HOST', 'mysql') );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         'Le:$+ju35_w1B^7pq^&[8*Vo,U!QKj6{+`|s_.|mQ%07,sfe.8HoUD|-5n9EGAK{' );
define( 'SECURE_AUTH_KEY',  'A~hd{4fO&vOi@?]%q@XZGDoN:2w nZiOx0U`LL_#%?z|ZJ[|g*Tp4R&}~iR@$-c`' );
define( 'LOGGED_IN_KEY',    'I7<tZT}@dm2<gE/0H94--h}<HWY-!zRT=uU:FFjE~G#$WD/m<NeN774~mM4cnQBn' );
define( 'NONCE_KEY',        '|,&-(-9C(GlAoYK:|}@N|M,xT-|Yt_6%&kBH<]Vw8`SOZ}>D|gteuG%fld]+GZf ' );
define( 'AUTH_SALT',        'mTFXA)MTb)AGP`V7p!XC%CQ{<x@Hz|[FA32cc,4]q+#Bt2qLm%[fPu6.PfIU4}P$' );
define( 'SECURE_AUTH_SALT', 'j|af^MXGYW=P Ugu3Lfw=|wJDaJ?I-|1V@_BATEE#eN_9c3*Ziu>G7Z8Y|i%>~ay' );
define( 'LOGGED_IN_SALT',   'E W.,;*TKfV?k2)+2h~!Y}PmbobRvnMLF~oV,s-V>LV`sYC[G oe-H&&Ct+|>+rx' );
define( 'NONCE_SALT',       '6~gheF]r~0e%{7GR1h.gXz?JY,i.@Gt&?`*Y*#NF|NU]TW*_pdg~f|RZJ,AFuTA3' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = getenv_docker('WORDPRESS_TABLE_PREFIX', 'wp_');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/documentation/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
