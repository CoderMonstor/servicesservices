-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hicdu
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activityId` int unsigned NOT NULL AUTO_INCREMENT COMMENT '活动ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-正常, 0-取消, 2-结束',
  `hostUserId` int NOT NULL COMMENT '主办用户ID',
  `activityName` varchar(100) NOT NULL COMMENT '活动名称',
  `activityImage` varchar(255) DEFAULT NULL COMMENT '封面图URL',
  `activityTime` datetime NOT NULL COMMENT '活动时间',
  `location` varchar(100) NOT NULL COMMENT '活动地点',
  `maxParticipants` int unsigned NOT NULL COMMENT '最大参与人数',
  `details` longtext COMMENT '活动详情（富文本）',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`activityId`),
  KEY `idx_hostUserId` (`hostUserId`),
  FULLTEXT KEY `ft_search` (`activityName`,`location`,`details`),
  CONSTRAINT `activities_ibfk_1` FOREIGN KEY (`hostUserId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,16,'一起去图书馆','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-06-04 09:58:38','成都大学图书馆八楼',5,'有没有小伙伴一起去图书馆学习的呀？一个人有点学不进去，我们互相监督对方。共同促进，共同学习，共同进步，加油冲冲冲！！！就在学校图书馆8楼左转第一个位置','2025-03-30 13:43:47','2025-05-12 05:40:50'),(2,1,17,'打篮球','/images/161743062993357.jpg','2025-05-12 16:00:16','成都',6,'打篮球是一项充满活力和团队协作的运动，既锻炼身体的协调性和耐力，也培养快速反应和策略意识。无论是在室内篮球馆还是户外球场，参与者通过运球、传球、投篮等动作，不仅增强体能，还享受竞争与合作带来的乐趣。篮球还能促进友谊，提升自信，是一项老少皆宜的健康运动。','2025-03-31 08:01:35','2025-05-12 05:40:50'),(3,1,18,'打羽毛球','/images/161743062993357.jpg','2025-04-13 16:02:27','16栋',2,'羽毛球是一项灵活且快速的运动，通过精准的击球和敏捷的跑动，锻炼身体的反应能力和耐力。不论是休闲娱乐还是竞技比赛，羽毛球都能带来愉快的锻炼体验。','2025-03-31 08:03:47','2025-05-12 05:40:50'),(4,1,12,'打台球','/images/12_1743156752035.jpeg','2025-04-10 19:00:54','成都',3,'台球考验技巧与耐心，是安静且有趣的休闲活动。','2025-04-06 11:01:39','2025-05-12 05:39:49'),(6,0,17,'一起看电影','/images/161743062993357.jpg','2025-06-12 16:00:16','成都',6,'朋友们聚在一起看电影，不仅是欣赏视听艺术，更是分享情感和建立联系的时刻。不同的电影故事带来不同的感动和思考，让人放松且增长见识。','2025-03-31 08:01:35','2025-05-15 09:16:04'),(7,1,18,'作业辅导','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'互相帮助解决学习难题，提升成绩。','2025-03-31 08:03:47','2025-05-12 05:39:49'),(9,1,18,'购物 ','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'逛街购物不仅能满足生活需求，还能发现潮流和新奇，放松心情，享受挑选的乐趣。','2025-03-31 08:03:47','2025-05-12 05:39:49'),(10,1,12,'吃饭','/images/12_1743156752035.jpeg','2025-04-10 19:00:54','成都',3,'聚餐不仅满足味蕾，更是促进感情的美好时刻。','2025-04-06 11:01:39','2025-05-12 05:39:49'),(12,1,17,'看电影','/images/161743062993357.jpg','2025-03-12 16:00:16','成都',6,'在电影院享受大银幕带来的震撼视觉，体验不同人生与故事的魅力。','2025-03-31 08:01:35','2025-05-12 05:39:49'),(13,1,18,'打篮球','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'找个人打篮球','2025-03-31 08:03:47','2025-05-12 05:39:49'),(14,1,18,'打排球','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'充满活力的排球运动，强调团队合作和快速反应，每一次扣杀都令人振奋。','2025-03-31 08:03:47','2025-05-12 05:39:49'),(15,1,18,'打羽毛球','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'快速运动，有利于身体健康。','2025-03-31 08:03:47','2025-05-12 05:39:49'),(16,1,12,'去钓鱼','/images/12_1743156752035.jpeg','2025-04-10 19:00:54','成都',3,'钓鱼是一项需要耐心与专注的活动，享受湖边或河畔的宁静，感受自然的魅力。','2025-04-06 11:01:39','2025-05-12 05:39:49'),(17,0,16,'Live house 轰趴','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'在Live house感受现场音乐的震撼，和好友们一起尽情欢笑、跳舞，释放所有压力，享受青春的热情与活力。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(18,1,17,'晒晒太阳','/images/161743062993357.jpg','2025-03-12 16:00:16','成都',6,'享受阳光，补充活力。','2025-03-31 08:01:35','2025-05-12 05:39:49'),(19,1,18,'组队打游戏','/images/161743062993357.jpg','2025-03-13 16:02:27','16栋',2,'在线组队合作，体验策略与配合带来的胜利喜悦，是放松和提升团队精神的好方式。','2025-03-31 08:03:47','2025-05-12 05:39:49'),(20,0,16,'三角洲行动','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'刺激的战术射击游戏，考验反应和配合。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(21,0,16,'APEX!!!','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'快节奏的射击竞技，挑战个人技巧和团队战术，是游戏爱好者的最爱。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(23,0,16,'去爬山','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'挑战自我，亲近自然。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(24,1,16,'都江堰一日游','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'游览千年水利工程，感受历史文化与自然风光的完美融合，是一次有意义的旅行体验。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(25,0,16,'龙泉山有伙伴吗？','/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','2025-03-04 09:58:38','成都',5,'期待有人同行，共享登山乐趣，探索自然的魅力。','2025-03-30 14:43:47','2025-05-12 05:39:49'),(27,1,1,'图书馆学习','/images/1_1747040867125.jpeg￥','2025-05-30 09:00:00','四川省成都市龙泉驿区锦城北二路',3,'找几个人一起去图书馆学习','2025-05-12 09:07:49','2025-05-12 09:07:49'),(33,1,16,'活动7','/images/16_1747060216129.jpg￥','2025-05-31 18:30:00','四川省成都市龙泉驿区陈英路',2,'活动7','2025-05-12 14:30:17','2025-05-12 14:30:17');
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminId` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录账户',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登录密码',
  PRIMARY KEY (`adminId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (5,'admin','123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chatroom`
--

DROP TABLE IF EXISTS `chatroom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatroom` (
  `roomId` int NOT NULL AUTO_INCREMENT COMMENT '聊天室ID',
  `sender` int NOT NULL COMMENT '用户1（发送者，较小ID）',
  `receiver` int NOT NULL COMMENT '用户2（接收者，较大ID）',
  `createdTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`roomId`),
  UNIQUE KEY `unique_user_pair` (`sender`,`receiver`),
  KEY `chatroom_ibfk_2` (`receiver`),
  CONSTRAINT `chatroom_ibfk_1` FOREIGN KEY (`sender`) REFERENCES `user` (`userId`),
  CONSTRAINT `chatroom_ibfk_2` FOREIGN KEY (`receiver`) REFERENCES `user` (`userId`),
  CONSTRAINT `chk_sender_receiver` CHECK ((`sender` < `receiver`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='聊天室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatroom`
--

LOCK TABLES `chatroom` WRITE;
/*!40000 ALTER TABLE `chatroom` DISABLE KEYS */;
INSERT INTO `chatroom` VALUES (3,1,12,'2025-03-13 22:46:21'),(4,12,16,'2025-03-13 23:06:03'),(5,16,17,'2025-03-26 23:33:55'),(6,16,18,'2025-04-12 21:41:08'),(7,1,16,'2025-05-11 05:06:13'),(8,12,17,'2025-05-17 09:56:20');
/*!40000 ALTER TABLE `chatroom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectactivity`
--

DROP TABLE IF EXISTS `collectactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collectactivity` (
  `collectId` int unsigned NOT NULL AUTO_INCREMENT COMMENT '收藏ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `activityId` int unsigned NOT NULL COMMENT '活动ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1-有效, 0-取消',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`collectId`),
  UNIQUE KEY `uni_user_activity` (`userId`,`activityId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_activityId` (`activityId`),
  CONSTRAINT `collectactivity_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `collectactivity_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动收藏';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectactivity`
--

LOCK TABLES `collectactivity` WRITE;
/*!40000 ALTER TABLE `collectactivity` DISABLE KEYS */;
INSERT INTO `collectactivity` VALUES (3,17,1,1,'2025-03-30 15:29:39','2025-03-30 15:29:39'),(4,18,1,1,'2025-03-30 15:29:50','2025-03-30 15:29:50');
/*!40000 ALTER TABLE `collectactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collectgoods`
--

DROP TABLE IF EXISTS `collectgoods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collectgoods` (
  `userId` int DEFAULT NULL COMMENT '用户id',
  `goodsId` int DEFAULT NULL COMMENT '商品id',
  `collectTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '收藏时间',
  UNIQUE KEY `idx_user_goods` (`userId`,`goodsId`),
  KEY `userId` (`userId`),
  KEY `goodsId` (`goodsId`),
  CONSTRAINT `fk_collection_goods` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`),
  CONSTRAINT `fk_collection_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collectgoods`
--

LOCK TABLES `collectgoods` WRITE;
/*!40000 ALTER TABLE `collectgoods` DISABLE KEYS */;
INSERT INTO `collectgoods` VALUES (12,83,'2025-03-29 00:17:14'),(16,81,'2025-03-31 19:59:16'),(16,70,'2025-03-31 20:32:27'),(16,73,'2025-03-31 22:34:38'),(16,87,'2025-03-31 22:34:51'),(12,86,'2025-04-15 16:41:29'),(12,70,'2025-04-15 16:41:37'),(16,86,'2025-05-04 23:51:08'),(1,112,'2025-05-12 16:40:27'),(17,138,'2025-05-17 11:35:42');
/*!40000 ALTER TABLE `collectgoods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `postId` int DEFAULT NULL COMMENT '评论属于哪个动态',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`commentId`) USING BTREE,
  KEY `comments_ibfk_1` (`userId`) USING BTREE,
  KEY `comments_ibfk_2` (`postId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (29,17,122,'123','/images/171741618269765.jpg','2025-03-10 14:51:10'),(30,17,122,'456','/images/171741618760213.jpg','2025-03-10 14:59:20'),(31,17,121,'图片评论','/images/171741619391225.jpg','2025-03-10 15:09:51'),(32,12,122,'1231321321323','','2025-03-11 07:59:46'),(33,12,122,'123','','2025-03-11 09:55:04'),(34,12,123,'444455666','','2025-03-11 10:23:41'),(35,12,121,'图片评论','/images/121741703794326.jpg','2025-03-11 14:36:34'),(36,12,127,'hahahahaha','','2025-03-11 15:40:10'),(37,16,135,'123','','2025-03-25 06:23:55'),(38,16,135,'13246','','2025-03-25 06:24:22'),(39,16,134,'123','','2025-03-26 14:51:11'),(40,16,134,'345','','2025-03-26 14:51:15'),(41,16,134,'567','','2025-03-26 14:51:21'),(42,16,134,'678','','2025-03-26 14:51:26'),(43,16,134,'789','','2025-03-26 14:51:32'),(44,16,134,'890','','2025-03-26 14:51:40'),(45,16,125,'      // 核心变化：MultiImagePicker.pickImages → AssetPicker.pickAssets','','2025-03-26 15:49:50'),(46,16,125,'D/EGL_emulation(15177): app_time_stats: avg=500.05ms min=499.41ms max=500.69ms count=2D/EGL_emulation(15177): app_time_stats: avg=423.88ms min=271.77ms max=500.32ms count=3','','2025-03-26 15:59:03'),(47,16,135,'图片评论','/images/161743061118207.jpg','2025-03-27 07:38:38'),(49,1,149,'真好看','','2025-05-12 16:19:19'),(50,1,149,'今天是星期五','','2025-05-12 16:21:12'),(51,1,145,'测试数据','','2025-05-12 16:23:18'),(52,17,152,'ok','/images/171747452561493.webp','2025-05-17 11:29:21'),(53,17,152,'123','','2025-05-17 11:33:49');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discuss`
--

DROP TABLE IF EXISTS `discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discuss` (
  `discussId` int unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `activityId` int unsigned NOT NULL COMMENT '活动ID',
  `replyId` int unsigned DEFAULT '0' COMMENT '回复的评论ID（直接上级评论）',
  `parentId` int unsigned DEFAULT '0' COMMENT '主评论ID（最顶级评论）',
  `content` text NOT NULL COMMENT '评论内容',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`discussId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_activityId` (`activityId`),
  KEY `idx_replyId` (`replyId`),
  KEY `idx_parentId` (`parentId`),
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动评论';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discuss`
--

LOCK TABLES `discuss` WRITE;
/*!40000 ALTER TABLE `discuss` DISABLE KEYS */;
INSERT INTO `discuss` VALUES (1,16,1,0,0,'这个活动太棒了！期待下次举办！','2025-03-31 07:57:39','2025-03-31 07:57:39'),(2,12,1,0,0,'交通指引不太清晰，建议改进','2025-03-31 07:57:39','2025-03-31 07:57:39'),(3,17,1,1,1,'同感！组织得非常专业！','2025-03-31 07:57:57','2025-03-31 07:57:57'),(4,16,1,2,2,'是的，找了好久才找到入口','2025-03-31 07:57:57','2025-03-31 07:57:57'),(5,18,1,3,1,'尤其是互动环节，设计得很用心~这个活动太棒了！期待下次举办！这个活动太棒了！期待下次举办！这个活动太棒了！期待下次举办！','2025-03-31 07:58:41','2025-04-03 14:42:45'),(6,17,1,1,1,'什么玩意儿？','2025-04-04 14:21:40','2025-04-04 14:21:40'),(7,12,1,4,2,'what FUCK?','2025-04-04 14:22:53','2025-04-04 14:24:12'),(8,16,1,7,2,'chairman mao said that , I love CDU','2025-04-04 14:25:41','2025-04-04 14:25:41'),(9,17,1,0,0,'实现中华民族伟大复兴是我义不容辞的责任','2025-04-04 14:27:00','2025-04-04 14:27:00'),(10,18,1,9,9,'me too','2025-04-04 14:29:20','2025-04-04 14:29:20'),(11,12,1,10,9,'就是就是','2025-04-04 14:31:16','2025-04-04 14:31:16'),(12,12,1,0,0,'123','2025-04-04 15:02:01','2025-04-04 15:02:01'),(13,12,1,12,12,'456','2025-04-04 15:02:20','2025-04-04 15:02:20'),(14,12,1,6,1,'hhh','2025-04-04 15:03:08','2025-04-04 15:03:08'),(15,16,4,0,0,'hhhhhactive.activityTime!','2025-04-06 11:03:53','2025-04-06 11:03:53'),(16,16,4,0,0,'@Select(\"\"\"     SELECT          a.*,          (SELECT CAST(COUNT(*) AS SIGNED) FROM registration WHERE activityId = a.activityId) AS `currentParticipants`,         (CASE WHEN EXISTS (             SELECT 1 FROM registration r             WHERE r.userId = #{userId} AND r.activityId = a.activityId         ) THEN CAST(1 AS SIGNED) ELSE CAST(0 AS SIGNED) END) AS `isRegistered`     FROM activities a     WHERE hostUserId = #{userId}\"\"\")@ResultMap(\"activityMap\")List<Activities> getActivitiesByUser(@Param(\"userId\") Integer userId);','2025-04-06 11:04:03','2025-04-06 11:04:03'),(17,16,4,16,16,'/images/12_1743156752035.jpeg','2025-04-06 11:04:15','2025-04-06 11:04:15'),(18,16,2,0,0,'Welcome to Gboard clipboard, any text you copy will be saved here.','2025-04-06 11:04:32','2025-04-06 11:04:32'),(19,16,2,18,18,'Use the edit icon to pin, add or delete clips.','2025-04-06 11:04:44','2025-04-06 11:04:44'),(20,16,2,19,18,'Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.','2025-04-06 11:04:48','2025-04-06 11:04:48'),(21,16,6,0,0,'3131331','2025-05-04 15:55:10','2025-05-04 15:55:10'),(22,16,6,21,21,'3131313','2025-05-04 15:55:12','2025-05-04 15:55:12'),(23,16,6,0,0,'13131313131313','2025-05-04 15:55:18','2025-05-04 15:55:18'),(24,16,6,23,23,'import \'package:flutter/material.dart\';import \'dart:async\';class MyErrorWidget extends StatefulWidget {  final String message;  final IconData? icon;  final int countdownSeconds;  final VoidCallback onClose;  final List<Widget>? actions;  final Color? backgroundColor;  final Color? iconColor;  const MyErrorWidget({    super.key,    required this.message,    this.icon = Icons.error_outline,    this.countdownSeconds = 5,    required this.onClose,    this.actions,    this.backgroundColor,    this.iconColor,  });  @override  State<MyErrorWidget> createState() => _MyErrorWidgetState();}class _MyErrorWidgetState extends State<MyErrorWidget> {  late Timer _timer;  int _remainingSeconds = 0;  @override  void initState() {    super.initState();    _remainingSeconds = widget.countdownSeconds;    _startCountdown();  }  void _startCountdown() {    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {      if (!mounted) return;      setState(() => _remainingSeconds--);      if (_remainingSeconds <= 0) {        timer.cancel();        widget.onClose();      }    });  }  @override  void dispose() {    _timer.cancel();    super.dispose();  }  @override  Widget build(BuildContext context) {    final theme = Theme.of(context);    final isDark = theme.brightness == Brightness.dark;    final bgColor = widget.backgroundColor ?? (isDark ? Colors.grey[900]! : Colors.white);    final iconColor = widget.iconColor ?? (isDark ? Colors.red[300]! : Colors.red[700]!);    return Scaffold(      backgroundColor: bgColor, // 全屏背景色      body: Center(        child: Material(          color: Colors.transparent,          child: AnimatedContainer(            duration: const Duration(milliseconds: 300),            curve: Curves.easeInOut,            width: MediaQuery.of(context).size.width * 0.8,            constraints: const BoxConstraints(maxWidth: 600),            decoration: BoxDecoration(              color: Colors.white, // 卡片背景色              borderRadius: BorderRadius.circular(16),              boxShadow: [                BoxShadow(                  color: Colors.black.withOpacity(isDark ? 0.3 : 0.15),                  blurRadius: 24,                  offset: const Offset(0, 8),                ),              ],            ),            padding: const EdgeInsets.all(24),            child: _buildContent(theme, isDark, iconColor),          ),        ),      ),    );  }  Widget _buildContent(ThemeData theme, bool isDark, Color iconColor) {    return Column(      mainAxisSize: MainAxisSize.min,      children: [        Icon(          widget.icon,          size: 64,          color: iconColor,        ),        const SizedBox(height: 16),        Text(          widget.message,          style: theme.textTheme.titleLarge?.copyWith(            color: isDark ? Colors.white : Colors.black87,            height: 1.4,          ),          textAlign: TextAlign.center,        ),        const SizedBox(height: 8),        if (widget.countdownSeconds > 0)          Padding(            padding: const EdgeInsets.only(top: 8),            child: Text.rich(              TextSpan(                children: [                  TextSpan(text: \'自动关闭 \'),                  TextSpan(                    text: \'$_remainingSeconds\',                    style: TextStyle(                      fontWeight: FontWeight.bold,                      color: iconColor,                    ),                  ),                ],              ),              style: theme.textTheme.bodyMedium?.copyWith(                color: isDark ? Colors.white60 : Colors.black54,              ),            ),          ),        const SizedBox(height: 24),        if (widget.actions != null)          Row(            mainAxisAlignment: MainAxisAlignment.center,            children: widget.actions!                .map((action) => Padding(              padding: const EdgeInsets.symmetric(horizontal: 8),              child: action,            ))                .toList(),          )        else          ElevatedButton(            onPressed: widget.onClose,            style: ElevatedButton.styleFrom(              backgroundColor: iconColor,              foregroundColor: bgColor == Colors.white ? Colors.black : Colors.white,              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),              shape: RoundedRectangleBorder(                borderRadius: BorderRadius.circular(8),              ),              elevation: 0,            ),            child: const Text(\'返回\', style: TextStyle(fontWeight: FontWeight.bold)),          ),      ],    );  }}','2025-05-04 15:55:37','2025-05-04 15:55:37'),(25,16,1,0,0,'qet','2025-05-04 16:01:06','2025-05-04 16:01:06');
/*!40000 ALTER TABLE `discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fans`
--

DROP TABLE IF EXISTS `fans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fans` (
  `fanId` int NOT NULL COMMENT '粉丝',
  `followedId` int NOT NULL COMMENT '被关注的人的ID',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`fanId`,`followedId`) USING BTREE,
  KEY `followedId` (`followedId`) USING BTREE,
  CONSTRAINT `fans_ibfk_1` FOREIGN KEY (`fanId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fans_ibfk_2` FOREIGN KEY (`followedId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fans`
--

LOCK TABLES `fans` WRITE;
/*!40000 ALTER TABLE `fans` DISABLE KEYS */;
INSERT INTO `fans` VALUES (1,12,'2024-02-29'),(12,17,NULL),(12,18,NULL),(16,1,'2019-03-07'),(16,12,NULL),(16,17,NULL),(17,1,'2018-03-15'),(17,16,NULL);
/*!40000 ALTER TABLE `fans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods`
--

DROP TABLE IF EXISTS `goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goods` (
  `goodsId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL COMMENT '发布人id',
  `type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '0:闲置 1：求购',
  `goodsName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '商品名称',
  `goodsDesc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `goodsPrice` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '图片',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0:上架 1：下架',
  `sellStatus` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0:未出售 1：已出售',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`goodsId`),
  KEY `userId` (`userId`),
  CONSTRAINT `fk_goods_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods`
--

LOCK TABLES `goods` WRITE;
/*!40000 ALTER TABLE `goods` DISABLE KEYS */;
INSERT INTO `goods` VALUES (70,17,'0','17-1-小米','遥遥领先超级无敌宇宙第一好用的小米爆炸手机',1111.00,'/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','0','2025-03-24 19:56:49'),(72,17,'0','17-2-小米','遥遥领先超级无敌宇宙第一好用的xiaomi爆炸手机',1101.00,'/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','1','0','2025-03-24 19:56:53'),(73,16,'0','16-1','遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，\n遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机',1300.00,'/images/12_1741705068601.jpg￥/images/16_1746373524301.jpg￥/images/16_1746373524493.jpeg','0','1','2025-03-24 19:56:55'),(77,16,'0','16-2','widget.goods?.goodsDesc',199.00,'/images/0_1743076763222.jpg','1','0',NULL),(79,16,'0','16-3','test0001',191.00,'/images/0_1743077683999.jpeg','0','1',NULL),(80,16,'1','16-4','want somebody help me',20.00,'/images/0_1743077750322.jpg','0','0',NULL),(81,16,'1','16-5','need a computer , anybody have a computer?',30.00,'/images/16_1743082964030.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','0',NULL),(83,12,'0','1314','1245684',123.00,'/images/12_1743146919213.jpg','0','0',NULL),(85,12,'0','999','999999',99999.00,'/images/12_1743148662858.jpeg￥/images/12_1743148662924.jpg￥/images/12_1743148662984.jpeg￥/images/12_1743148663057.jpeg￥/images/12_1743148663122.jpg','0','0',NULL),(86,12,'0','789','789789->123123',4666.00,'/images/12_1743149741996.jpg￥/images/12_1743149742101.jpeg￥/images/12_1743149742160.jpeg￥/images/12_1743149742241.jpeg','0','1',NULL),(87,12,'1','cat','cat',999.00,'/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','0','0',NULL),(88,17,'0','17-1-小米','遥遥领先超级无敌宇宙第一好用的小米爆炸手机',1111.00,'/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','0','2025-03-24 19:56:49'),(89,17,'0','17-2-小米','遥遥领先超级无敌宇宙第一好用的xiaomi爆炸手机',1101.00,'/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','1','0','2025-03-24 19:56:53'),(90,16,'0','16-1','遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，\n遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机',1300.00,'/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','1','2025-03-24 19:56:55'),(91,16,'0','16-2','widget.goods?.goodsDesc',199.00,'/images/0_1743076763222.jpg','1','0',NULL),(92,16,'0','16-3','test0001',191.00,'/images/0_1743077683999.jpeg','0','1',NULL),(93,16,'1','16-4','want somebody help me',20.00,'/images/0_1743077750322.jpg','0','0',NULL),(103,12,'0','1314','1245684',123.00,'/images/12_1743146919213.jpg','0','0',NULL),(105,12,'0','1314','1245684',123.00,'/images/12_1743146919213.jpg','0','0',NULL),(106,12,'0','999','999999',99999.00,'/images/12_1743148662858.jpeg￥/images/12_1743148662924.jpg￥/images/12_1743148662984.jpeg￥/images/12_1743148663057.jpeg￥/images/12_1743148663122.jpg','0','1',NULL),(112,17,'0','17-1-小米','遥遥领先超级无敌宇宙第一好用的小米爆炸手机',1111.00,'/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','1','2025-03-24 19:56:49'),(113,17,'0','17-2-小米','遥遥领先超级无敌宇宙第一好用的xiaomi爆炸手机',1101.00,'/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','1','0','2025-03-24 19:56:53'),(114,16,'0','16-1','遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，\n遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机',1300.00,'/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','1','2025-03-24 19:56:55'),(115,16,'0','16-2','widget.goods?.goodsDesc',199.00,'/images/0_1743076763222.jpg','1','0','2025-03-25 19:56:55'),(117,16,'1','16-4','want somebody help me',20.00,'/images/0_1743077750322.jpg','0','0','2025-03-26 19:56:55'),(121,12,'1','cat','cat',999.00,'/images/12_1743149845103.jpeg￥/images/12_1743156751933.jpeg￥/images/12_1743156752035.jpeg','0','0','2025-03-27 19:56:55'),(122,17,'0','17-1-小米','遥遥领先超级无敌宇宙第一好用的小米爆炸手机',1111.00,'/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','1','2025-03-24 19:56:49'),(123,17,'0','17-2-小米','遥遥领先超级无敌宇宙第一好用的xiaomi爆炸手机',1101.00,'/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','1','0','2025-03-24 19:56:53'),(124,16,'0','16-1','遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，\n遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机，遥遥领先超级无敌宇宙第一好用的huawei爆炸手机',1300.00,'/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg','0','1','2025-03-24 19:56:55'),(125,16,'0','16-2','widget.goods?.goodsDesc',199.00,'/images/0_1743076763222.jpg','1','0',NULL),(126,16,'0','16-3','test0001',191.00,'/images/0_1743077683999.jpeg','0','1',NULL),(129,12,'0','1314','1245684',123.00,'/images/12_1743146919213.jpg','0','1',NULL),(130,12,'0','999','999999',99999.00,'/images/12_1743148662858.jpeg￥/images/12_1743148662924.jpg￥/images/12_1743148662984.jpeg￥/images/12_1743148663057.jpeg￥/images/12_1743148663122.jpg','0','0',NULL),(136,12,'0','dog','dog',1111.00,'/images/0_1746867020275.jpeg','0','0',NULL),(137,16,'1','phone','apple ipad',111.00,'/images/0_1746869551768.jpeg','0','0',NULL),(138,16,'0','111','111',11.00,'/images/0_1746880177551.jpg','0','0',NULL);
/*!40000 ALTER TABLE `goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodscomment`
--

DROP TABLE IF EXISTS `goodscomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodscomment` (
  `commentId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL COMMENT '用户ID',
  `goodsId` int DEFAULT NULL COMMENT '商品ID',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`commentId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_goodsId` (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodscomment`
--

LOCK TABLES `goodscomment` WRITE;
/*!40000 ALTER TABLE `goodscomment` DISABLE KEYS */;
INSERT INTO `goodscomment` VALUES (31,16,73,'图片评论','/images/161743000450583.jpg','2025-03-26 14:47:30'),(32,16,73,'123','','2025-03-26 14:52:05'),(33,16,73,'123','','2025-03-26 14:52:15'),(35,16,73,'456789','','2025-03-26 14:58:03'),(36,16,70,'beautiful','/images/161743001748374.jpeg','2025-03-26 15:09:08'),(37,16,73,'7897949','/images/161743003209662.jpg','2025-03-26 15:33:29'),(38,16,73,'beReplyName you have to be careful about the election results have to go back and get to go home to be careful about the same time zone ','','2025-03-27 07:29:23'),(39,16,73,'@123','','2025-03-27 07:41:26'),(40,16,79,'hhh','','2025-03-27 12:16:39'),(41,16,82,'very owsome','/images/161743146735130.jpeg','2025-03-28 07:25:35'),(42,16,92,'123','','2025-05-04 15:44:53'),(44,16,130,'123','','2025-05-04 15:59:48'),(45,16,130,'12313131313','','2025-05-04 15:59:56'),(46,16,130,'Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.','','2025-05-04 16:00:21');
/*!40000 ALTER TABLE `goodscomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsorder`
--

DROP TABLE IF EXISTS `goodsorder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsorder` (
  `orderId` int NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `goodsId` int NOT NULL COMMENT '商品id',
  `buyer` int NOT NULL COMMENT '下单人id',
  `createTime` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  PRIMARY KEY (`orderId`),
  UNIQUE KEY `uq_goods_once` (`goodsId`),
  KEY `fk_goods_order_user` (`buyer`),
  CONSTRAINT `fk_goods_order_user` FOREIGN KEY (`buyer`) REFERENCES `user` (`userId`),
  CONSTRAINT `fk_order_goods` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsorder`
--

LOCK TABLES `goodsorder` WRITE;
/*!40000 ALTER TABLE `goodsorder` DISABLE KEYS */;
INSERT INTO `goodsorder` VALUES (1,79,12,'2025-04-15 16:41:22'),(2,73,12,'2025-04-15 20:07:24'),(3,129,16,'2025-05-04 23:47:31'),(4,122,16,'2025-05-04 23:48:53'),(5,106,16,'2025-05-04 23:49:11'),(6,86,16,'2025-05-04 23:51:10'),(7,112,1,'2025-05-12 16:44:04');
/*!40000 ALTER TABLE `goodsorder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsreply`
--

DROP TABLE IF EXISTS `goodsreply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsreply` (
  `replyId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `commentId` int DEFAULT NULL,
  `beReplyName` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`replyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsreply`
--

LOCK TABLES `goodsreply` WRITE;
/*!40000 ALTER TABLE `goodsreply` DISABLE KEYS */;
INSERT INTO `goodsreply` VALUES (14,16,31,'','2025-03-26 15:07:08','111',''),(15,16,33,'','2025-03-26 15:07:29','图片评论','/images/161743001649704.jpg'),(16,16,37,'lisa','2025-03-26 15:07:40','图片评论','/images/161743001660674.jpeg'),(17,16,37,'','2025-03-27 07:22:45','123456',''),(18,16,43,'','2025-05-04 15:54:50','31231231313',''),(19,16,45,'','2025-05-04 16:00:08','Touch and hold a clip to pin it. Unpinned clips will be deleted after 1 hour.','');
/*!40000 ALTER TABLE `goodsreply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goodsreport`
--

DROP TABLE IF EXISTS `goodsreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goodsreport` (
  `reportId` int NOT NULL AUTO_INCREMENT,
  `goodsId` int DEFAULT NULL COMMENT '商品id',
  `userId` int DEFAULT NULL COMMENT '举报人id',
  `reason` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '举报原因',
  `reportTime` datetime DEFAULT NULL COMMENT '举报时间',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT '0' COMMENT '0:未处理 1：已处理',
  PRIMARY KEY (`reportId`),
  KEY `fk_report_user` (`userId`),
  KEY `fk_report_goods` (`goodsId`),
  CONSTRAINT `fk_report_goods` FOREIGN KEY (`goodsId`) REFERENCES `goods` (`goodsId`),
  CONSTRAINT `fk_report_user` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goodsreport`
--

LOCK TABLES `goodsreport` WRITE;
/*!40000 ALTER TABLE `goodsreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `goodsreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecomment`
--

DROP TABLE IF EXISTS `likecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecomment` (
  `userId` int NOT NULL,
  `commentId` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`userId`,`commentId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecomment`
--

LOCK TABLES `likecomment` WRITE;
/*!40000 ALTER TABLE `likecomment` DISABLE KEYS */;
INSERT INTO `likecomment` VALUES (1,11,'2026-02-13'),(12,30,NULL),(12,32,NULL),(12,33,NULL),(12,36,NULL),(17,30,NULL);
/*!40000 ALTER TABLE `likecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likepost`
--

DROP TABLE IF EXISTS `likepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likepost` (
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`userId`,`postId`) USING BTREE,
  KEY `postid` (`postId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likepost`
--

LOCK TABLES `likepost` WRITE;
/*!40000 ALTER TABLE `likepost` DISABLE KEYS */;
INSERT INTO `likepost` VALUES (1,1,'2025-02-07'),(1,122,'2025-03-10'),(12,122,NULL),(12,123,NULL),(12,127,NULL),(16,122,'2025-03-10'),(16,134,NULL),(16,145,NULL),(17,117,NULL),(17,118,NULL),(17,122,NULL),(17,152,NULL);
/*!40000 ALTER TABLE `likepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likereply`
--

DROP TABLE IF EXISTS `likereply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likereply` (
  `userId` int NOT NULL,
  `replyId` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`userId`,`replyId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likereply`
--

LOCK TABLES `likereply` WRITE;
/*!40000 ALTER TABLE `likereply` DISABLE KEYS */;
INSERT INTO `likereply` VALUES (11,16,'2025-02-01'),(12,16,NULL),(12,17,NULL);
/*!40000 ALTER TABLE `likereply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `messageId` int NOT NULL AUTO_INCREMENT COMMENT '消息ID',
  `roomId` int NOT NULL COMMENT '会话ID',
  `sender` int NOT NULL COMMENT '发送者ID',
  `message` longtext NOT NULL COMMENT '消息内容',
  `messageTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',
  PRIMARY KEY (`messageId`),
  KEY `message_ibfk_1` (`roomId`),
  KEY `message_ibfk_2` (`sender`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`roomId`) REFERENCES `chatroom` (`roomId`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`sender`) REFERENCES `user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (5,3,1,'1','2025-03-13 22:46:21'),(6,3,12,'12','2025-03-13 22:51:04'),(7,3,1,'123','2025-03-13 22:51:25'),(8,3,12,'1234','2025-03-13 22:51:37'),(9,3,1,'12345','2025-03-13 23:01:07'),(10,3,1,'123456','2025-03-13 23:01:12'),(11,3,12,'1234567','2025-03-13 23:04:18'),(12,3,1,'12345678','2025-03-13 23:04:26'),(13,4,16,'123456789','2025-03-13 23:06:03'),(14,4,12,'1234657980','2025-03-13 23:06:09'),(15,4,16,'123','2025-03-14 21:45:25'),(17,3,12,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa','2025-03-14 14:37:10'),(18,3,12,'33445566','2025-03-15 14:41:36'),(19,4,12,'55555555555555555555','2025-03-15 14:48:02'),(20,3,12,'666666666666666666666666666666666666','2025-03-15 14:48:24'),(21,3,12,'333','2025-03-15 14:49:05'),(22,4,12,'123/315','2025-03-15 14:56:24'),(23,4,16,'11445566','2025-03-15 14:56:43'),(24,4,12,'334455','2025-03-15 15:07:04'),(25,5,16,'789','2025-03-26 23:33:55'),(26,4,16,'xianzhi','2025-03-28 15:24:38'),(27,4,12,'hdhd','2025-03-28 15:24:58'),(28,6,16,'qwrty','2025-04-12 21:41:08'),(29,4,16,'123','2025-05-10 21:41:08'),(30,4,12,'1111','2025-05-10 21:41:40'),(31,7,1,'111','2025-05-11 05:06:13'),(32,7,16,'222','2025-05-11 05:07:02'),(33,7,1,'333','2025-05-11 05:07:21'),(34,5,17,'123','2025-05-14 17:10:40'),(35,5,17,'1111111','2025-05-14 17:14:54'),(36,5,17,'123123','2025-05-14 17:24:36'),(37,5,17,'13231313132313','2025-05-14 17:24:41'),(38,5,16,'331313','2025-05-14 17:24:44'),(39,8,17,'123123','2025-05-17 09:56:20'),(40,8,17,'aaaa','2025-05-17 09:56:33'),(41,8,12,'bbbbb','2025-05-17 09:56:40');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `postId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `imageUrl` text,
  `forwardId` int DEFAULT NULL,
  `hot` double(10,3) DEFAULT '0.000',
  PRIMARY KEY (`postId`) USING BTREE,
  KEY `post_ibfk_1` (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (117,16,'2025-03-04 09:21:51','1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890','',NULL,0.435),(118,17,'2025-03-04 09:58:38','1233211234567','/images/17_1741082318704.jpeg',NULL,0.464),(119,17,'2025-03-04 10:01:09','123456789132','',NULL,0.000),(120,17,'2025-03-04 12:52:59','3.14159','/images/0_1741092779327.jpg',NULL,0.000),(121,17,'2025-03-04 13:03:42','haha','/images/17_1741093421981.jpg',NULL,0.000),(122,17,'2025-03-04 14:48:43','want to eat banana,','',NULL,2.000),(123,12,'2025-03-11 10:21:16','let\'s go','/images/12_1741688476367.jpeg',NULL,1.798),(124,12,'2025-03-11 14:28:30','very well','',122,0.000),(125,12,'2025-03-11 14:29:11','perfect','',121,0.000),(126,12,'2025-03-11 14:57:48','test','/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg',NULL,0.000),(127,12,'2025-03-11 15:09:50','test','/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg',NULL,3.596),(134,16,'2025-03-12 15:09:50','aaaa',NULL,NULL,0.000),(135,16,'2025-05-20 13:35:47','zhuanfa/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg','/images/12_1741705790047.jpg￥/images/12_1741705790160.jpg￥/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg￥/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705790047.jpg',125,0.002),(136,16,'2025-04-04 09:21:51','1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890','',NULL,0.435),(137,17,'2025-04-04 09:58:38','1233211234567','/images/17_1741082318704.jpeg',NULL,0.464),(138,17,'2025-04-04 10:01:09','123456789132','',NULL,0.000),(139,17,'2025-04-04 12:52:59','3.14159','/images/0_1741092779327.jpg',NULL,0.000),(140,17,'2025-04-04 13:03:42','haha','/images/17_1741093421981.jpg',NULL,0.000),(141,17,'2025-04-04 14:48:43','want to eat banana,','',NULL,2.000),(142,12,'2025-04-11 10:21:16','let\'s go','/images/12_1741688476367.jpeg',NULL,1.798),(143,12,'2025-04-11 14:28:30','very well','',141,0.000),(144,12,'2025-04-11 14:29:11','perfect','',142,0.000),(145,12,'2025-04-11 14:57:48','test','/images/12_1741705068322.jpeg￥/images/12_1741705068420.jpeg￥/images/12_1741705068521.jpeg￥/images/12_1741705068601.jpg',NULL,0.000),(149,12,'2025-04-21 06:57:39','ok','/images/0_1746687458069.jpeg￥/images/0_1746687458300.jpg￥/images/0_1746687458386.jpeg￥/images/0_1746687458473.jpeg￥/images/0_1746687458554.jpeg￥/images/0_1746687458675.jpeg￥/images/0_1746687458753.jpeg￥/images/0_1746687458847.jpg￥/images/0_1746687458926.jpeg',NULL,1.686),(151,12,'2025-04-22 07:01:15','6666','',141,0.000),(152,12,'2025-04-23 07:01:33','7777@judy :6666','',141,0.000),(155,17,'2025-05-17 11:34:30','123','',149,0.000),(156,17,'2025-05-17 11:34:59','123','',NULL,0.000);
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `praise`
--

DROP TABLE IF EXISTS `praise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `praise` (
  `praiseId` int unsigned NOT NULL AUTO_INCREMENT COMMENT '点赞ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `activityId` int unsigned NOT NULL COMMENT '活动ID',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`praiseId`),
  UNIQUE KEY `unique_user_activity` (`userId`,`activityId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_activityId` (`activityId`),
  CONSTRAINT `praise_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `praise_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动点赞';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `praise`
--

LOCK TABLES `praise` WRITE;
/*!40000 ALTER TABLE `praise` DISABLE KEYS */;
INSERT INTO `praise` VALUES (5,16,1,'2025-03-30 16:09:32','2025-03-30 16:09:32'),(25,12,4,'2025-04-15 13:12:41','2025-04-15 13:12:41'),(26,12,2,'2025-04-15 13:12:44','2025-04-15 13:12:44'),(27,16,2,'2025-05-04 15:49:47','2025-05-04 15:49:47'),(28,1,9,'2025-05-12 07:50:05','2025-05-12 07:50:05');
/*!40000 ALTER TABLE `praise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registration` (
  `registrationId` int unsigned NOT NULL AUTO_INCREMENT COMMENT '报名ID',
  `userId` int NOT NULL COMMENT '用户ID',
  `activityId` int unsigned NOT NULL COMMENT '活动ID',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`registrationId`),
  UNIQUE KEY `uni_user_activity` (`userId`,`activityId`),
  KEY `idx_userId` (`userId`),
  KEY `idx_activityId` (`activityId`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE CASCADE,
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`activityId`) REFERENCES `activities` (`activityId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='活动报名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (2,18,1,'2025-03-30 15:12:47','2025-03-30 15:12:47'),(5,17,1,'2025-03-30 15:53:47','2025-03-30 15:53:47'),(17,1,1,'2025-04-06 08:10:16','2025-04-06 08:10:17'),(18,19,1,'2025-04-06 08:12:25','2025-04-06 08:12:26'),(19,16,2,'2025-04-06 08:39:27','2025-04-06 08:39:27'),(22,16,4,'2025-04-06 11:17:15','2025-04-06 11:17:15'),(23,12,2,'2025-04-15 08:25:28','2025-04-15 08:25:28'),(24,16,6,'2025-05-04 15:55:50','2025-05-04 15:55:50'),(25,72,1,'2025-05-09 09:11:38','2025-05-09 09:11:42'),(26,17,33,'2025-05-14 15:19:59','2025-05-14 15:19:59');
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reply`
--

DROP TABLE IF EXISTS `reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reply` (
  `replyId` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `commentId` int DEFAULT NULL,
  `beReplyName` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`replyId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reply`
--

LOCK TABLES `reply` WRITE;
/*!40000 ALTER TABLE `reply` DISABLE KEYS */;
INSERT INTO `reply` VALUES (14,17,30,'','2025-03-10 15:50:37','123',''),(15,12,29,'','2025-03-11 07:08:48','123',''),(17,12,30,'','2025-03-11 07:10:15','12346',''),(18,12,29,'','2025-03-11 07:28:50','图片评论','/images/121741678129892.jpg'),(19,12,32,'','2025-03-11 08:00:00','hhhhhhh',''),(22,12,32,'judy','2025-03-11 09:19:00','123',''),(24,18,32,'judy','2025-03-11 09:26:16','131415',''),(25,12,33,'','2025-03-11 09:57:40','123',''),(26,12,29,'judy','2025-03-11 10:19:57','1234657',''),(27,12,34,'','2025-03-11 10:34:54','lalalala',''),(28,12,34,'','2025-03-11 10:35:14','aaaaaaaaaaaaaaaaaaaaaaaaa',''),(29,12,34,'','2025-03-11 10:35:25','dadadadadadadad',''),(30,12,34,'','2025-03-11 10:35:41','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',''),(31,12,34,'judy','2025-03-11 10:42:53','nishishabo1',''),(32,16,37,'','2025-03-25 06:24:05','456',''),(33,16,37,'lisa','2025-03-25 06:24:14','789',''),(34,16,46,'','2025-03-26 15:59:09','D/EGL_emulation(15177): app_time_stats: avg=500.05ms min=499.41ms max=500.69ms count=2D/EGL_emulation(15177): app_time_stats: avg=423.88ms min=271.77ms max=500.32ms count=3',''),(35,16,37,'lisa','2025-03-27 08:04:41','图片评论','/images/161743062681518.jpeg'),(36,16,47,'','2025-03-27 08:09:53','图片评论','/images/161743062993357.jpg'),(37,16,48,'','2025-05-04 15:54:01','Welcome to Gboard clipboard, any text you copy will be saved here.','');
/*!40000 ALTER TABLE `reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `star`
--

DROP TABLE IF EXISTS `star`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `star` (
  `userId` int NOT NULL,
  `postId` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`userId`,`postId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `star`
--

LOCK TABLES `star` WRITE;
/*!40000 ALTER TABLE `star` DISABLE KEYS */;
INSERT INTO `star` VALUES (1,1,'2025-02-01'),(12,122,NULL);
/*!40000 ALTER TABLE `star` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `updates`
--

DROP TABLE IF EXISTS `updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `updates` (
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `androidUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `iosUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `updates`
--

LOCK TABLES `updates` WRITE;
/*!40000 ALTER TABLE `updates` DISABLE KEYS */;
INSERT INTO `updates` VALUES ('1','checkUpdate',NULL,NULL,'2025-02-09');
/*!40000 ALTER TABLE `updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userId` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '邮箱',
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '新用户' COMMENT '用户名',
  `password` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'MD5密码哈希值',
  `avatarUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '个人简介',
  `birthDay` date DEFAULT NULL,
  `gender` tinyint(1) DEFAULT '2',
  `city` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '城市',
  `backImgUrl` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '背景图URL',
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1111111@qq.com','sandy','7fa8282ad93047a4d6fe6111c93b308a','11741074651514.jpg','1111111','2025-02-08',1,'8,0.四川 成都','11741593002963.jpg'),(12,'456789@qq.com','judy','e35cf7b66449df565f93c607d5a81d09','121741598734386.jpg','45678912','2025-02-20',1,'8,0.四川 成都','121741598742953.jpg'),(16,'123456@qq.com','lisa','e10adc3949ba59abbe56e057f20f883e','161741079610256.jpg','12345678','2025-02-06',0,'8,0.四川 成都','161741079623993.jpg'),(17,'1508537662@qq.com','jisso','af78d5833ac45b2beb9201924cd5f91a','171741082277611.jpg','I am a good girl','2021-01-01',2,'8,0.四川 成都','171741082287446.jpg'),(18,'1314520@qq.com','zhangSan','b206e95a4384298962649e58dc7b39d4','171741082277611.jpg','I am a good girl',NULL,1,'8,0.四川 成都','171741082287446.jpg'),(19,'Lnian3944@163.com','好的很1','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(20,'Lnian3945@163.com','好的很2','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(21,'Lnian3946@163.com','好的很3','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(22,'Lnian3947@163.com','好的很4','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(23,'Lnian3948@163.com','好的很吗？','e10adc3949ba59abbe56e057f20f883e','121741598734386.jpg','真的好得很吗？',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(24,'Lnian3949@163.com','好的很5','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(25,'Lnian3950@163.com','好的很6','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(26,'Lnian3951@163.com','好的很7','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(27,'Lnian3952@163.com','好的很8','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(43,'11111110@qq.com','sandy2','b206e95a4384298962649e58dc7b39d4','11741074651514.jpg','1111111','2025-02-08',1,'8,0.四川 成都','11741593002963.jpg'),(44,'4567890@qq.com','judy2','e35cf7b66449df565f93c607d5a81d09','121741598734386.jpg','45678912','2025-02-20',1,'8,0.四川 成都','121741598742953.jpg'),(45,'1234567@qq.com','lisa2','e10adc3949ba59abbe56e057f20f883e','161741079610256.jpg','12345678','2025-02-06',0,'8,0.四川 成都','161741079623993.jpg'),(46,'1508537663@qq.com','jisso2','af78d5833ac45b2beb9201924cd5f91a','171741082277611.jpg','I am a good girl','2021-01-01',2,'8,0.四川 成都','171741082287446.jpg'),(47,'13145203@qq.com','zhangSan2','b206e95a4384298962649e58dc7b39d4','171741082277611.jpg','I am a good girl',NULL,1,'8,0.四川 成都','171741082287446.jpg'),(48,'Lnian3953@163.com','好的很9','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(49,'Lnian3954@163.com','好的很10','e10adc3949ba59abbe56e057f20f883e','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(54,'11111112@qq.com','sandy3','7fa8282ad93047a4d6fe6111c93b308a','11741074651514.jpg','1111111','2025-02-08',1,'8,0.四川 成都','11741593002963.jpg'),(57,'1508537664@qq.com','jisso3','af78d5833ac45b2beb9201924cd5f91a','171741082277611.jpg','I am a good girl','2021-01-01',2,'8,0.四川 成都','171741082287446.jpg'),(58,'13145204@qq.com','zhangSan3','b206e95a4384298962649e58dc7b39d4','171741082277611.jpg','I am a good girl',NULL,1,'8,0.四川 成都','171741082287446.jpg'),(59,'Lcnian3944@163.com','好的很b','2bcc5350665d79e48e5f9e0835c05db5','1745826854200720986.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(60,'dcLnian3944@163.com','好的很c','e10adc3949ba59abbe56e057f20f883e','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(61,'Lnian3944@163.com','好的很11','e10adc3949ba59abbe56e057f20f883e','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(66,'Lnian3944@163.com','好的很12','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(67,'Lnian3944@163.com','好的很13','2bcc5350665d79e48e5f9e0835c05db5','121741598734386.jpg','真的好得很',NULL,2,'8,0.四川 成都','121741598742953.jpg'),(68,'1111111@qq.com','sandy14','059fc16810ff3db79cac7a5a0527f490','11741074651514.jpg','1111111','2025-02-08',1,'8,0.四川 成都','11741593002963.jpg'),(69,'4567890@qq.com','judy15','e35cf7b66449df565f93c607d5a81d09','121741598734386.jpg','45678912','2025-02-20',1,'8,0.四川 成都','121741598742953.jpg'),(70,'123456@qq.com','lisa16','e10adc3949ba59abbe56e057f20f883e','161741079610256.jpg','12345678','2025-02-06',0,'8,0.四川 成都','161741079623993.jpg'),(71,'a1508537662@qq.com','jissoa17','af78d5833ac45b2beb9201924cd5f91a','1745826604781523712.jpg','I am a good girl','2021-01-01',2,'8,0.四川 成都','171741082287446.jpg'),(72,'1231314520@qq.com','zhangSana18','e10adc3949ba59abbe56e057f20f883e','1745825161693279735.jpg','I am a good girl',NULL,1,'8,0.四川 成都','171741082287446.jpg');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-17 15:48:20
