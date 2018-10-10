/*
Navicat MySQL Data Transfer

Source Server         : new
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : jianshu

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-05-08 15:07:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin_users`
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  `power` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES ('1', 'admin', '$2y$10$UK1qmV7DpkNTsZylj.MACu9qYUUK7r2midb2BC/EJbXWcKuUM3l6q', '2018-01-15 03:17:10', '2018-01-15 03:17:10', '1');

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `content` varchar(255) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('6', '9', '14', '9897979', null, null);
INSERT INTO `comment` VALUES ('7', '9', '14', '9897979', null, null);
INSERT INTO `comment` VALUES ('8', '9', '14', '99999999999999999999999', '1510549630', null);
INSERT INTO `comment` VALUES ('9', '8', '16', '66666666666666', '1510620668', null);
INSERT INTO `comment` VALUES ('10', '8', '18', '真的讲的太好，真是太好了楼主讲的.', '1511766416', null);
INSERT INTO `comment` VALUES ('11', '8', '21', '66666666666666666666666', '1512436463', null);
INSERT INTO `comment` VALUES ('12', '8', '22', '你是真的6 啊你是真的6 啊', '1516256284', null);
INSERT INTO `comment` VALUES ('13', '8', '22', '写的太好了，千古名句，痛哭流涕.真的很感动', '1516256402', null);

-- ----------------------------
-- Table structure for `fan`
-- ----------------------------
DROP TABLE IF EXISTS `fan`;
CREATE TABLE `fan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fan_id` int(11) NOT NULL,
  `star_id` int(11) NOT NULL,
  `created_at` text NOT NULL,
  `updated_at` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fan_id` (`fan_id`),
  KEY `star_id` (`star_id`),
  CONSTRAINT `fan_ibfk_1` FOREIGN KEY (`fan_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fan_ibfk_2` FOREIGN KEY (`star_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fan
-- ----------------------------
INSERT INTO `fan` VALUES ('11', '9', '8', '2017-11-27 06:11:41', '2017-11-27 06:11:41');

-- ----------------------------
-- Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` int(11) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=MyISAM AUTO_INCREMENT=72545895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES ('72545893', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:31;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '14508805', null, '1516583019', '1516583019');
INSERT INTO `jobs` VALUES ('72545894', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:41;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '0', null, '1521775623', '1521775623');
INSERT INTO `jobs` VALUES ('72545889', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:32;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '14508804', null, '1516583019', '1516583019');
INSERT INTO `jobs` VALUES ('72545891', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:34;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '14508804', null, '1516583019', '1516583019');
INSERT INTO `jobs` VALUES ('72545892', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:30;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '14508806', null, '1516583019', '1516583019');
INSERT INTO `jobs` VALUES ('72545890', 'default', '{\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"timeout\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SendInfo\",\"command\":\"O:17:\\\"App\\\\Jobs\\\\SendInfo\\\":5:{s:25:\\\"\\u0000App\\\\Jobs\\\\SendInfo\\u0000notice\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":2:{s:5:\\\"class\\\";s:10:\\\"App\\\\Notice\\\";s:2:\\\"id\\\";i:33;}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:5:\\\"delay\\\";N;}\"}}', '14508804', null, '1516583019', '1516583019');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2018_01_17_065356_create_jobs_table', '1');
INSERT INTO `migrations` VALUES ('2', '2018_01_17_092623_create_jobs_table', '2');

-- ----------------------------
-- Table structure for `notice`
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('35', '发大概多少', '搞好的回复回复的', '2018-01-18 02:44:04', '2018-01-18 02:44:04');
INSERT INTO `notice` VALUES ('36', '的是个待发货', '发挂号费的回复的', '2018-01-18 02:47:03', '2018-01-18 02:47:03');
INSERT INTO `notice` VALUES ('37', '发撒刚到', '挂号费的回复的', '2018-01-18 04:01:56', '2018-01-18 04:01:56');
INSERT INTO `notice` VALUES ('38', '大发噶阿纲', '阿斯钢个打法', '2018-01-18 05:16:58', '2018-01-18 05:16:58');
INSERT INTO `notice` VALUES ('39', '嘎嘎大哥', '刚阿纲大发的啥', '2018-01-18 05:26:50', '2018-01-18 05:26:50');
INSERT INTO `notice` VALUES ('40', '阿发噶撒噶', '个大概当红的', '2018-01-18 05:47:38', '2018-01-18 05:47:38');
INSERT INTO `notice` VALUES ('41', '1111111111111', '2222222222222', '2018-03-23 03:27:03', '2018-03-23 03:27:03');

-- ----------------------------
-- Table structure for `notice_user`
-- ----------------------------
DROP TABLE IF EXISTS `notice_user`;
CREATE TABLE `notice_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `notice_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `notice_id` (`notice_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notice_id` FOREIGN KEY (`notice_id`) REFERENCES `notice` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice_user
-- ----------------------------
INSERT INTO `notice_user` VALUES ('2', '3', '38');
INSERT INTO `notice_user` VALUES ('3', '7', '38');
INSERT INTO `notice_user` VALUES ('4', '8', '38');
INSERT INTO `notice_user` VALUES ('5', '9', '38');
INSERT INTO `notice_user` VALUES ('6', '3', '39');
INSERT INTO `notice_user` VALUES ('7', '7', '39');
INSERT INTO `notice_user` VALUES ('8', '8', '39');
INSERT INTO `notice_user` VALUES ('9', '9', '39');
INSERT INTO `notice_user` VALUES ('10', '3', '40');
INSERT INTO `notice_user` VALUES ('11', '7', '40');
INSERT INTO `notice_user` VALUES ('12', '8', '40');
INSERT INTO `notice_user` VALUES ('13', '9', '40');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('4', 'post', '文章管理员', null, null);
INSERT INTO `permissions` VALUES ('5', 'system', '系统管理员', null, null);
INSERT INTO `permissions` VALUES ('6', 'notice', '通知管理', null, null);
INSERT INTO `permissions` VALUES ('7', 'topic', '专题管理', null, null);

-- ----------------------------
-- Table structure for `permissions_role`
-- ----------------------------
DROP TABLE IF EXISTS `permissions_role`;
CREATE TABLE `permissions_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permissions_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_id` (`permissions_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `permissions_id` FOREIGN KEY (`permissions_id`) REFERENCES `permissions` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `role_id` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permissions_role
-- ----------------------------
INSERT INTO `permissions_role` VALUES ('1', '1', '4');
INSERT INTO `permissions_role` VALUES ('13', '2', '4');
INSERT INTO `permissions_role` VALUES ('14', '2', '5');
INSERT INTO `permissions_role` VALUES ('17', '1', '5');
INSERT INTO `permissions_role` VALUES ('18', '1', '6');
INSERT INTO `permissions_role` VALUES ('19', '1', '7');
INSERT INTO `permissions_role` VALUES ('20', '2', '6');
INSERT INTO `permissions_role` VALUES ('22', '2', '7');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` text,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('14', '888888888888888', '<p>888888888888888</p>', '8', '2018-01-11 17:47:17', '2017-11-05 10:37:01', '1');
INSERT INTO `posts` VALUES ('16', '888888888888888', '<p>888888888888888</p>', '8', '2018-01-15 15:23:12', '2017-11-05 11:09:06', '-1');
INSERT INTO `posts` VALUES ('17', '111111111111111111', '<p></p><p></p><p>2222222222222222222</p><p></p><p><br></p><p></p><p><br></p>', '9', '2018-01-18 14:02:41', '2018-01-05 03:07:59', '-1');
INSERT INTO `posts` VALUES ('18', 'PHP命名空间', '<p><p>php自5.3.0开始，引入了一个namespace关键字以及__NAMESPACE__魔术常量（当然use关键字或use as嵌套语句也同时引入）；那么什么是命名空间呢？php官网已很明确的进行了定义并形象化解释，这里直接从php官网copy一段文字[<a href=\"http://www.php.net/manual/zh/language.namespaces.rationale.php\" target=\"_blank\">来源</a>]。</p><p>“什么是命名空间？从广义上来说，命名空间是一种封装事物的方法。在很多地方都可以见到这种抽象概念。例如，在操作系统中目录用来将相关文件分组，对于目录中的文件来说，它就扮演了命名空间的角色。具体举个例子，文件 foo.txt 可以同时在目录/home/greg 和 /home/other 中存在，但在同一个目录中不能存在两个 foo.txt 文件。另外，在目录 /home/greg 外访问 foo.txt 文件时，我们必须将目录名以及目录分隔符放在文件名之前得到 /home/greg/foo.txt。这个原理应用到程序设计领域就是命名空间的概念。”</p><p>目前php5.5系列早已推出，php的面向对象编程思想也在逐渐的完善，而本文要学习的namespace关键字的引入就是为了解决php面向对象编程过程中已出现的各种“麻烦”；具体麻烦如下：</p><ol><li>用户编写的代码与PHP内部的类/函数/常量或第三方类/函数/常量之间的名字冲突。</li><li>为了缓解麻烦1，通常编写各种class时会使用较长的类名或为实现不同功能的class添加名称前缀（或后缀）。</li><li>不使用魔法函数__autoload的情况下，而每个class又独占一个php文件时，为了调用不同的class，会在使用这些class的另外的php文件的开头位置书写较多的include（或require或require_once）语句。</li></ol><h3>命名空间的使用概要：</h3><p>Tips：以下示例中成为了两个文件，一个Demo.php，一个index.php，两个文件处于同级目录下；Demo.php文件中书写命名空间以及Demo类，index.php调用Demo.php中的Demo类；如下示例中的“输出结果”即表示浏览器访问index.php。</p><h2>一、简单的示例</h2><p>Demo.php文件代码</p><pre><ol><li><?php</li><li>namespace DemoNameSpace;</li><li> </li><li>class Demo {</li><li>    private $mysqlHandle;</li><li> </li><li>    public function __construct() {</li><li>        echo \'This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is \'.__NAMESPACE__;</li><li>    }</li><li>}</li><li>?></li></ol></pre><p>index.php文件代码</p><pre><ol><li><?php</li><li>    include \'Demo.php\';</li><li>    use DemoNameSpace\\Demo;</li><li>    $DemoObj = new Demo();</li><li>?></li></ol></pre><p>输出结果1：“This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is DemoNameSpace”</p><p>以上示例的说明：Demo.php中有一个_NAMESPACE__魔法常量；“它包含当前命名空间名称的字符串。在全局的，不包括在任何命名空间中的代码，它包含一个空的字符串。”</p><p>接着做示例：</p><p>Demo.php不做变动，改动index.php文件，如下：</p><pre><ol><li><?php</li><li>    include \'Demo.php\';</li><li>    $Demo = new Demo();</li><li>?></li></ol></pre><p>输出结果2：“Fatal error: Class \'Demo\' not found in F:\\JJserver\\demo\\index.php on line 4”</p><p>这个是常见的“致命错误”信息了。按照常规的php编程思路，这里的输出应该是跟“输出结果1”一致的，但这里它偏要来个致命错误，这下要抓狂了吧？~</p><p>行，先把抓狂的麻烦解决，去掉（或注释掉）Demo.php文件中的：“namespace DemoNameSpace；”这个语句，就正常了。这是咱们平常写class以及调用class最常见的书写方法，就不再解释这种不使用namespace的情况了。</p><p>对比使用namespace与不使用namespace的两种输出情况，并加入namespace的定义理解后，上述出现致命错误的情况就很好理解了。在Demo.php中定义了一个namespace，也就是命名空间后，接着定义了Demo类，然后这个Demo类就被归并到了DemoNameSpace命名空间中去了，那么要调用这个Demo类时，自然要先调用这个DemoNameSpace命名空间了，也就是在index.php文件中使用“useDemoNameSpace\\Demo”语句了。</p><h2>二、复杂一点的示例</h2><p>Demo.php文件代码</p><pre><ol><li><?php</li><li>namespace DemoNameSpace;</li><li> </li><li>class Demo {</li><li>    private $mysqlHandle;</li><li> </li><li>    public function __construct() {</li><li>        echo \'This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is \'.__NAMESPACE__;</li><li>    }</li><li>}</li><li> </li><li>namespace DemoNameSpace1;</li><li> </li><li>const constDefine = \'JJonline1\';</li><li> </li><li>class Demo {</li><li>    private $mysql;</li><li>    const constDefine = \'JJonline2\';</li><li> </li><li>    public function __construct() {</li><li>        echo \'The const constant outside class is: \'.constDefine;</li><li>        echo \'===cut-off rule of god!!!!===\';</li><li>        echo \'The const constant inside class is: \'.self::constDefine;</li><li>    }</li><li>}</li><li>?></li></ol></pre><p>index.php文件代码</p><pre><ol><li><?php</li><li>    include \'Demo.php\';</li><li>    use DemoNameSpace1\\Demo as Test;</li><li>    $Demo = new Test();</li><li>    echo \'||||\'.DemoNameSpace1\\constDefine;</li><li>?></li></ol></pre><p>输出结果3：“The const constant outside class is: JJonline1===cut-off rule of god!!!!===The const constant inside class is: JJonline2||||JJonline1”</p><p>这个结果在没有命名空间的时候，就直接报诸如“Fatal error: Cannot redeclare class Demo”的致命错误了。但运行没有报错，这也就是php5.3以后引入的命名空间的好处了，就诸如本文开头引用的官方解释中以不同目录下的相同文件名的文件可以存在一样是一个道理了。Demo.php文件中，定义的第一个名称叫做Demo的class类被归并到了DemoNameSpace的命名空间，而定义的第二个名称叫做Demo的class被归并到了DemoNameSpace1的命名空间，故而并不会出现不能重复定义某一个类的致命错误。以上的书写方法是要尽量避免的，因为类外部const常量名与类内部const常量名是一样的，很容易混淆，这里这样书写的目的就是看看不同位置申明的const常量，在调用时的情况；输出结果3已经很明显了，就不再多墨迹解释了。</p><p>Demo.php中DemoNameSpace1命名空间下还将const常量constDefine提出，拿到了定义class之外，这又要抓狂了，因为之前的知识是define定义全局常量，const定义class内部常量；这儿却将const拿出来玩了...具体就不再讲解了，Demo.php文件代码以及运行后的结果已经很明确的表明了相关知识。class内部定义的const只能在class的内部调用，采用self::constName形式，而class内部调用命名空间下、class外的const常量，则可以直接使用诸如define定义的常量一样使用。当需要使用该命名空间下、class外定义的const常量时，就使用类似路径形式的方式调用（index.php文件中的输出）。</p><p>该例子还有一点说明，就是在index.php中使用了use as语句，看index.php的代码，意义一目了然，new的一个class名称叫Test，但Test这个类并没有在Demo.php中定义，却没有出错，这就在于了use as语句了，具体意义不再解释。</p><p>通过上述的了解，namespace关键字可以将实现各种功能的class通过指定不同的命名空间分门别类存放，而且不同命名空间下的class可以同名；另外const常量定义也可以提出到class外部，当然也会有作用范围这么一个“内涵”~</p><h3>总结下namespace的相关知识：</h3><p>1、当前脚本文件的第一个命名空间前面不能有任何代码，例如如下代码就是会报致命错误的：</p><pre><ol><li><?php</li><li>define(\"GREETING\",\"Hello world!\");</li><li> </li><li>namespace DemoNameSpace;</li><li> </li><li>class Demo {</li><li>    private $mysqlHandle;</li><li> </li><li>    public function __construct() {</li><li>        echo \'This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is \'.__NAMESPACE__;</li><li>    }</li><li>}</li><li>$Demo = new Demo();</li><li>?></li></ol></pre><p>运行上述代码，会出现致命错误：“Fatal error: Namespace declaration statement has to be the very first statement in xxxx”</p><p>2、命名空间下直接new该命名空间中的class名称，可以省略掉use语法，这是php按脚本书写顺序执行导致的。例如如下代码是可以运行的</p><pre><ol><li><?php</li><li>namespace DemoTest;</li><li>class Demo {</li><li>    public function __construct() {</li><li>        echo \'this is a test script\';</li><li>    }</li><li>}</li><li>namespace DemoNameSpace;</li><li> </li><li>class Demo {</li><li>    private $mysqlHandle;</li><li> </li><li>    public function __construct() {</li><li>        echo \'This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is \'.__NAMESPACE__;</li><li>    }</li><li>}</li><li>$Demo = new Demo();</li><li>?></li></ol></pre><p>运行结果4：“This is namespace of PHP demo ,The Demo magic constant \"__NAMESPACE__\" is DemoNameSpace”</p><p>这个结果表明，同一脚本下new一个没有指定use哪个命名空间时，会顺着该脚本，使用最靠近new语句之前的一个命名空间中的class</p><p>3、公共空间：可以简单的理解，没有定义命名空间的方法（函数）、类库（class）、属性（变量）都默认归属于公共空间。这样就解释了为php5.3.0以前版本书写的代码大部分为何在php5.3.0及其以上版本还能正常运行的原因。另外：公共空间中的代码段被引入到某个命名空间下后，该公共空间中的代码段不属于任何命名空间！</p><p>公共空间这块，还是各位自己写写代码比较好。</p><p>4、就如目录结构一样，命名空间也有子命名空间的概念，具体就不再举例说明了。</p><p></p><p>命名空间的引入，让php面向对象编程更加的贴切，合理利用命名空间，也可以让项目文件规划，各个类库规划更加的合理、易读。更多关于php5.3.0及其以上引入的命名空间的问题就不再介绍了。</p><p><br></p></p><p><br></p>', '8', '2018-01-15 15:23:10', '2017-11-27 14:49:46', '1');
INSERT INTO `posts` VALUES ('19', 'apache 下配置多个项目', '<p>多端口：</p><p>一个域名下同时配置多个端口，从而达到访问不同程序</p><p>效果例如：</p><p>1、8080端口下安装discuz论坛程序，用http://localhost:8080访问。</p><p>2、8081端口下安装WordPress博客程序，用http://localhost:8081访问。</p><p>&nbsp;</p><p>（1）、修改http.conf</p><p>在C:\\XAMPP\\apache\\conf &nbsp;里的httpd.conf&nbsp;先配置好apache的侦听端口</p><p>在Listen: 80 行下添加如下：</p><p>Listen:8080</p><p><img src=\"http://images2017.cnblogs.com/blog/1265790/201711/1265790-20171120172026102-1174174607.png\" alt=\"\" data-bd-imgshare-binded=\"1\"><img src=\"http://images2017.cnblogs.com/blog/1265790/201711/1265790-20171120172026102-1174174607.png\"><img src=\"http://images2017.cnblogs.com/blog/1265790/201711/1265790-20171120172026102-1174174607.png\">Listen:8081</p><p>（2）、修改httpd-vhosts.conf</p><p>在C:\\XAMPP\\apache\\conf\\extra 里的httpd-vhosts.conf的最下面添加如下配置</p><p><a href=\"javascript:void(0);\"><img src=\"http://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\" data-bd-imgshare-binded=\"1\"></a><a><img src=\"http://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\" data-bd-imgshare-binded=\"1\"></a></p><pre>#8080端口\r\n<virtualhost *:8080=\"\">\r\n ServerName localhost:8080\r\n DocumentRoot \"C:/Users/yuming/PhpstormProjects/project/weike\" \r\n <directory \"c:=\"\" users=\"\" yuming=\"\" phpstormprojects=\"\" project=\"\" weike\"=\"\">  \r\n  Options FollowSymLinks IncludesNOEXEC Indexes\r\n  DirectoryIndex index.php index.html index.shtml\r\n  AllowOverride None\r\n  Order Deny,Allow\r\n  Allow from all\r\n </directory>\r\n</virtualhost>\r\n\r\n\r\n#8081端口\r\n<virtualhost *:8081=\"\">\r\n ServerName localhost:8081\r\n DocumentRoot \"C:/www/web\" \r\n <directory \"c:=\"\" www=\"\" web\"=\"\">  \r\n  Options FollowSymLinks IncludesNOEXEC Indexes\r\n  DirectoryIndex index.php index.html index.shtml\r\n  AllowOverride None\r\n  Order Deny,Allow\r\n  Allow from all\r\n </directory>\r\n</virtualhost></pre><p><a><img src=\"http://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\" data-bd-imgshare-binded=\"1\"></a><a href=\"javascript:void(0);\"><img src=\"http://common.cnblogs.com/images/copycode.gif\" alt=\"复制代码\" data-bd-imgshare-binded=\"1\"></a></p><p>保存上面的修改后，重启apache服务器，就可以了。</p><p>&nbsp;</p><p>PS:重启后未成功可能有如下问题需检查！</p><p>1、检查http.conf文件中 Include conf/extra/httpd-vhosts.conf 是否开启（去掉前面的#号）。</p><p>2、页面访问出现403错误，打开D:\\xampp\\apache\\conf\\httpd.conf文件，大概220行位置，找到：</p><pre> AllowOverride none\r\n Require all denied</pre><p>改成：</p><pre> #AllowOverride none\r\n #Require all denied\r\n AllowOverride All\r\n #Require all granted</pre><p>3、如果以上修改后出现访问localhost不行了，需要在vhosts.conf把localhost也配置成虚拟主机。代码如下：</p><p><virtualhost *:80>\r\n</virtualhost *:80></p><p>&nbsp;&nbsp;&nbsp;&nbsp;DocumentRoot&nbsp;\"D:/xampp/htdocs\"\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;ServerName&nbsp;localhost\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;<location >\r\n</location ></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Order&nbsp;deny,allow\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deny&nbsp;from&nbsp;all\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allow&nbsp;from&nbsp;127.0.0.1\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Allow&nbsp;from&nbsp;localhost\r\n</p><p>&nbsp;&nbsp;&nbsp;&nbsp;\r\n</p><p>&nbsp;</p><p><br></p><p><br></p>', '8', '2018-01-15 15:23:06', '2017-11-27 17:32:31', '1');
INSERT INTO `posts` VALUES ('20', 'laravel 优化', '<p>性能一直是 Laravel 框架为人诟病的一个点，所以调优 Laravel 程序算是一个必学的技能。</p><p>接下来分享一些开发的最佳实践，还有调优技巧，大家有别的建议也欢迎留言讨论。</p><p>这里是简单的列表：</p><ol><li>配置信息缓存&nbsp;artisan config:cache</li><li>路由缓存&nbsp;artisan route:cache</li><li>类映射加载优化&nbsp;artisan optimize</li><li>自动加载优化&nbsp;composer dumpautoload</li><li>使用 Memcached 来存储会话&nbsp;config/session.php</li><li>使用专业缓存驱动器&nbsp;config/cache.php</li><li>数据库请求优化</li><li>为数据集书写缓存逻辑</li><li>使用即时编译器（JIT），如：HHVM、OpCache</li><li>前端资源合并 Elixir</li></ol><h2>1. 配置信息缓存<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#1-配置信息缓存\">#</a></h2><p>使用以下 Artisan 自带命令，把&nbsp;config&nbsp;文件夹里所有配置信息合并到一个文件里，减少运行时文件的载入数量：</p><pre><code>php artisan config:cache</code></pre><p>上面命令会生成文件&nbsp;bootstrap/cache/config.php，可以使用以下命令来取消配置信息缓存：</p><pre><code>php artisan config:clear</code></pre><p>此命令做的事情就是把&nbsp;bootstrap/cache/config.php&nbsp;文件删除。</p><blockquote>注意：配置信息缓存不会随着更新而自动重载，所以，开发时候建议关闭配置信息缓存，一般在生产环境中使用，可以配合&nbsp;Envoy 任务运行器&nbsp;一起使用。</blockquote><h2>2. 路由缓存<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#2-路由缓存\">#</a></h2><p>路由缓存可以有效的提高路由器的注册效率，在大型应用程序中效果越加明显，可以使用以下命令：</p><pre><code>php artisan route:cache</code></pre><p>以上命令会生成&nbsp;bootstrap/cache/routes.php&nbsp;文件，需要注意的是，路由缓存不支持路由匿名函数编写逻辑，详见：<a href=\"https://doc.laravel-china.org/docs/5.1/controllers#%E8%B7%AF%E7%94%B1%E7%BC%93%E5%AD%98\">文档 - 路由缓存</a>。</p><p>可以使用下面命令清除路由缓存：</p><pre><code>php artisan route:clear</code></pre><p>此命令做的事情就是把&nbsp;bootstrap/cache/routes.php&nbsp;文件删除。</p><blockquote>注意：路由缓存不会随着更新而自动重载，所以，开发时候建议关闭路由缓存，一般在生产环境中使用，可以配合&nbsp;Envoy 任务运行器&nbsp;一起使用。</blockquote><h2>3. 类映射加载优化<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#3-类映射加载优化\">#</a></h2><p>optimize&nbsp;命令把常用加载的类合并到一个文件里，通过减少文件的加载，来提高运行效率：</p><pre><code>php artisan optimize --force</code></pre><p>会生成&nbsp;bootstrap/cache/compiled.php&nbsp;和&nbsp;bootstrap/cache/services.json&nbsp;两个文件。</p><p>你可以可以通过修改&nbsp;config/compile.php&nbsp;文件来添加要合并的类。</p><p>在&nbsp;production&nbsp;环境中，参数&nbsp;--force&nbsp;不需要指定，文件就会自动生成。</p><p>要清除类映射加载优化，请运行以下命令：</p><pre><code>php artisan clear-compiled</code></pre><p>此命令会删除上面&nbsp;optimize&nbsp;生成的两个文件。</p><blockquote>注意：此命令要运行在&nbsp;php artisan config:cache&nbsp;后，因为&nbsp;optimize&nbsp;命令是根据配置信息（如：config/app.php&nbsp;文件的&nbsp;providers&nbsp;数组）来生成文件的。</blockquote><h2>4. 自动加载优化<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#4-自动加载优化\">#</a></h2><p>此命令不止针对于 Laravel 程序，适用于所有使用&nbsp;composer&nbsp;来构建的程序。此命令会把&nbsp;PSR-0&nbsp;和&nbsp;PSR-4转换为一个类映射表，来提高类的加载速度。</p><pre><code>composer dumpautoload -o</code></pre><blockquote>注意：php artisan optimize --force&nbsp;命令里已经做了这个操作。</blockquote><h2>5. 使用 Memcached 来存储会话<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#5-使用-Memcached-来存储会话\">#</a></h2><p>每一个 Laravel 的请求，都会产生会话，修改会话的存储方式能有效提高程序效率，会话的配置信息是&nbsp;config/session.php，建议修改为 Memcached 或者 Redis 等专业的缓存软件：</p><pre><code>\'driver\' =&gt; \'memcached\',</code></pre><h2>6. 使用专业缓存驱动器<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#6-使用专业缓存驱动器\">#</a></h2><p>「缓存」是提高应用程序运行效率的法宝之一，默认缓存驱动是&nbsp;file&nbsp;文件缓存，建议切换到专业的缓存系统，如 Redis 或者 Memcached，不建议使用数据库缓存。</p><pre><code>\'default\' =&gt; \'redis\',</code></pre><h2>7. 数据库请求优化<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#7-数据库请求优化\">#</a></h2><p>数据库请求优化</p><ul><li>数据关联模型读取时使用&nbsp;<a href=\"https://doc.laravel-china.org/docs/5.1/eloquent-relationships#%E9%A2%84%E5%8A%A0%E8%BD%BD\">延迟预加载</a>&nbsp;和&nbsp;<a href=\"https://doc.laravel-china.org/docs/5.1/eloquent-relationships#%E9%A2%84%E5%8A%A0%E8%BD%BD\">预加载</a>&nbsp;；</li><li>使用&nbsp;<a href=\"https://github.com/barryvdh/laravel-debugbar\">Laravel Debugbar</a>&nbsp;或者&nbsp;<a href=\"https://laravel-china.org/topics/23\">Clockwork</a>&nbsp;留意每一个页面的总数据库请求数量；</li></ul><p>这里的篇幅只写到与 Laravel 相关的，其他关于数据优化的内容，请自行查阅其他资料。</p><h2>8. 为数据集书写缓存逻辑<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#8-为数据集书写缓存逻辑\">#</a></h2><p>合理的使用 Laravel 提供的缓存层操作，把从数据库里面拿出来的数据集合进行缓存，减少数据库的压力，运行在内存上的专业缓存软件对数据的读取也远远快于数据库。</p><pre><code>$posts = Cache::remember(\'index.posts\', $minutes = 30, function()\r\n{\r\n    return Post::with(\'comments\', \'tags\', \'author\', \'seo\')-&gt;whereHidden(0)-&gt;get();\r\n});</code></pre><p>remember&nbsp;甚至连数据关联模型也都一并缓存了，多么方便呀。</p><h2>9. 使用即时编译器<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#9-使用即时编译器\">#</a></h2><p>HHVM 和 OpCache 都能轻轻松松的让你的应用程序在不用做任何修改的情况下，直接提高 50% 或者更高的性能，PHPhub 之前做个一个实验，具体请见：<a href=\"https://laravel-china.org/topics/301\">使用 OpCache 提升 PHP 5.5+ 程序性能</a>。</p><h2>10. 前端资源合并<a href=\"https://laravel-china.org/articles/2020/ten-laravel-5-program-optimization-techniques#10-前端资源合并\">#</a></h2><p>作为优化的标准，一个页面只应该加载一个 CSS 和 一个 JS 文件，并且文件要能方便走 CDN，需要文件名随着修改而变化。</p><p>Laravel Elixir 提供了一套简便实用的方案，详细请见文档：<a href=\"https://doc.laravel-china.org/docs/5.1/elixir\">Laravel Elixir 文档</a>。</p><p><br></p><p><br></p>', '8', '2018-01-15 15:23:09', '2017-11-29 03:26:07', '1');
INSERT INTO `posts` VALUES ('21', 'Laravel 服务容器实例教程 —— 深入理解控制反转（IoC）和依赖注入（DI）', '<blockquote>友情提示：本文有点长，但绝对都是干货，请耐心读完，必有收获！</blockquote><p>容器，字面上理解就是装东西的东西。常见的变量、对象属性等都可以算是容器。一个容器能够装什么，全部取决于你对该容器的定义。当然，有这样一种容器，它存放的不是文本、数值，而是对象、对象的描述（类、接口）或者是提供对象的回调，通过这种容器，我们得以实现许多高级的功能，其中最常提到的，就是\r\n “解耦” 、“<a href=\"http://laravelacademy.org/tags/%e4%be%9d%e8%b5%96%e6%b3%a8%e5%85%a5\" target=\"_blank\">依赖注入</a>（DI）”。本文就从这里开始。</p><h3>IoC 容器 —— <a href=\"http://laravelacademy.org/tags/laravel\" target=\"_blank\">Laravel</a> 的核心</h3><p>Laravel 的核心就是一个 IoC 容器，根据文档，称其为“<a href=\"http://laravelacademy.org/tags/%e6%9c%8d%e5%8a%a1%e5%ae%b9%e5%99%a8\" target=\"_blank\">服务容器</a>”，顾名思义，该容器提供了整个框架中需要的一系列服务。作为初学者，很多人会在这一个概念上犯难，因此，我打算从一些基础的内容开始讲解，通过理解面向对象开发中依赖的产生和解决方法，来逐渐揭开“依赖注入”的面纱，逐渐理解这一神奇的设计理念。</p><p>本文一大半内容都是通过举例来让读者去理解什么是 IoC（<a href=\"http://laravelacademy.org/tags/%e6%8e%a7%e5%88%b6%e5%8f%8d%e8%bd%ac\" target=\"_blank\">控制反转</a>） 和 DI（依赖注入），通过理解这些概念，来更加深入。更多关于 laravel 服务容器的用法建议阅读<a href=\"http://laravelacademy.org/post/93.html\">文档</a>即可。</p><h3>IoC 容器诞生的故事</h3><p>讲解 IoC 容器有很多的文章，我之前也写过。但现在我打算利用当下的灵感重新来过，那么开始吧。</p><h4>超人和超能力，依赖的产生</h4><p>面向对象编程，有以下几样东西无时不刻的接触：接口、类还有对象。这其中，接口是类的原型，一个类必须要遵守其实现的接口；对象则是一个类实例化后的产物，我们称其为一个实例。当然这样说肯定不利于理解，我们就实际的写点中看不中用的代码辅助学习。</p><blockquote>怪物横行的世界，总归需要点超级人物来摆平。</blockquote><p>我们把一个“超人”作为一个类，</p><pre>class Superman {}</pre><p>我们可以想象，一个超人诞生的时候肯定拥有至少一个超能力，这个超能力也可以抽象为一个对象，为这个对象定义一个描述他的类吧。一个超能力肯定有多种属性、（操作）方法，这个尽情的想象，但是目前我们先大致定义一个只有属性的“超能力”，至于能干啥，我们以后再丰富：</p><pre>class Power {\r\n    /**\r\n     * 能力值\r\n     */\r\n    protected $ability;\r\n\r\n    /**\r\n     * 能力范围或距离\r\n     */\r\n    protected $range;\r\n\r\n    public function __construct($ability, $range)\r\n    {\r\n        $this-&gt;ability = $ability;\r\n        $this-&gt;range = $range;\r\n    }\r\n}\r\n</pre><p>这时候我们回过头，修改一下之前的“超人”类，让一个“超人”创建的时候被赋予一个超能力：</p><pre>class Superman\r\n{\r\n    protected $power;\r\n\r\n    public function __construct()\r\n    {\r\n        $this-&gt;power = new Power(999, 100);\r\n    }\r\n}\r\n</pre><p>这样的话，当我们创建一个“超人”实例的时候，同时也创建了一个“超能力”的实例，但是，我们看到了一点，“超人”和“超能力”之间不可避免的产生了一个依赖。</p><p>所谓“依赖”，就是 “我若依赖你，我就不能离开你”。</p><p>在一个贯彻面向对象编程的项目中，这样的依赖随处可见。少量的依赖并不会有太过直观的影响，我们随着这个例子逐渐铺开，让大家慢慢意识到，当依赖达到一个量级时，是怎样一番噩梦般的体验。当然，我也会自然而然的讲述如何解决问题。</p><h4>一堆乱麻 —— 可怕的依赖</h4><p>之前的例子中，超能力类实例化后是一个具体的超能力，但是我们知道，超人的超能力是多元化的，每种超能力的方法、属性都有不小的差异，没法通过一种类描述完全。我们现在进行修改，我们假设超人可以有以下多种超能力：</p><ul><li>飞行，属性有：飞行速度、持续飞行时间</li><li>蛮力，属性有：力量值</li><li>能量弹，属性有：伤害值、射击距离、同时射击个数</li></ul><p>我们创建了如下类：</p><pre>class Flight\r\n{\r\n    protected $speed;\r\n    protected $holdtime;\r\n    public function __construct($speed, $holdtime) {}\r\n}\r\n\r\nclass Force\r\n{\r\n    protected $force;\r\n    public function __construct($force) {}\r\n}\r\n\r\nclass Shot\r\n{\r\n    protected $atk;\r\n    protected $range;\r\n    protected $limit;\r\n    public function __construct($atk, $range, $limit) {}\r\n}\r\n</pre><p>为了省事儿我没有详细写出 __construct() 这个构造函数的全部，只写了需要传递的参数。</p><p>好了，这下我们的超人有点“忙”了。在超人初始化的时候，我们会根据需要来实例化其拥有的超能力吗，大致如下：</p><pre>class Superman\r\n{\r\n    protected $power;\r\n\r\n    public function __construct()\r\n    {\r\n        $this-&gt;power = new Fight(9, 100);\r\n        // $this-&gt;power = new Force(45);\r\n        // $this-&gt;power = new Shot(99, 50, 2);\r\n        /*\r\n        $this-&gt;power = array(\r\n            new Force(45),\r\n            new Shot(99, 50, 2)\r\n        );\r\n        */\r\n    }\r\n}\r\n</pre><p>我们需要自己手动的在构造函数内（或者其他方法里）实例化一系列需要的类，这样并不好。可以想象，假如需求变更（不同的怪物横行地球），需要更多的有针对性的新的超能力，或者需要变更超能力的方法，我们必须\r\n 重新改造 超人。换句话说就是，改变超能力的同时，我还得重新制造个超人。效率太低了！新超人还没创造完成世界早已被毁灭。</p><p>这时，灵机一动的人想到：为什么不可以这样呢？超人的能力可以被随时更换，只需要添加或者更新一个芯片或者其他装置啥的（想到钢铁侠没）。这样的话就不要整个重新来过了。</p><p>对，就是这样的。</p><p>我们不应该手动在 “超人” 类中固化了他的 “超能力” \r\n初始化的行为，而转由外部负责，由外部创造超能力模组、装置或者芯片等（我们后面统一称为 \r\n“模组”），植入超人体内的某一个接口，这个接口是一个既定的，只要这个 “模组” \r\n满足这个接口的装置都可以被超人所利用，可以提升、增加超人的某一种能力。这种由外部负责其依赖需求的行为，我们可以称其为 “控制反转（IoC）”。</p><h3><a href=\"http://laravelacademy.org/tags/%e5%b7%a5%e5%8e%82%e6%a8%a1%e5%bc%8f\" target=\"_blank\">工厂模式</a>，依赖转移！</h3><p>当然，实现控制反转的方法有几种。在这之前，不如我们先了解一些好玩的东西。</p><blockquote>我们可以想到，组件、工具（或者超人的模组），是一种可被生产的玩意儿，生产的地方当然是 “工厂（Factory）”，于是有人就提出了这样一种模式： 工厂模式。</blockquote><p>工厂模式，顾名思义，就是一个类所依赖的外部事物的实例，都可以被一个或多个 “工厂” 创建的这样一种开发模式，就是 “工厂模式”。</p><p>我们为了给超人制造超能力模组，我们创建了一个工厂，它可以制造各种各样的模组，且仅需要通过一个方法：</p><pre>class SuperModuleFactory\r\n{\r\n    public function makeModule($moduleName, $options)\r\n    {\r\n        switch ($moduleName) {\r\n            case \'Fight\': \r\n                return new Fight($options[0], $options[1]);\r\n            case \'Force\': \r\n                return new Force($options[0]);\r\n            case \'Shot\': \r\n                return new Shot($options[0], $options[1], $options[2]);\r\n        }\r\n    }\r\n}\r\n</pre><p>这时候，超人 创建之初就可以使用这个工厂！</p><pre>class Superman\r\n{\r\n    protected $power;\r\n\r\n    public function __construct()\r\n    {\r\n        // 初始化工厂\r\n        $factory = new SuperModuleFactory;\r\n\r\n        // 通过工厂提供的方法制造需要的模块\r\n        $this-&gt;power = $factory-&gt;makeModule(\'Fight\', [9, 100]);\r\n        // $this-&gt;power = $factory-&gt;makeModule(\'Force\', [45]);\r\n        // $this-&gt;power = $factory-&gt;makeModule(\'Shot\', [99, 50, 2]);\r\n        /*\r\n        $this-&gt;power = array(\r\n            $factory-&gt;makeModule(\'Force\', [45]),\r\n            $factory-&gt;makeModule(\'Shot\', [99, 50, 2])\r\n        );\r\n        */\r\n    }\r\n}\r\n</pre><p>可以看得出，我们不再需要在超人初始化之初，去初始化许多第三方类，只需初始化一个工厂类，即可满足需求。但这样似乎和以前区别不大，只是没有那么多 new 关键字。其实我们稍微改造一下这个类，你就明白，工厂类的真正意义和价值了。</p><pre>class Superman\r\n{\r\n    protected $power;\r\n\r\n    public function __construct(array $modules)\r\n    {\r\n        // 初始化工厂\r\n        $factory = new SuperModuleFactory;\r\n\r\n        // 通过工厂提供的方法制造需要的模块\r\n        foreach ($modules as $moduleName =&gt; $moduleOptions) {\r\n            $this-&gt;power[] = $factory-&gt;makeModule($moduleName, $moduleOptions);\r\n        }\r\n    }\r\n}\r\n\r\n// 创建超人\r\n$superman = new Superman([\r\n    \'Fight\' =&gt; [9, 100],\r\n    \'Shot\' =&gt; [99, 50, 2]\r\n]);\r\n</pre><p>现在修改的结果令人满意。现在，“超人” 的创建不再依赖任何一个 “超能力” 的类，我们如若修改了或者增加了新的超能力，只需要针对修改 \r\nSuperModuleFactory 即可。扩充超能力的同时不再需要重新编辑超人的类文件，使得我们变得很轻松。但是，这才刚刚开始。</p><h3>IoC 容器的重要组成 —— 依赖注入</h3><p>由 “超人” 对 “超能力” 的依赖变成 “超人” 对 “超能力模组工厂” 的依赖后，对付小怪兽们变得更加得心应手。但这也正如你所看到的，依赖并未解除，只是由原来对多个外部的依赖变成了对一个 “工厂” 的依赖。假如工厂出了点麻烦，问题变得就很棘手。</p><blockquote>其实大多数情况下，工厂模式已经足够了。工厂模式的缺点就是：接口未知（即没有一个很好的契约模型，关于这个我马上会有解释）、产生对象类型单一。总之就是，还是不够灵活。虽然如此，工厂模式依旧十分优秀，并且适用于绝大多数情况。不过我们为了讲解后面的依赖注入 ，这里就先夸大一下工厂模式的缺陷咯。</blockquote><p>我们知道，超人依赖的模组，我们要求有统一的接口，这样才能和超人身上的注入接口对接，最终起到提升超能力的效果。</p><p>事实上，我之前说谎了，不仅仅只有一堆小怪兽，还有更多的大怪兽。嘿嘿。额，这时候似乎工厂的生产能力显得有些不足 —— 由于工厂模式下，所有的模组都已经在工厂类中安排好了，如果有新的、高级的模组加入，我们必须修改工厂类（好比增加新的生产线）：</p><pre>class SuperModuleFactory\r\n{\r\n    public function makeModule($moduleName, $options)\r\n    {\r\n        switch ($moduleName) {\r\n            case \'Fight\': \r\n                return new Fight($options[0], $options[1]);\r\n            case \'Force\': \r\n                return new Force($options[0]);\r\n            case \'Shot\': \r\n                return new Shot($options[0], $options[1], $options[2]);\r\n            // case \'more\': .......\r\n            // case \'and more\': .......\r\n            // case \'and more\': .......\r\n            // case \'oh no! its too many!\': .......\r\n        }\r\n    }\r\n}\r\n</pre><p>看到没。。。噩梦般的感受！</p><blockquote>其实灵感就差一步！你可能会想到更为灵活的办法！对，下一步就是我们今天的主要配角 —— DI （依赖注入）</blockquote><p>由于对超能力模组的需求不断增大，我们需要集合整个世界的高智商人才，一起解决问题，不应该仅仅只有几个工厂垄断负责。不过高智商人才们都非常自负，认为自己的想法是对的，创造出的超能力模组没有统一的接口，自然而然无法被正常使用。这时我们需要提出一种契约，这样无论是谁创造出的模组，都符合这样的接口，自然就可被正常使用。</p><pre>interface SuperModuleInterface\r\n{\r\n    /**\r\n     * 超能力激活方法\r\n     *\r\n     * 任何一个超能力都得有该方法，并拥有一个参数\r\n     *@param array $target 针对目标，可以是一个或多个，自己或他人\r\n     */\r\n    public function activate(array $target);\r\n}\r\n</pre><p>上文中，我们定下了一个接口 （超能力模组的规范、契约），所有被创造的模组必须遵守该规范，才能被生产。</p><p>其实，这就是 php&nbsp;中接口（ interface ）的用处和意义！很多人觉得，为什么 php 需要接口这种东西？难道不是 java 、 \r\nC# 之类的语言才有的吗？这么说，只要是一个正常的面向对象编程语言（虽然 php 可以面向过程），都应该具备这一特性。因为一个 \r\n对象（object） 本身是由他的模板或者原型 —— 类 （class） \r\n，经过实例化后产生的一个具体事物，而有时候，实现统一种方法且不同功能（或特性）的时候，会存在很多的类（class），这时候就需要有一个契约，让大家编写出可以被随时替换却不会产生影响的接口。这种由编程语言本身提出的硬性规范，会增加更多优秀的特性。</p><p>虽然有些绕，但通过我们接下来的实例，大家会慢慢领会接口带来的好处。</p><p>这时候，那些提出更好的超能力模组的高智商人才，遵循这个接口，创建了下述（模组）类：</p><pre>/**\r\n * X-超能量\r\n */\r\nclass XPower implements SuperModuleInterface\r\n{\r\n    public function activate(array $target)\r\n    {\r\n        // 这只是个例子。。具体自行脑补\r\n    }\r\n}\r\n\r\n/**\r\n * 终极炸弹 （就这么俗）\r\n */\r\nclass UltraBomb implements SuperModuleInterface\r\n{\r\n    public function activate(array $target)\r\n    {\r\n        // 这只是个例子。。具体自行脑补\r\n    }\r\n}\r\n</pre><p>同时，为了防止有些 “砖家” 自作聪明，或者一些叛徒恶意捣蛋，不遵守契约胡乱制造模组，影响超人，我们对超人初始化的方法进行改造：</p><pre>class Superman\r\n{\r\n    protected $module;\r\n\r\n    public function __construct(SuperModuleInterface $module)\r\n    {\r\n        $this-&gt;module = $module;\r\n    }\r\n}\r\n</pre><p>改造完毕！现在，当我们初始化 “超人” 类的时候，提供的模组实例必须是一个 SuperModuleInterface 接口的实现。否则就会提示错误。</p><p>正是由于超人的创造变得容易，一个超人也就不需要太多的超能力，我们可以创造多个超人，并分别注入需要的超能力模组即可。这样的话，虽然一个超人只有一个超能力，但超人更容易变多，我们也不怕怪兽啦！</p><p>现在有人疑惑了，你要讲的依赖注入呢？</p><p>其实，上面讲的内容，正是依赖注入。</p><h4>什么叫做依赖注入？</h4><p>本文从开头到现在提到的一系列依赖，只要不是由内部生产（比如初始化、构造函数 __construct 中通过工厂方法、自行手动 new \r\n的），而是由外部以参数或其他形式注入的，都属于依赖注入（DI） 。是不是豁然开朗？事实上，就是这么简单。下面就是一个典型的依赖注入：</p><pre>// 超能力模组\r\n$superModule = new XPower;\r\n// 初始化一个超人，并注入一个超能力模组依赖\r\n$superMan = new Superman($superModule);\r\n</pre><p>关于依赖注入这个本文的主要配角，也就这么多需要讲的。理解了依赖注入，我们就可以继续深入问题。慢慢走近今天的主角……</p><h3>更为先进的工厂 —— IoC 容器</h3><p>刚刚列了一段代码：</p><pre>$superModule = new XPower;\r\n$superMan = new Superman($superModule);\r\n</pre><p>读者应该看出来了，手动的创建了一个超能力模组、手动的创建超人并注入了刚刚创建超能力模组。呵呵，手动。</p><blockquote>现代社会，应该是高效率的生产，干净的车间，完美的自动化装配。</blockquote><p>一群怪兽来了，如此低效率产出超人是不现实，我们需要自动化 —— 最多一条指令，千军万马来相见。我们需要一种高级的生产车间，我们只需要向生产车间提交一个脚本，工厂便能够通过指令自动化生产。这种更为高级的工厂，就是工厂模式的升华 —— IoC 容器。</p><pre>class Container\r\n{\r\n    protected $binds;\r\n\r\n    protected $instances;\r\n\r\n    public function bind($abstract, $concrete)\r\n    {\r\n        if ($concrete instanceof Closure) {\r\n            $this-&gt;binds[$abstract] = $concrete;\r\n        } else {\r\n            $this-&gt;instances[$abstract] = $concrete;\r\n        }\r\n    }\r\n\r\n    public function make($abstract, $parameters = [])\r\n    {\r\n        if (isset($this-&gt;instances[$abstract])) {\r\n            return $this-&gt;instances[$abstract];\r\n        }\r\n\r\n        array_unshift($parameters, $this);\r\n\r\n        return call_user_func_array($this-&gt;binds[$abstract], $parameters);\r\n    }\r\n}\r\n</pre><p>这时候，一个十分粗糙的容器就诞生了。现在的确很简陋，但不妨碍我们进一步提升他。先着眼现在，看看这个容器如何使用吧！</p><pre>// 创建一个容器（后面称作超级工厂）\r\n$container = new Container;\r\n\r\n// 向该 超级工厂添加超人的生产脚本\r\n$container-&gt;bind(\'superman\', function($container, $moduleName) {\r\n    return new Superman($container-&gt;make($moduleName));\r\n});\r\n\r\n// 向该 超级工厂添加超能力模组的生产脚本\r\n$container-&gt;bind(\'xpower\', function($container) {\r\n    return new XPower;\r\n});\r\n\r\n// 同上\r\n$container-&gt;bind(\'ultrabomb\', function($container) {\r\n    return new UltraBomb;\r\n});\r\n\r\n// ****************** 华丽丽的分割线 **********************\r\n// 开始启动生产\r\n$superman_1 = $container-&gt;make(\'superman\', \'xpower\');\r\n$superman_2 = $container-&gt;make(\'superman\', \'ultrabomb\');\r\n$superman_3 = $container-&gt;make(\'superman\', \'xpower\');\r\n// ...随意添加\r\n</pre><p>看到没？通过最初的 绑定（bind） 操作，我们向 超级工厂 \r\n注册了一些生产脚本，这些生产脚本在生产指令下达之时便会执行。发现没有？我们彻底的解除了 超人 与 超能力模组 \r\n的依赖关系，更重要的是，容器类也丝毫没有和他们产生任何依赖！我们通过注册、绑定的方式向容器中添加一段可以被执行的回调（可以是匿名函数、非匿名函数、类的方法）作为生产一个类的实例的\r\n 脚本 ，只有在真正的 生产（make） 操作被调用执行时，才会触发。</p><p>这样一种方式，使得我们更容易在创建一个实例的同时解决其依赖关系，并且更加灵活。当有新的需求，只需另外绑定一个“生产脚本”即可。</p><p>实际上，真正的 IoC 容器更为高级。我们现在的例子中，还是需要手动提供超人所需要的模组参数，但真正的 IoC \r\n容器会根据类的依赖需求，自动在注册、绑定的一堆实例中搜寻符合的依赖需求，并自动注入到构造函数参数中去。Laravel \r\n框架的服务容器正是这么做的。实现这种功能其实理论上并不麻烦，但我并不会在本文中写出，因为……我懒得写。</p><p>不过我告诉大家，这种自动搜寻依赖需求的功能，是通过<a href=\"http://laravelacademy.org/tags/%e5%8f%8d%e5%b0%84\" target=\"_blank\">反射</a>（Reflection）实现的，恰好的，php 完美的支持反射机制！关于反射，php 官方文档有详细的资料，并且中文翻译基本覆盖，足够学习和研究：</p><p><a href=\"http://php.net/manual/zh/book.reflection.php\" target=\"_blank\">http://php.net/manual/zh/book.reflection.php</a></p><p>现在，到目前为止，我们已经不再惧怕怪兽们了。高智商人才集思广益，井井有条，根据接口契约创造规范的超能力模组。超人开始批量产出。最终，人人都是超人，你也可以是哦！</p><h3>重新审视 Laravel 的核心</h3><p>现在，我们开始慢慢解读 Laravel 的核心。其实，Laravel 的核心就是一个 IoC 容器，也恰好是我之前所说的高级的 IoC 容器。</p><p>可以说，Laravel 的核心本身十分轻量，并没有什么很神奇很实质性的应用功能。很多人用到的各种功能模块比如 \r\nRoute（路由）、Eloquent ORM（数据库 ORM \r\n组件）、Request（请求）以及&nbsp;Response（响应）等等等等，实际上都是与核心无关的类模块提供的，这些类从注册到实例化，最终被你所使用，其实都是\r\n Laravel 的服务容器负责的。</p><p>我们以大家最常见的 Route 类作为例子。大家可能经常见到路由定义是这样的：</p><pre>Route::get(\'/\', function() {\r\n    // bla bla bla...\r\n});\r\n</pre><p>实际上， Route 类被定义在这个命名空间：Illuminate\\Routing\\Router，文件 vendor/laravel/framework/src/Illuminate/Routing/Router.php。</p><p>我们通过打开发现，这个类的这一系列方法，如 get，post，any 等都不是静态（static）方法，这是怎么一回事儿？不要急，我们继续。</p><h4><a href=\"http://laravelacademy.org/tags/%e6%9c%8d%e5%8a%a1%e6%8f%90%e4%be%9b%e8%80%85\" target=\"_blank\">服务提供者</a></h4><p>我们在前文介绍 IoC 容器的部分中，提到了，一个类需要绑定、注册至容器中，才能被“制造”。</p><p>对，一个类要被容器所能够提取，必须要先注册至这个容器。既然 Laravel 称这个容器叫做服务容器，那么我们需要某个服务，就得先注册、绑定这个服务到容器，那么提供服务并绑定服务至容器的东西，就是服务提供者（Service Provider）。</p><p>虽然，绑定一个类到容器不一定非要通过服务提供者。</p><p>但是，我们知道，有时候我们的类、模块会有需要其他类和组件的情况，为了保证初始化阶段不会出现所需要的模块和组件没有注册的情况，Laravel 将注册和初始化行为进行拆分，注册的时候就只能注册，初始化的时候就是初始化。拆分后的产物就是现在的服务提供者。</p><p>服务提供者主要分为两个部分，register（注册） 和 boot（引导、初始化），具体参考<a href=\"http://laravelacademy.org/post/91.html\">文档</a>。register 负责进行向容器注册“脚本”，但要注意注册部分不要有对未知事物的依赖，如果有，就要移步至 boot 部分。</p><h4>门面（<a href=\"http://laravelacademy.org/tags/facade\" target=\"_blank\">Facade</a>）</h4><p>我们现在解答之前关于 Route 的方法为何能以静态方法访问的问题。实际上这个问题文档上有写，简单说来就是模拟一个类，提供一个静态魔术方法__callStatic，并将该静态方法映射到真正的方法上。</p><p>我们使用的 Route 类实际上是 Illuminate\\Support\\Facades\\Route 通过 class_alias() 函数创造的别名而已，这个类被定义在文件 vendor/laravel/framework/src/Illuminate/Support/Facades/Route.php 。</p><p>我们打开文件一看……诶？怎么只有这么简单的一段代码呢？</p><pre>&lt;?php \r\n    namespace Illuminate\\Support\\Facades;\r\n\r\n    /**\r\n     * @see \\Illuminate\\Routing\\Router\r\n     */\r\n    class Route extends Facade {\r\n\r\n        /**\r\n         * Get the registered name of the component.\r\n         *\r\n         * @return string\r\n         */\r\n        protected static function getFacadeAccessor()\r\n        {\r\n            return \'router\';\r\n        }\r\n\r\n}\r\n</pre><p>其实仔细看，会发现这个类继承了一个叫做 Facade 的类，到这里谜底差不多要解开了。</p><p>上述简单的定义中，我们看到了 getFacadeAccessor 方法返回了一个 route，这是什么意思呢？事实上，这个值被一个 ServiceProvider 注册过，大家应该知道注册了个什么，当然是那个真正的路由类！</p><p>有人会问，<a href=\"http://laravelacademy.org/post/97.html\">Facade</a> 是怎么实现的。我并不想说得太细，一个是我懒，另一个原因就是，自己发现一些东西更容易理解，并不容易忘记。很多细节我已经说了，建议大家自行去研究。</p><p></p><blockquote>本文整理自：https://www.insp.top/article/learn-laravel-container</blockquote><p><br></p>', '8', '2018-01-11 17:47:10', '2017-12-04 09:07:57', '1');
INSERT INTO `posts` VALUES ('22', '我曾七次鄙视自己的灵魂:', '<br><p>\r\n第一次,当它本可进取时，却故作谦卑；</p><br><p>\r\n第二次,当它空虚时，用爱欲来填充；</p><br><p>\r\n第三次,在困难和容易之间，它选择了容易；</p><br><p>\r\n第四次,它犯了错，却借由别人也会犯错来宽慰自己；</p><br><p>\r\n第五次,它自由软弱，却把它认为是生命的坚韧；</p><br><p>\r\n第六次,当它鄙夷一张丑恶的嘴脸时，却不知那正是自己面具中的一副；</p><br><p>\r\n第七次,它侧身于生活的污泥中虽不甘心，却又畏首畏尾。</p><p><br></p>', '8', '2018-01-11 17:45:23', '2017-12-07 01:27:12', '1');
INSERT INTO `posts` VALUES ('23', 'wwwwwwwwwwww', '<p>wwwwwwwwwwwwwwww<br></p>', '8', '2018-01-18 14:02:45', '2018-01-17 03:31:10', '-1');
INSERT INTO `posts` VALUES ('24', 'QQQQQQQQ', '<p>QQQQQQQQQQQQQQQ<br></p>', '8', '2018-01-18 14:02:44', '2018-01-17 03:31:41', '-1');
INSERT INTO `posts` VALUES ('25', 'WEWQTRQTQWTRQ', 'RQWTQTQT', '8', '2018-01-18 14:02:43', '2018-01-17 03:32:16', '-1');

-- ----------------------------
-- Table structure for `post_topics`
-- ----------------------------
DROP TABLE IF EXISTS `post_topics`;
CREATE TABLE `post_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL DEFAULT '0',
  `topic_id` int(11) NOT NULL DEFAULT '0',
  `created_at` varchar(255) NOT NULL DEFAULT '0',
  `updated_at` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `post_topics_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `post_topics_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of post_topics
-- ----------------------------
INSERT INTO `post_topics` VALUES ('1', '18', '1', '2018-01-04 01:01:45', '2018-01-04 01:01:45');
INSERT INTO `post_topics` VALUES ('2', '19', '1', '2018-01-04 01:01:45', '2018-01-04 01:01:45');
INSERT INTO `post_topics` VALUES ('3', '20', '1', '2018-01-04 02:14:40', '2018-01-04 02:14:40');
INSERT INTO `post_topics` VALUES ('4', '21', '1', '2018-01-18 06:20:15', '2018-01-18 06:20:15');

-- ----------------------------
-- Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desc` varchar(255) NOT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'post-man', '文章管理员', null, null);
INSERT INTO `role` VALUES ('2', 'system-man', '系统管理员', null, null);

-- ----------------------------
-- Table structure for `role_user`
-- ----------------------------
DROP TABLE IF EXISTS `role_user`;
CREATE TABLE `role_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `role_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `admin_users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `role_user_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_user
-- ----------------------------
INSERT INTO `role_user` VALUES ('4', '1', '1');
INSERT INTO `role_user` VALUES ('5', '1', '2');

-- ----------------------------
-- Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for `topics`
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `created_at` varchar(255) NOT NULL DEFAULT '0',
  `updated_at` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topics
-- ----------------------------
INSERT INTO `topics` VALUES ('1', 'laravel', '0', '0');
INSERT INTO `topics` VALUES ('2', 'qwer', '2018-03-23 03:22:49', '2018-03-23 03:22:49');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(60) NOT NULL,
  `name` varchar(20) NOT NULL DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `avatar` varchar(225) DEFAULT NULL,
  `age` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3', '123', '989898', '95a6dfs5@q.com', null, null, '4');
INSERT INTO `user` VALUES ('7', '123456', 'lalala', '9696@q.com', null, null, '0');
INSERT INTO `user` VALUES ('8', '$2y$10$tUB6.uXSaTgUM9b8/4sopuHMO6PJ3joz7.Uqelolss8BxAB0FNWOa', 'yuanxuguang', '969713894@qq.com', 'vkj56FCAkMVoCeXJY6RJl7Fftz6UVyacEGWcyTnxIQrHWSpgjXCyWDk3Lz5B', '/uploads/151625553512693.png', '0');
INSERT INTO `user` VALUES ('9', '$2y$10$a9Ny/x2lUZFvGAyQjleApOwrhZ5yXdBUpxS/2LsjU4lXynhsc.cu6', 'test2', 'test2@qq.com', 'QDEa332s8D9JxFqMJ9sFOlaWTdR6OAWG05rcuqa4Jw4PGyxpf1jw1SS6K6Ky', null, '0');

-- ----------------------------
-- Table structure for `zans`
-- ----------------------------
DROP TABLE IF EXISTS `zans`;
CREATE TABLE `zans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `created_at` int(11) NOT NULL DEFAULT '0',
  `updated_at` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `zans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `zans_ibfk_2` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zans
-- ----------------------------
INSERT INTO `zans` VALUES ('5', '8', '14', '0', '0');
INSERT INTO `zans` VALUES ('16', '9', '17', '0', '0');
INSERT INTO `zans` VALUES ('17', '9', '16', '0', '0');
INSERT INTO `zans` VALUES ('19', '8', '18', '0', '0');
