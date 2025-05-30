
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `commentId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NULL DEFAULT NULL,
  `postId` int(10) NULL DEFAULT NULL COMMENT '评论属于哪个动态',
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`commentId`) USING BTREE,
  INDEX `comments_ibfk_1`(`userId`) USING BTREE,
  INDEX `comments_ibfk_2`(`postId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for fans
-- ----------------------------
DROP TABLE IF EXISTS `fans`;
CREATE TABLE `fans`  (
  `fanId` int(10) NOT NULL COMMENT '粉丝',
  `followedId` int(10) NOT NULL COMMENT '被关注的人的ID',
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`fanId`, `followedId`) USING BTREE,
  INDEX `followedId`(`followedId`) USING BTREE,
  CONSTRAINT `fans_ibfk_1` FOREIGN KEY (`fanId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fans_ibfk_2` FOREIGN KEY (`followedId`) REFERENCES `user` (`userId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for likecomment
-- ----------------------------
DROP TABLE IF EXISTS `likecomment`;
CREATE TABLE `likecomment`  (
  `userId` int(10) NOT NULL,
  `commentId` int(10) NOT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `commentId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for likepost
-- ----------------------------
DROP TABLE IF EXISTS `likepost`;
CREATE TABLE `likepost`  (
  `userId` int(10) NOT NULL,
  `postId` int(10) NOT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `postId`) USING BTREE,
  INDEX `postid`(`postId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for likereply
-- ----------------------------
DROP TABLE IF EXISTS `likereply`;
CREATE TABLE `likereply`  (
  `userId` int(10) NOT NULL,
  `replyId` int(10) NOT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `replyId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for post
-- ----------------------------
DROP TABLE IF EXISTS `post`;
CREATE TABLE `post`  (
  `postId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `forwardId` int(10) NULL DEFAULT NULL,
  `hot` double(10, 3) NULL DEFAULT 0.000,
  PRIMARY KEY (`postId`) USING BTREE,
  INDEX `post_ibfk_1`(`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 117 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply`  (
  `replyId` int(10) NOT NULL AUTO_INCREMENT,
  `userId` int(10) NULL DEFAULT NULL,
  `commentId` int(10) NULL DEFAULT NULL,
  `beReplyName` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`replyId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for star
-- ----------------------------
DROP TABLE IF EXISTS `star`;
CREATE TABLE `star`  (
  `userId` int(10) NOT NULL,
  `postId` int(10) NOT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`userId`, `postId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for updates
-- ----------------------------
DROP TABLE IF EXISTS `updates`;
CREATE TABLE `updates`  (
  `version` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `androidUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `iosUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userId` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatarUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthDay` date NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT 2,
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `backImgUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`userId`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;


create table chatroom
(
    roomId      int auto_increment comment '聊天室ID'
        primary key,
    sender      int                                not null comment '用户1（发送者，较小ID）',
    receiver    int                                not null comment '用户2（接收者，较大ID）',
    createdTime datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    constraint unique_user_pair
        unique (sender, receiver),
    constraint chatroom_ibfk_1
        foreign key (sender) references user (userId),
    constraint chatroom_ibfk_2
        foreign key (receiver) references user (userId),
    constraint chk_sender_receiver
        check (`sender` < `receiver`)
)
    comment '聊天室表';

create table message
(
    messageId   int auto_increment comment '消息ID'
        primary key,
    roomId      int                                not null comment '会话ID',
    sender      int                                not null comment '发送者ID',
    message     longtext                           not null comment '消息内容',
    messageTime datetime default CURRENT_TIMESTAMP not null comment '发送时间',
    constraint message_ibfk_1
        foreign key (roomId) references chatroom (roomId),
    constraint message_ibfk_2
        foreign key (sender) references user (userId)
)
    comment '消息表';


