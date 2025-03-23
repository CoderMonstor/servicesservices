/*
 Navicat Premium Data Transfer
 Target Server Type    : MySQL
 Target Server Version : 50733 (5.7.33-log)
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for system_alipay_config
-- ----------------------------
DROP TABLE IF EXISTS `system_alipay_config`;
CREATE TABLE `system_alipay_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称',
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用ID',
  `charset` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编码',
  `format` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型 固定格式json',
  `gateway_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网关地址',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步回调',
  `private_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '私钥',
  `public_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公钥',
  `return_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回调地址',
  `sign_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '签名方式',
  `sys_service_provider_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商户号',
  `app_public_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '应用公钥证书',
  `ali_public_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝公钥证书',
  `ali_root_cert` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝根证书',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付宝配置类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_column_config
-- ----------------------------
DROP TABLE IF EXISTS `system_column_config`;
CREATE TABLE `system_column_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `column_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `column_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `dict_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `extra` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `form_show` bit(1) NULL DEFAULT NULL,
  `form_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `list_show` bit(1) NULL DEFAULT NULL,
  `not_null` bit(1) NULL DEFAULT NULL,
  `query_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `date_annotation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 580 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成字段信息存储' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_demand_sensitive_word
-- ----------------------------
DROP TABLE IF EXISTS `system_demand_sensitive_word`;
CREATE TABLE `system_demand_sensitive_word`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `badword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7982 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '敏感词表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_dept
-- ----------------------------
DROP TABLE IF EXISTS `system_dept`;
CREATE TABLE `system_dept`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `pid` bigint(20) NOT NULL COMMENT '上级部门',
  `enabled` bit(1) NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_dict
-- ----------------------------
DROP TABLE IF EXISTS `system_dict`;
CREATE TABLE `system_dict`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `system_dict_detail`;
CREATE TABLE `system_dict_detail`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `sort` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '排序',
  `dict_id` bigint(11) NULL DEFAULT NULL COMMENT '字典id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE,
  CONSTRAINT `FK5tpkputc6d9nboxojdbgnpmyb` FOREIGN KEY (`dict_id`) REFERENCES `system_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_email_config
-- ----------------------------
DROP TABLE IF EXISTS `system_email_config`;
CREATE TABLE `system_email_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `from_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '收件人',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮件服务器SMTP地址',
  `pass` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `port` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '端口',
  `user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发件者用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '邮箱配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_gen_config
-- ----------------------------
DROP TABLE IF EXISTS `system_gen_config`;
CREATE TABLE `system_gen_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表名',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '作者',
  `cover` bit(1) NULL DEFAULT NULL COMMENT '是否覆盖',
  `module_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `pack` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '至于哪个包下',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端代码生成的路径',
  `api_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '前端Api文件路径',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表前缀',
  `api_alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成器配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_gen_test
-- ----------------------------
DROP TABLE IF EXISTS `system_gen_test`;
CREATE TABLE `system_gen_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` int(255) NULL DEFAULT NULL COMMENT '性别',
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成测试' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_job
-- ----------------------------
DROP TABLE IF EXISTS `system_job`;
CREATE TABLE `system_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `sort` bigint(20) NOT NULL COMMENT '岗位排序',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKmvhj0rogastlctflsxf1d6k3i`(`dept_id`) USING BTREE,
  CONSTRAINT `FKmvhj0rogastlctflsxf1d6k3i` FOREIGN KEY (`dept_id`) REFERENCES `system_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_local_storage
-- ----------------------------
DROP TABLE IF EXISTS `system_local_storage`;
CREATE TABLE `system_local_storage`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件真实的名称',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '后缀',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `size` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `operate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作人',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本地存储' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_log
-- ----------------------------
DROP TABLE IF EXISTS `system_log`;
CREATE TABLE `system_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `log_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  `request_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT 0,
  `uid` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32360 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '系统日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for mw_order_dy
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_dy`;
CREATE TABLE `mw_order_dy`  (
  `order_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `total_pay_amount` double NULL DEFAULT 0 COMMENT '订单金额',
  `estimated_total_commission` double NULL DEFAULT 0 COMMENT '预估佣金',
  `pay_success_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `product_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品标题',
  `product_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品id',
  `commission_rate` double NULL DEFAULT 0 COMMENT '佣金比例',
  `product_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品主图',
  `flow_point` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单状态，PAY_SUCC',
  `refund_time` datetime NULL DEFAULT NULL COMMENT '退款时间',
  `settle_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `item_num` int(10) NULL DEFAULT 0 COMMENT '商品数量',
  `shop_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '店铺名称',
  `shop_id` int(10) NULL DEFAULT 0 COMMENT '店铺id',
  `real_commission` double NULL DEFAULT 0 COMMENT '实际结算金额',
  `media_type_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '媒体名称',
  `media_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '媒体类型',
  `estimated_commission` double NULL DEFAULT 0,
  `estimated_tech_service_fee` double NULL DEFAULT 0,
  `estimated_total_commission0` double NULL DEFAULT 0,
  `app` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `ads_estimated_commission` int(10) NULL DEFAULT 0 COMMENT '直播间分销渠道预估佣金收入/预估推广费收入 单位分',
  `ads_real_commission` int(10) NULL DEFAULT 0 COMMENT '直播间分销渠道实际佣金收入/结算推广费收入 单位分',
  `external_info` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '外部参数',
  `pay_goods_amount` double NULL DEFAULT 0 COMMENT '预估参与结算金额',
  `settled_goods_amount` double NULL DEFAULT 0 COMMENT '实际参与结算金额',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '是否拆红包，0=未拆 1=已拆 2=已退款 3=已失效',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `paySuccessTime`(`pay_success_time`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '抖音订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_order_jd
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_jd`;
CREATE TABLE `mw_order_jd`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标记唯一订单行',
  `order_id` bigint(20) NOT NULL COMMENT '订单号',
  `parent_id` bigint(20) NULL DEFAULT NULL COMMENT '父单的订单号',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `finish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `order_emt` tinyint(1) NULL DEFAULT 2 COMMENT '下单设备 1.pc 2.无线',
  `plus` tinyint(1) NULL DEFAULT 2 COMMENT '下单用户是否为PLUS会员 0：否，1：是',
  `union_id` bigint(20) NULL DEFAULT NULL COMMENT '推客ID',
  `sku_id` bigint(20) NULL DEFAULT NULL COMMENT '商品ID',
  `sku_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `sku_num` bigint(10) NULL DEFAULT NULL COMMENT '商品数量',
  `sku_return_num` bigint(10) NULL DEFAULT NULL COMMENT '商品已退货数量',
  `sku_frozen_num` bigint(10) NULL DEFAULT NULL COMMENT '商品售后中数量',
  `price` double NULL DEFAULT NULL COMMENT '商品单价',
  `commission_rate` double NULL DEFAULT NULL COMMENT '佣金比例',
  `subSide_rate` double NULL DEFAULT NULL COMMENT '分成比例（单位：%）',
  `subsidy_rate` double NULL DEFAULT NULL COMMENT '补贴比例（单位：%）',
  `final_rate` double NULL DEFAULT NULL COMMENT '最终分佣比例',
  `estimate_cos_price` double NULL DEFAULT NULL COMMENT '预估计订单金额',
  `estimate_fee` double NULL DEFAULT NULL COMMENT '预估佣金，以这个为准',
  `actual_cos_price` double NULL DEFAULT NULL COMMENT '实际订单金额',
  `actual_fee` double NULL DEFAULT NULL COMMENT '实际佣金，未结算时为0',
  `valid_code` bigint(3) NULL DEFAULT NULL COMMENT 'sku维度的有效码（-1：未知,2.无效-拆单,3.无效-取消,4.无效-京东帮帮主订单,5.无效-账号异常,6.无效-赠品类目不返佣,7.无效-校园订单,8.无效-企业订单,9.无效-团购订单,11.无效-乡村推广员下单,13.无效-违规订单,14.无效-来源与备案网址不符,15.待付款,16.已付款,17.已完成（购买用户确认收货）,20.无效-此复购订单对应的首购订单无效,21.无效-云店订单',
  `trace_type` tinyint(1) NULL DEFAULT 2 COMMENT '同跨店：2同店 3跨店',
  `position_id` bigint(20) NULL DEFAULT NULL COMMENT '推广位ID',
  `site_id` bigint(20) NULL DEFAULT NULL COMMENT '应用id（网站id、appid、社交媒体id）',
  `union_alias` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'ID所属母账号平台名称',
  `pid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '格式:子推客ID_子站长应用ID_子推客推广位ID',
  `cid1` bigint(10) NULL DEFAULT NULL COMMENT '一级类目id',
  `cid2` bigint(10) NULL DEFAULT NULL COMMENT '二级类目id',
  `cid3` bigint(10) NULL DEFAULT NULL COMMENT '三级类目id',
  `sub_union_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子渠道标识，在转链时可自定义传入，格式要求：字母、数字或下划线，最多支持80个字符',
  `union_tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联盟标签数据',
  `pop_id` bigint(10) NULL DEFAULT NULL COMMENT '商家ID',
  `ext1` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推客生成推广链接时传入的扩展字段',
  `pay_month` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '预估结算时间 yyyyMMdd',
  `rid` bigint(10) NULL DEFAULT NULL COMMENT '团长渠道ID',
  `Goods_info` json NULL COMMENT '微信用户json信息',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '是否拆红包，0=未拆 1=已拆 2=已退款 3=已失效',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderTime`(`order_time`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '京东订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_order_mt
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_mt`;
CREATE TABLE `mw_order_mt`  (
  `unique_item_id` bigint(30) NOT NULL COMMENT '唯一子订单Id，建议使用',
  `order_id` bigint(30) NULL DEFAULT 0 COMMENT '父订单号',
  `verify_time` datetime NULL DEFAULT NULL COMMENT '核验时间',
  `order_pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `actual_item_amount` double NULL DEFAULT 0 COMMENT '子订单实际支付价格，单位元',
  `actual_order_amount` double NULL DEFAULT 0 COMMENT '订单实际支付总价格，单位元',
  `shop_uuid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商户uuid',
  `shop_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商户名称',
  `brand_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '品牌名称',
  `city_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '品牌名称',
  `cat0_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '一级行业',
  `cat1_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '二级行业',
  `order_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单类型',
  `coupon_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '抵用券Id',
  `coupon_group_id` int(9) NULL DEFAULT 0 COMMENT '券组Id',
  `coupon_discount_amount` double NULL DEFAULT 0 COMMENT '抵用券满减金额，单位元',
  `coupon_price_limit` double NULL DEFAULT 0 COMMENT '抵用券门槛，单位元',
  `balance_amount` double NULL DEFAULT 0 COMMENT '佣金金额,单位元',
  `balance_commission_ratio` double NULL DEFAULT 0 COMMENT '佣金比例',
  `order_user_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户id',
  `item_status` tinyint(1) NULL DEFAULT 0 COMMENT '子订单状态 0=未使用：已经购买 1=已使用：已经购买 2=退款中 3=已退款 5=已消费退款',
  `settlement_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `coupon_source` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `order_platform` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '点评 美团',
  `utm_source` bigint(30) NULL DEFAULT 0 COMMENT '媒体Code',
  `utm_medium` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '子媒体信息,用户手机号AES加密',
  `modify_time` datetime NULL DEFAULT NULL COMMENT '最新更改时间',
  `item_biz_status` int(6) NULL DEFAULT 0 COMMENT '订单状态(聚合) 1 2 3成功 99 999失败',
  `settle_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `billing_date` datetime NULL DEFAULT NULL COMMENT '账期时间',
  `promotion_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广位Id',
  `deal_id` bigint(30) NULL DEFAULT 0 COMMENT '团购id',
  `launch_tag` bigint(30) NULL DEFAULT 0 COMMENT '团购id',
  `used_date` datetime NULL DEFAULT NULL COMMENT '订单核验时间',
  `refund_date` datetime NULL DEFAULT NULL COMMENT '订单退款时间',
  `comment` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `biz_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '业务类型：1-cps，2-cpa',
  `event_type` int(2) NULL DEFAULT 0 COMMENT '异常事件类型，1-退款,2-风控,4-负项调整',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '0=未拆红包 1=已拆红包 2=已退款 3=已失效',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`unique_item_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `order_pay_time`(`order_pay_time`) USING BTREE,
  INDEX `item_status`(`item_status`) USING BTREE,
  INDEX `item_biz_status`(`item_biz_status`) USING BTREE,
  INDEX `event_type`(`event_type`) USING BTREE,
  INDEX `order_id`(`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '美团订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_order_pdd
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_pdd`;
CREATE TABLE `mw_order_pdd`  (
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单编号',
  `order_status` tinyint(1) NULL DEFAULT NULL COMMENT '订单状态：0-已支付；1-已成团；2-确认收货；3-审核成功；4-审核失败（不可提现）；5-已经结算 ;10-已处罚',
  `order_status_desc` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单状态描述',
  `price_compare_status` tinyint(1) NULL DEFAULT NULL COMMENT '比价状态：0：正常，1：比价',
  `promotion_amount` bigint(10) NULL DEFAULT 0 COMMENT '佣金金额，单位为分',
  `custom_parameters` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '自定义参数，转链时传入',
  `goods_id` bigint(20) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `goods_price` bigint(10) NULL DEFAULT 0 COMMENT '订单中sku的单件价格，单位为分',
  `goods_quantity` bigint(10) NULL DEFAULT NULL COMMENT '商品数量',
  `goods_sign` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'goodsSign是加密后的goodsId，goodsId已下线，请使用goodsSign来替代',
  `goods_thumbnail_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品缩略图',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '成团编号',
  `mall_id` bigint(20) NULL DEFAULT NULL COMMENT '店铺id',
  `mall_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺名称',
  `is_direct` tinyint(1) NULL DEFAULT NULL COMMENT '是否直推 ，1表示是，0表示否',
  `order_amount` bigint(10) NULL DEFAULT NULL COMMENT '实际支付金额，单位为分',
  `auth_duo_id` bigint(20) NULL DEFAULT NULL COMMENT '多多客工具id',
  `bandan_risk_consult` tinyint(1) NULL DEFAULT NULL COMMENT '预判断是否为代购订单，-1（默认）表示未出结果，0表示预判不是代购订单，1表示代购订单，具体请以最后审核状态为准',
  `batch_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '结算批次号',
  `cash_gift_id` bigint(20) NULL DEFAULT NULL COMMENT '订单关联礼金活动Id',
  `cpa_new` tinyint(1) NULL DEFAULT NULL COMMENT '是否是 cpa 新用户，1表示是，0表示否',
  `fail_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单审核失败/惩罚原因',
  `goods_category_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品一级类目名称',
  `no_subsidy_reason` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '非补贴订单原因，例如：\"商品补贴达上限\"，\"达到单个用户下单上限\"，\"非指定落地页直推订单\"，\"订单超过2个月未审核成功\"等',
  `order_create_time` datetime NULL DEFAULT NULL COMMENT '订单生成时间，UNIX时间戳',
  `order_group_success_time` datetime NULL DEFAULT NULL COMMENT '成团时间',
  `order_modify_at` datetime NULL DEFAULT NULL COMMENT '最后更新时间',
  `order_pay_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
  `order_receive_time` datetime NULL DEFAULT NULL COMMENT '确认收货时间',
  `order_settle_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
  `order_verify_time` datetime NULL DEFAULT NULL COMMENT '审核时间',
  `p_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推广位ID',
  `platform_discount` bigint(20) NULL DEFAULT 0 COMMENT '平台券金额，表示该订单使用的平台券金额，单位分',
  `promotion_rate` bigint(20) NULL DEFAULT 0 COMMENT '佣金比例，千分比',
  `red_packet_type` tinyint(1) NULL DEFAULT NULL COMMENT '超级红包补贴类型：0-非红包补贴订单，1-季度新用户补贴',
  `sep_duo_id` bigint(20) NULL DEFAULT NULL COMMENT '直播间订单推广duoId',
  `sep_market_fee` int(10) NULL DEFAULT 0 COMMENT '直播间推广佣金',
  `sep_parameters` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播间推广自定义参数',
  `sep_pid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '直播间订单推广位',
  `sep_rate` int(10) NULL DEFAULT 0 COMMENT '直播间推广佣金比例',
  `share_amount` int(10) NULL DEFAULT 0 COMMENT '招商分成服务费金额，单位为分',
  `share_rate` int(10) NULL DEFAULT 0 COMMENT '招商分成服务费比例，千分比',
  `subsidy_amount` int(10) NULL DEFAULT 0 COMMENT '优势渠道专属商品补贴金额，单位为分',
  `subsidy_duo_amount_level` int(10) NULL DEFAULT 0 COMMENT '等级补贴给渠道的收入补贴，不允许直接给下级代理展示，单位为分',
  `subsidy_duo_amount_ten_million` int(10) NULL DEFAULT 0 COMMENT '官方活动给渠道的收入补贴金额，不允许直接给下级代理展示，单位为分',
  `subsidy_order_remark` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '补贴订单备注',
  `subsidy_type` int(2) NULL DEFAULT NULL COMMENT '订单补贴类型：0-非补贴订单，1-千万补贴，2-社群补贴，3-多多星选，4-品牌优选，5-千万神券',
  `type` int(4) NULL DEFAULT NULL COMMENT '下单场景类型：0-单品推广，1-红包活动推广，4-多多进宝商城推广，7-今日爆款，8-品牌清仓，9-1.9包邮，77-刮刮卡活动推广，94-充值中心，101-品牌黑卡，103-百亿补贴频道，104-内购清单频道，105-超级红包',
  `zs_duo_id` bigint(20) NULL DEFAULT NULL COMMENT '招商多多客id',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '是否拆红包，0=未拆 1=已拆 2=已退款 3=已失效',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`order_sn`) USING BTREE,
  INDEX `order_create_time`(`order_create_time`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '拼多多订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_order_tb
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_tb`;
CREATE TABLE `mw_order_tb`  (
  `trade_parent_id` bigint(30) NOT NULL COMMENT '订单编号',
  `parent_id` bigint(30) NULL DEFAULT 0 COMMENT '父订单号',
  `tk_create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tb_paid_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `tk_paid_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `pay_price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pub_share_fee` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trade_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子订单编号',
  `pub_share_rate` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `refund_tag` tinyint(1) NULL DEFAULT 0 COMMENT '维权标签，0 含义为非维权 1 含义为维权订单',
  `tk_total_rate` double NULL DEFAULT NULL COMMENT '实际获得收益的比率',
  `pub_share_pre_fee` double NULL DEFAULT NULL COMMENT '付款预估收入',
  `alipay_total_price` double NULL DEFAULT NULL COMMENT '买家拍下付款的金额',
  `total_commission_rate` double NULL DEFAULT NULL COMMENT '佣金比率',
  `item_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品标题',
  `adzone_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推广位名称',
  `site_id` bigint(20) NULL DEFAULT NULL COMMENT 'pid=mm_1_2_3中的“2”这段数字',
  `adzone_id` bigint(20) NULL DEFAULT NULL COMMENT 'pid=mm_1_2_3中的“3”这段数字',
  `item_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品链接',
  `item_price` double NULL DEFAULT NULL COMMENT '商品单价',
  `order_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单所属平台类型，包括天猫、淘宝、聚划算等',
  `seller_shop_title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺名',
  `site_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '媒体名',
  `tk_status` tinyint(2) NULL DEFAULT 0 COMMENT '1）买家超时未付款； 2）买家付款前，买家/卖家取消了订单；3）订单付款后发起售中退款成功；3：订单结算，12：订单付款， 13：订单失效，14：订单成功',
  `item_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id',
  `total_commission_fee` double NULL DEFAULT NULL COMMENT '佣金金额=结算金额＊佣金比率',
  `special_id` bigint(20) NULL DEFAULT NULL COMMENT '会员运营id',
  `relation_id` bigint(20) NULL DEFAULT NULL COMMENT '渠道关系id',
  `modified_time` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单更新时间',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '是否拆红包，0=未拆 1=已拆 2=已退款 3=已失效',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `item_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`trade_parent_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `item_id`(`item_id`) USING BTREE,
  INDEX `tkCreateTime`(`tk_create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '淘宝订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_order_vip
-- ----------------------------
DROP TABLE IF EXISTS `mw_order_vip`;
CREATE TABLE `mw_order_vip`  (
  `order_sn` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `order_sub_status_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单状态',
  `order_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `stat_param` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '自定义统计参数',
  `open_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户授权绑定唯品会账号的标识',
  `total_cost` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单支付金额:单位元',
  `app_key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'appKey',
  `channel_tag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '渠道商模式下表示自定义渠道标识；工具商模式下表示pid',
  `commission` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '商品佣金金额(元,保留两位小数)',
  `commission_rate` double NULL DEFAULT NULL COMMENT '佣金比例',
  `commission_enter_time` datetime NULL DEFAULT NULL COMMENT '入账时间，时间戳，单位毫秒',
  `is_prepay` tinyint(1) NULL DEFAULT 0 COMMENT '是否预付订单:0-否，1-是',
  `is_split` tinyint(1) NULL DEFAULT 0 COMMENT '订单拆单标识: 0-否，1-是',
  `last_update_time` datetime NULL DEFAULT NULL COMMENT '订单上次更新时间 时间戳 单位毫秒',
  `new_customer` tinyint(1) NULL DEFAULT 0 COMMENT '新老客：0-待定，1-新客，2-老客',
  `order_source` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '订单来源',
  `order_track_reason` tinyint(1) NULL DEFAULT 0 COMMENT '订单归因方式：0-常规推广,1-惊喜红包,2-锁粉,3-超级红包',
  `pid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '推广PID:目前等同于channelTag',
  `self_buy` tinyint(1) NULL DEFAULT 0 COMMENT '是否自推自买 0-否，1-是',
  `settled` tinyint(1) NULL DEFAULT 0 COMMENT '订单结算状态 0-未结算,1-已结算',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '订单状态:0-不合格，1-待定，2-已完结',
  `detail_list` json NULL COMMENT '商品json array信息',
  `bind` tinyint(1) NULL DEFAULT 0 COMMENT '是否绑定用户，0 未绑定 1 绑定',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `hb` double NULL DEFAULT NULL COMMENT '拆红包奖励金额',
  `spread_hb_time` datetime NULL DEFAULT NULL COMMENT '拆红包时间',
  `inner_type` tinyint(1) NULL DEFAULT 0 COMMENT '内部类型 0=默认 1=虚拟',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`order_sn`) USING BTREE,
  INDEX `orderTime`(`order_time`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '唯品会订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `i_frame` bit(1) NULL DEFAULT NULL COMMENT '是否外链',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `pid` bigint(20) NOT NULL COMMENT '上级菜单ID',
  `sort` bigint(20) NOT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `cache` bit(1) NULL DEFAULT b'0' COMMENT '缓存',
  `hidden` bit(1) NULL DEFAULT b'0' COMMENT '是否隐藏',
  `component_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '-' COMMENT '组件名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `type` int(11) NULL DEFAULT NULL COMMENT '类型',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKqcf9gem97gqa5qjm4d3elcqt5`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 303 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_monitor_server
-- ----------------------------
DROP TABLE IF EXISTS `system_monitor_server`;
CREATE TABLE `system_monitor_server`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cpu_core` int(11) NULL DEFAULT NULL COMMENT 'CPU内核数',
  `cpu_rate` double NULL DEFAULT NULL COMMENT 'CPU使用率',
  `disk_total` double NULL DEFAULT NULL COMMENT '磁盘总量',
  `disk_used` double NULL DEFAULT NULL COMMENT '磁盘使用量',
  `mem_total` double NULL DEFAULT NULL COMMENT '内存总数',
  `mem_used` double NULL DEFAULT NULL COMMENT '内存使用量',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `port` int(11) NULL DEFAULT NULL COMMENT '访问端口',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  `swap_total` double NULL DEFAULT NULL COMMENT '交换区总量',
  `swap_used` double NULL DEFAULT NULL COMMENT '交换区使用量',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '服务地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '服务监控' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for mw_app_version
-- ----------------------------
DROP TABLE IF EXISTS `mw_app_version`;
CREATE TABLE `mw_app_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本code',
  `version_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本名称',
  `version_info` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '版本描述',
  `ios_url` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ios store应用商店链接',
  `android_url` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '安卓下载链接',
  `force_update` tinyint(4) NULL DEFAULT NULL COMMENT '是否强制升级',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'app版本' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_article
-- ----------------------------
DROP TABLE IF EXISTS `mw_article`;
CREATE TABLE `mw_article`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '文章管理ID',
  `cid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '分类id',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `author` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章作者',
  `image_input` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章图片',
  `synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章简介',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `share_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享标题',
  `share_synopsis` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章分享简介',
  `visit` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览次数',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '原文链接',
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  `hide` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  `admin_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '管理员id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `product_id` int(10) NULL DEFAULT 0 COMMENT '产品关联id',
  `is_hot` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否热门(小程序)',
  `is_banner` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否轮播图(小程序)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '文章管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_expend
-- ----------------------------
DROP TABLE IF EXISTS `mw_expend`;
CREATE TABLE `mw_expend`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主体id',
  `money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '支出金额',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  `add_time` datetime NULL DEFAULT NULL COMMENT '时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '额外支出表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_express
-- ----------------------------
DROP TABLE IF EXISTS `mw_express`;
CREATE TABLE `mw_express`  (
  `id` mediumint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '快递公司id',
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司简称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '快递公司全称',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(255) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 430 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '快递公司表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_material
-- ----------------------------
DROP TABLE IF EXISTS `mw_material`;
CREATE TABLE `mw_material`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '类型1、图片；2、视频',
  `group_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '分组ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '素材名',
  `url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT '' COMMENT '素材链接',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '素材库' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_material_group
-- ----------------------------
DROP TABLE IF EXISTS `mw_material_group`;
CREATE TABLE `mw_material_group`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'PK',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者ID',
  `name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '分组名',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '素材分组' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_pay_bind
-- ----------------------------
DROP TABLE IF EXISTS `mw_pay_bind`;
CREATE TABLE `mw_pay_bind`  (
  `id` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id_1 or 2',
  `channel_id` bigint(20) UNSIGNED NOT NULL COMMENT '通道id',
  `change_bind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '标识用户是否更换过绑定 1=更换过',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户支付通道绑定表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `mw_pay_channel`;
CREATE TABLE `mw_pay_channel`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '通道id',
  `channel_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '通道名称,同主体设置为一样',
  `channel_key` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通道类型 参考 {PayPlatformEnum}',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '名称',
  `cert_profile` json NULL COMMENT '证书信息',
  `cert_profile_enc` blob NULL COMMENT '证书信息',
  `notify_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异步回调',
  `type` tinyint(2) NOT NULL DEFAULT 0 COMMENT '通道类型 1=支付宝原生 2=支付宝三方 6=微信原生 7=微信三方 0=未知，不启用',
  `max_amount` double NOT NULL DEFAULT 0 COMMENT '最大额度',
  `amount` double NOT NULL DEFAULT 0 COMMENT '剩余额度',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '通道开关 8=正常，0=永久关闭 1=投诉关闭 2=临时关闭 0和1需要手动开启 2在刷新后重置',
  `extract` tinyint(1) NULL DEFAULT 0 COMMENT '是否用于提现',
  `cycle_time` time NULL DEFAULT '00:00:00' COMMENT '通道刷新时间',
  `company_id` bigint(20) UNSIGNED NOT NULL COMMENT '主体id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `channel_name`(`channel_name`) USING BTREE,
  INDEX `channel_key`(`channel_key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `FKcngg2qadojhi3a651a5adkacd`(`company_id`) USING BTREE,
  CONSTRAINT `FKcngg2qadojhi3a651a5adkacd` FOREIGN KEY (`company_id`) REFERENCES `mw_pay_company` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付通道配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_pay_company
-- ----------------------------
DROP TABLE IF EXISTS `mw_pay_company`;
CREATE TABLE `mw_pay_company`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主体id',
  `company` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公司名称',
  `license_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '营业执照地址',
  `seal_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '公章地址',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `company`(`company`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20005 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '支付通道主体表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_shipping_templates
-- ----------------------------
DROP TABLE IF EXISTS `mw_shipping_templates`;
CREATE TABLE `mw_shipping_templates`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板名称',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '计费方式',
  `region_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '地域以及费用',
  `appoint` tinyint(1) NULL DEFAULT NULL COMMENT '指定包邮开关',
  `appoint_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '指定包邮内容',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '运费模板表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_shipping_templates_free
-- ----------------------------
DROP TABLE IF EXISTS `mw_shipping_templates_free`;
CREATE TABLE `mw_shipping_templates_free`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `province_id` int(11) NOT NULL DEFAULT 0 COMMENT '省ID',
  `temp_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板ID',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市ID',
  `number` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '包邮件数',
  `price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '包邮金额',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '计费方式',
  `uniqid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组唯一值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 198 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_shipping_templates_region
-- ----------------------------
DROP TABLE IF EXISTS `mw_shipping_templates_region`;
CREATE TABLE `mw_shipping_templates_region`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `province_id` int(11) NOT NULL DEFAULT 0 COMMENT '省ID',
  `temp_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板ID',
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市ID',
  `first` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '首件',
  `first_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '首件运费',
  `continues` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '续件',
  `continue_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '续件运费',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '计费方式',
  `uniqid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '分组唯一值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 250 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_after_sales
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_after_sales`;
CREATE TABLE `mw_store_after_sales`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `refund_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '退款金额',
  `service_type` tinyint(1) NULL DEFAULT NULL COMMENT '服务类型0仅退款1退货退款',
  `reasons` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '申请原因',
  `explains` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '说明',
  `explain_img` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '说明图片->多个用逗号分割',
  `shipper_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流公司编码',
  `delivery_sn` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流单号',
  `delivery_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '物流名称',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '状态 0已提交等待平台审核 1平台已审核 等待用户发货/退款 2 用户已发货 3退款成功',
  `sales_state` tinyint(1) NULL DEFAULT NULL COMMENT '售后状态-0正常1用户取消2商家拒绝',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '用户id',
  `consignee` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商家收货人',
  `phone_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商家手机号',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '商家地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '售后记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mw_store_after_sales_item
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_after_sales_item`;
CREATE TABLE `mw_store_after_sales_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `store_after_sales_id` bigint(20) NULL DEFAULT NULL COMMENT '售后id',
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '商品id',
  `cart_info` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '退货东西的详情信息',
  `is_del` bit(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '售后子表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mw_store_after_sales_status
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_after_sales_status`;
CREATE TABLE `mw_store_after_sales_status`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `store_after_sales_id` bigint(20) NULL DEFAULT NULL COMMENT '售后id',
  `change_type` tinyint(1) NULL DEFAULT NULL COMMENT '操作类型',
  `change_message` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作备注',
  `change_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `operator` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '操作人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '售后订单操作详情表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for mw_store_bargain
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_bargain`;
CREATE TABLE `mw_store_bargain`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价产品ID',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '关联产品ID',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动名称',
  `image` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价活动图片',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名称',
  `stock` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '库存',
  `sales` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '销量',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '砍价产品轮播图',
  `start_time` datetime NOT NULL COMMENT '砍价开启时间',
  `stop_time` datetime NOT NULL COMMENT '砍价结束时间',
  `store_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价产品名称',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价金额',
  `min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价商品最低价',
  `num` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '每次购买的砍价产品数量',
  `bargain_max_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最大金额',
  `bargain_min_price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '用户每次砍价的最小金额',
  `bargain_num` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '用户每次砍价的次数',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '砍价状态 0(到砍价时间不自动开启)  1(到砍价时间自动开启时间)',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价详情',
  `give_integral` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '反多少积分',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '砍价活动简介',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否推荐0不推荐1推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除 0未删除 1删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否包邮 0不包邮 1包邮',
  `postage` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '邮费',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '砍价规则',
  `look` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品浏览量',
  `share` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '砍价产品分享量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_bargain_user
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_bargain_user`;
CREATE TABLE `mw_store_bargain_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户参与砍价表ID',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户ID',
  `bargain_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品id',
  `bargain_price_min` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍价的最低价',
  `bargain_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '砍价金额',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '砍掉的价格',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态 1参与中 2 活动结束参与失败 3活动结束参与成功',
  `create_time` datetime NULL DEFAULT NULL COMMENT '参与时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否取消',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户参与砍价表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_bargain_user_help
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_bargain_user_help`;
CREATE TABLE `mw_store_bargain_user_help`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '砍价用户帮助表ID',
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '帮助的用户id',
  `bargain_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '砍价产品ID',
  `bargain_user_id` bigint(20) UNSIGNED NULL DEFAULT NULL COMMENT '用户参与砍价表id',
  `price` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '帮助砍价多少金额',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '砍价用户帮助表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_canvas
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_canvas`;
CREATE TABLE `mw_store_canvas`  (
  `canvas_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '画布id',
  `terminal` tinyint(1) NOT NULL COMMENT '终端 1-小程序 2-H5 3-APP 4-PC',
  `json` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '画布json数据',
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '类型 1-系统画布 2-自定义页面 3-商家店铺装修',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `shop_id` bigint(20) NULL DEFAULT 0 COMMENT '店铺id，当type=3的时候，值为具体的店铺id，其它情况为0',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`canvas_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '画布信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_cart
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_cart`;
CREATE TABLE `mw_store_cart`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '购物车表ID',
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户ID',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '类型',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品ID',
  `product_attr_unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商品属性',
  `cart_num` smallint(5) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品数量',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = 未购买 1 = 已购买',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `is_new` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为立即购买',
  `combination_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '拼团id',
  `seckill_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '秒杀产品ID',
  `bargain_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '砍价id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE,
  INDEX `goods_id`(`product_id`) USING BTREE,
  INDEX `uid`(`uid`, `is_pay`) USING BTREE,
  INDEX `uid_2`(`uid`, `is_del`) USING BTREE,
  INDEX `uid_3`(`uid`, `is_new`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_category
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_category`;
CREATE TABLE `mw_store_category`  (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NULL DEFAULT NULL COMMENT '排序',
  `pic` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '是否推荐',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '删除状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `is_base`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_combination
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_combination`;
CREATE TABLE `mw_store_combination`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `attr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '活动属性',
  `people` int(2) UNSIGNED NOT NULL COMMENT '参团人数',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '价格',
  `product_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '商品原价',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `stock` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '库存',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_host` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '推荐',
  `is_show` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `combination` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '商户是否可用1可用0不可用',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拼团内容',
  `start_time` datetime NOT NULL COMMENT '拼团开始时间',
  `stop_time` datetime NOT NULL COMMENT '拼团结束时间',
  `effective_time` int(11) NOT NULL DEFAULT 0 COMMENT '拼团订单有效时间',
  `cost` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼团产品成本',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '单位名',
  `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '规格 0单 1多',
  `temp_id` int(10) NULL DEFAULT NULL COMMENT '运费模板ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_coupon
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_coupon`;
CREATE TABLE `mw_store_coupon`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '优惠券表ID',
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `integral` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换消耗积分值',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '兑换的优惠券面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `coupon_time` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券有效期限（单位：天）',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT 1 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态（0：关闭，1：开启）',
  `product_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品ids',
  `type` tinyint(255) NULL DEFAULT 0 COMMENT '优惠券类型 0-通用 1-商品券',
  `create_time` datetime NOT NULL COMMENT '兑换项目添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `state`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `coupon_time`(`coupon_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_coupon_issue
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_coupon_issue`;
CREATE TABLE `mw_store_coupon_issue`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `cid` int(10) NULL DEFAULT NULL COMMENT '优惠券ID',
  `ctype` tinyint(1) NULL DEFAULT NULL COMMENT '优惠券类型 0-通用 1-商品券',
  `start_time` datetime NULL DEFAULT NULL COMMENT '优惠券领取开启时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '优惠券领取结束时间',
  `total_count` int(10) NULL DEFAULT NULL COMMENT '优惠券领取数量',
  `remain_count` int(10) NULL DEFAULT NULL COMMENT '优惠券剩余领取数量',
  `is_permanent` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否无限张数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 正常 0 未开启 -1 已无效',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `create_time` datetime NULL DEFAULT NULL COMMENT '优惠券添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `start_time`(`start_time`, `end_time`) USING BTREE,
  INDEX `remain_count`(`remain_count`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台领取表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_coupon_issue_user
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_coupon_issue_user`;
CREATE TABLE `mw_store_coupon_issue_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '领取优惠券用户ID',
  `issue_coupon_id` int(10) NULL DEFAULT NULL COMMENT '优惠券前台领取ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '领取时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `issue_coupon_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券前台用户领取记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_coupon_user
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_coupon_user`;
CREATE TABLE `mw_store_coupon_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '优惠券发放记录id',
  `cid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '兑换的项目id',
  `uid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '优惠券所属用户',
  `coupon_title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `coupon_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '优惠券的面值',
  `use_min_price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '最低消费多少金额可用优惠券',
  `create_time` datetime NOT NULL COMMENT '优惠券创建时间',
  `update_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NOT NULL COMMENT '优惠券结束时间',
  `use_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'send' COMMENT '获取方式',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态（0：未使用，1：已使用, 2:已过期）',
  `is_fail` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否有效',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `end_time`(`end_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_fail`(`is_fail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券发放记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_customer
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_customer`;
CREATE TABLE `mw_store_customer`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `nick_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `open_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'openId',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  `is_enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单通知用户表 接收订单通知的用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_order
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_order`;
CREATE TABLE `mw_store_order`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单号',
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户姓名',
  `user_phone` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户电话',
  `user_address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单状态（-1 : 申请退款 -2 : 退货成功 0：待发货；1：待收货；2：已收货；3：已完成；-1：已退款）',
  `delivery_sn` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '快递公司编号',
  `delivery_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递名称/送货人姓名',
  `delivery_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '快递单号/手机号',
  `use_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '使用积分',
  `pay_integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '实际支付积分',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '备注',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id(md5加密)类似id',
  `remark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员备注',
  `is_system_del` tinyint(1) NULL DEFAULT 0,
  `goods_id` bigint(30) NOT NULL DEFAULT 0,
  `goods_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `goods_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id_2`(`order_id`, `uid`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_order_cart_info
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_order_cart_info`;
CREATE TABLE `mw_store_order_cart_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) UNSIGNED NOT NULL COMMENT '订单id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `cart_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '购物车id',
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `cart_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购买东西的详细信息',
  `unique` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一id',
  `is_after_sales` tinyint(1) NULL DEFAULT 0 COMMENT '是否能售后0不能1能',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `oid`(`oid`, `unique`) USING BTREE,
  INDEX `cart_id`(`cart_id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单购物详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_order_status
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_order_status`;
CREATE TABLE `mw_store_order_status`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `oid` bigint(20) UNSIGNED NOT NULL COMMENT '订单id',
  `change_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型',
  `change_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作备注',
  `change_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `oid`(`oid`) USING BTREE,
  INDEX `change_type`(`change_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 81 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单操作记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_pink
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_pink`;
CREATE TABLE `mw_store_pink`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单id 生成',
  `order_id_key` int(10) UNSIGNED NOT NULL COMMENT '订单id  数据库',
  `total_num` int(10) UNSIGNED NOT NULL COMMENT '购买商品个数',
  `total_price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '购买总金额',
  `cid` bigint(20) UNSIGNED NOT NULL COMMENT '拼团产品id',
  `pid` bigint(20) UNSIGNED NOT NULL COMMENT '产品id',
  `people` int(10) UNSIGNED NOT NULL COMMENT '拼团总人数',
  `price` decimal(10, 2) UNSIGNED NOT NULL COMMENT '拼团产品单价',
  `create_time` datetime NOT NULL COMMENT '开始时间',
  `update_time` datetime NULL DEFAULT NULL,
  `stop_time` datetime NULL DEFAULT NULL,
  `k_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '团长id 0为团长',
  `is_tpl` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否发送模板消息0未发送1已发送',
  `is_refund` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否退款 0未退款 1已退款',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态1进行中2已完成3未完成',
  `is_del` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除1删除 0否',
  `unique_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '库存唯一值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '拼团表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product`;
CREATE TABLE `mw_store_product`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关键字',
  `bar_code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类id',
  `price` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `vip_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '会员价格',
  `ot_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '市场价',
  `postage` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '邮费',
  `unit_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '单位名',
  `sort` smallint(11) NULL DEFAULT 0 COMMENT '排序',
  `sales` mediumint(11) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `stock` mediumint(11) UNSIGNED NULL DEFAULT 0 COMMENT '库存',
  `is_show` tinyint(1) NULL DEFAULT 1 COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否热卖',
  `is_benefit` tinyint(1) NULL DEFAULT 0 COMMENT '是否优惠',
  `is_best` tinyint(1) NULL DEFAULT 0 COMMENT '是否精品',
  `is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品描述',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_postage` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否包邮',
  `is_del` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否删除',
  `mer_use` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '获得积分',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) UNSIGNED NULL DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) NULL DEFAULT 0 COMMENT '是否优品推荐',
  `ficti` mediumint(11) NULL DEFAULT 100 COMMENT '虚拟销量',
  `browse` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  `code_path` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `is_sub` tinyint(1) NULL DEFAULT 0 COMMENT '是否单独分佣',
  `temp_id` int(10) NULL DEFAULT NULL COMMENT '运费模板ID',
  `spec_type` tinyint(1) NULL DEFAULT 0 COMMENT '规格 0单 1多',
  `is_integral` tinyint(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '是开启积分兑换',
  `integral` int(11) NULL DEFAULT 0 COMMENT '需要多少积分兑换 只在开启积分兑换时生效',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_benefit`(`is_benefit`) USING BTREE,
  INDEX `is_best`(`is_best`) USING BTREE,
  INDEX `is_new`(`is_new`) USING BTREE,
  INDEX `toggle_on_sale, is_del`(`is_del`) USING BTREE,
  INDEX `price`(`price`) USING BTREE,
  INDEX `is_show`(`is_show`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `sales`(`sales`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_attr
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_attr`;
CREATE TABLE `mw_store_product_attr`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '商品ID',
  `attr_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `store_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_attr_result
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_attr_result`;
CREATE TABLE `mw_store_product_attr_result`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品ID',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性参数',
  `change_time` datetime NOT NULL COMMENT '上次修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_attr_value
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_attr_value`;
CREATE TABLE `mw_store_product_attr_value`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品ID',
  `sku` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '销量',
  `price` decimal(8, 2) UNSIGNED NOT NULL COMMENT '属性金额',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  `unique` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8, 2) UNSIGNED NOT NULL COMMENT '成本价',
  `bar_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品条码',
  `ot_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '原价',
  `weight` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '重量',
  `volume` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '体积',
  `brokerage` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '一级返佣',
  `brokerage_two` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '二级返佣',
  `pink_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '拼团价',
  `pink_stock` int(10) NOT NULL DEFAULT 0 COMMENT '拼团库存',
  `seckill_price` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '秒杀价',
  `seckill_stock` int(10) NOT NULL DEFAULT 0 COMMENT '秒杀库存',
  `integral` int(10) UNSIGNED ZEROFILL NULL DEFAULT 0000000000 COMMENT '需要多少积分兑换',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique`(`unique`, `sku`) USING BTREE,
  INDEX `store_id`(`product_id`, `sku`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品属性值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_relation
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_relation`;
CREATE TABLE `mw_store_product_relation`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户ID',
  `product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品ID',
  `original_product_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '淘宝原始商品id',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(收藏(collect）、点赞(like)、足迹(foot))',
  `category` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类,tb jd pdd vip dy',
  `img` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '图片地址',
  `title` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '商品标题',
  `start_price` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '原始价格',
  `end_price` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '券后价格',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `category`(`category`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6796 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品点赞和收藏足迹表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_reply
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_reply`;
CREATE TABLE `mw_store_product_reply`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` bigint(20) NOT NULL COMMENT '用户ID',
  `oid` bigint(20) NOT NULL COMMENT '订单ID',
  `unique` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '唯一id',
  `product_id` bigint(20) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `pics` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论图片',
  `create_time` datetime NOT NULL COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL,
  `merchant_reply_content` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` datetime NULL DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `parent_id`(`reply_type`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `product_score`(`product_score`) USING BTREE,
  INDEX `service_score`(`service_score`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_product_rule
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_product_rule`;
CREATE TABLE `mw_store_product_rule`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '规格名称',
  `rule_value` json NOT NULL COMMENT '规格值',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规则值(规格)表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_seckill
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_seckill`;
CREATE TABLE `mw_store_seckill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商品秒杀产品表id',
  `product_id` bigint(20) UNSIGNED NOT NULL COMMENT '商品id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '推荐图',
  `images` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '轮播图',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动标题',
  `info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '价格',
  `cost` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '成本',
  `ot_price` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '原价',
  `give_integral` decimal(10, 2) UNSIGNED NULL DEFAULT NULL COMMENT '返多少积分',
  `sort` int(10) UNSIGNED NOT NULL COMMENT '排序',
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `sales` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `unit_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名',
  `postage` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '邮费',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `start_time` date NOT NULL COMMENT '开始时间',
  `stop_time` date NOT NULL COMMENT '结束时间',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '产品状态',
  `is_postage` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否包邮',
  `is_hot` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '热门推荐',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '删除 0未删除1已删除',
  `num` int(11) UNSIGNED NOT NULL COMMENT '最多秒杀几个',
  `is_show` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '显示',
  `time_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '时间段id',
  `spec_type` tinyint(1) NULL DEFAULT NULL COMMENT '规格 0单 1多',
  `temp_id` int(10) NULL DEFAULT NULL COMMENT '运费模板id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_id`(`product_id`) USING BTREE,
  INDEX `start_time`(`start_time`, `stop_time`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `is_hot`(`is_hot`) USING BTREE,
  INDEX `is_show`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `sort`(`sort`) USING BTREE,
  INDEX `is_postage`(`is_postage`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品秒杀产品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_store_visit
-- ----------------------------
DROP TABLE IF EXISTS `mw_store_visit`;
CREATE TABLE `mw_store_visit`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NULL DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) NULL DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品类型',
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '用户ID',
  `count` int(11) NULL DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '产品浏览分析表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_attachment
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_attachment`;
CREATE TABLE `mw_system_attachment`  (
  `att_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `image_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  `uid` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '用户id',
  `invite_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邀请码',
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '附件管理表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_city
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_city`;
CREATE TABLE `mw_system_city`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) NOT NULL DEFAULT 0 COMMENT '城市id',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '省市级别',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT '父级id',
  `area_code` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '区号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `merger_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '合并名称',
  `lng` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `lat` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `is_show` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3971 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '城市表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_config
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_config`;
CREATE TABLE `mw_system_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名称',
  `value` varchar(5000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '默认值',
  `sort` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_group_data
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_group_data`;
CREATE TABLE `mw_system_group_data`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `group_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '对应的数据名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加数据时间',
  `update_time` datetime NULL DEFAULT NULL,
  `sort` int(11) NULL DEFAULT 0 COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态（1：开启；2：关闭；）',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 242 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '组合数据详情表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_store
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_store`;
CREATE TABLE `mw_system_store`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店名称',
  `introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '简介',
  `phone` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '省市区',
  `detailed_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '门店logo',
  `latitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` char(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '经度',
  `valid_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '核销有效日期',
  `day_time` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '每日营业开关时间',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除',
  `day_time_end` datetime NULL DEFAULT NULL,
  `day_time_start` datetime NULL DEFAULT NULL,
  `valid_time_end` datetime NULL DEFAULT NULL,
  `valid_time_start` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店自提' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_store_staff
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_store_staff`;
CREATE TABLE `mw_system_store_staff`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '微信用户id',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '店员头像',
  `store_id` int(11) NOT NULL COMMENT '门店id',
  `store_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `staff_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '店员名称',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `verify_status` tinyint(2) NOT NULL DEFAULT 0 COMMENT '核销开关',
  `status` tinyint(2) NULL DEFAULT 1 COMMENT '状态',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '门店店员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_user_level
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_user_level`;
CREATE TABLE `mw_system_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员名称',
  `money` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '购买金额',
  `valid_date` int(11) NOT NULL DEFAULT 0 COMMENT '有效时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为永久会员',
  `is_pay` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否购买,1=购买,0=不购买',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示 1=显示,0=隐藏',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `discount` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金比例',
  `discount_one` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '下级佣金比例',
  `discount_two` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '下下级佣金比例',
  `recharge_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '充值id',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员卡背景',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '会员图标',
  `explain` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '说明',
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'tb' COMMENT '会员类型，如tb、pdd、jd、vip、dy',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除.1=删除,0=未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '设置用户等级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_system_user_task
-- ----------------------------
DROP TABLE IF EXISTS `mw_system_user_task`;
CREATE TABLE `mw_system_user_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置原名',
  `task_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务类型',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '限定数',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `is_show` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_must` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否务必达成任务,1务必达成,0=满足其一',
  `illustrate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务说明',
  `create_time` datetime NOT NULL COMMENT '新增时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '等级任务设置' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user
-- ----------------------------
DROP TABLE IF EXISTS `mw_user`;
CREATE TABLE `mw_user`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账户(跟accout一样)',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户密码（跟pwd）',
  `real_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) NULL DEFAULT 0 COMMENT '生日',
  `card_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户备注',
  `partner_id` int(11) NULL DEFAULT 0 COMMENT '合伙人id',
  `group_id` int(11) NULL DEFAULT 0 COMMENT '用户分组id',
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `phone` char(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `add_ip` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '添加ip',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `last_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后一次登录ip',
  `now_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户余额',
  `brokerage_price` decimal(8, 2) NOT NULL DEFAULT 0.00 COMMENT '佣金金额',
  `integral` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT 0 COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1为正常，0为禁止',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `level_pdd` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼多多会员等级',
  `level_jd` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '京东会员等级',
  `level_dy` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '抖音会员等级',
  `level_vip` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '唯品会会员等级',
  `spread_uid` bigint(20) UNSIGNED NULL DEFAULT 0 COMMENT '推广元id',
  `spread_time` datetime NULL DEFAULT NULL COMMENT '推广员关联时间',
  `spread_update` tinyint(1) NOT NULL DEFAULT 0 COMMENT '被用于会员升级 1已使用 0未使用',
  `user_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为推广员',
  `pay_count` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '用户购买次数',
  `spread_count` int(11) NULL DEFAULT 0 COMMENT '下级人数',
  `addres` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '管理员编号 ',
  `login_type` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户登陆类型，h5,wechat,routine',
  `wx_profile` json NULL COMMENT '微信用户json信息',
  `ali_profile` json NULL COMMENT '微信用户json信息',
  `additional_no` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '邀请码',
  `expired` datetime NULL DEFAULT NULL COMMENT '会员到期时间',
  `expired_jd` datetime NULL DEFAULT NULL COMMENT '京东会员到期时间',
  `expired_pdd` datetime NULL DEFAULT NULL COMMENT '拼多多会员到期时间',
  `expired_dy` datetime NULL DEFAULT NULL COMMENT '抖音会员到期时间',
  `expired_vip` datetime NULL DEFAULT NULL COMMENT '唯品会会员到期时间',
  `change_word` tinyint(1) NULL DEFAULT 0 COMMENT '0-默认 1-第一次修改 2-第二次修改 3-第三次修改',
  `tb_pid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '淘宝pid',
  `jd_pid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '京东pid',
  `hb_pool` double NULL DEFAULT 0 COMMENT '拆红包佣金池',
  `pdd_pid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拼多多pid',
  `wechat_open_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信公众号openId',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `spreaduid`(`spread_uid`) USING BTREE,
  INDEX `level`(`level`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `is_promoter`(`is_promoter`) USING BTREE,
  INDEX `phone`(`phone`) USING BTREE,
  INDEX `wechat_open_id`(`wechat_open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15552 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_address
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_address`;
CREATE TABLE `mw_user_address`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户地址id',
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `real_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人电话',
  `province` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在省',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在市',
  `city_id` int(11) NULL DEFAULT NULL,
  `district` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人所在区',
  `detail` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `post_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `longitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '经度',
  `latitude` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '纬度',
  `is_default` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否默认',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `is_default`(`is_default`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_bank`;
CREATE TABLE `mw_user_bank`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `bank_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '银行卡号',
  `bank_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行行别编号',
  `bank_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行名称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `card_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡类型 DEBIT-借记卡   CREDIT-贷记卡',
  `request_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务请求号',
  `protocol_no` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '协议号',
  `is_default` tinyint(1) NULL DEFAULT 0 COMMENT '默认 1=默认',
  `extract_default` tinyint(1) NULL DEFAULT 0 COMMENT '提现默认 1=默认',
  `sign` tinyint(1) NULL DEFAULT 0 COMMENT '签约 1=签约成功',
  `link_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '提现绑卡标识',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `request_no`(`request_no`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `uid_sign`(`uid`, `sign`) USING BTREE,
  INDEX `bank_no_uid`(`uid`, `bank_no`, `sign`) USING BTREE,
  INDEX `protocol_no`(`protocol_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 74 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户银行卡表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_bill
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_bill`;
CREATE TABLE `mw_user_bill`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户账单id',
  `uid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户uid',
  `orig_uid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '原用户uid',
  `link_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '关联id',
  `pm` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 支出 1 = 获得',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '账单标题',
  `category` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细种类',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '明细类型',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台，如tb、pdd、jd、vip、dy、up fans',
  `number` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '明细数字',
  `balance` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '剩余',
  `mark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `order_create_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = 带确定 1 = 有效 -1 = 无效',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `pm`(`pm`) USING BTREE,
  INDEX `type`(`category`, `type`, `link_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35818 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账单表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_card
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_card`;
CREATE TABLE `mw_user_card`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `card_no` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '身份证号码',
  `card_no_enc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `cards` json NULL COMMENT '卡列表',
  `card_no_md5` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码MD5',
  `bank_no_enc` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `bank_no_md5` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '银行卡号MD5',
  `card_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '真实姓名',
  `phone` char(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `card_expired` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证过期时间',
  `card_f_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证人像页地址',
  `card_b_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证国徽页地址',
  `contract_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '合同地址',
  `contract_path_now` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '新合同地址',
  `face_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '人脸地址',
  `signature_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '签字地址',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '最后一次登录时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `card_no_md5`(`card_no_md5`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15547 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_enter
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_enter`;
CREATE TABLE `mw_user_enter`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '商户申请ID',
  `uid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户ID',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在省',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在市',
  `district` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户所在区',
  `address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户详细地址',
  `merchant_name` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户名称',
  `link_user` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `link_tel` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户电话',
  `charter` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商户证书',
  `add_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '添加时间',
  `apply_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '审核时间',
  `success_time` int(11) NOT NULL COMMENT '通过时间',
  `fail_message` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '未通过原因',
  `fail_time` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '未通过时间',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1 审核未通过 0未审核 1审核通过',
  `is_lock` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '0 = 开启 1= 关闭',
  `is_del` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  INDEX `province`(`province`, `city`, `district`) USING BTREE,
  INDEX `is_lock`(`is_lock`) USING BTREE,
  INDEX `is_del`(`is_del`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商户申请表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_extra
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_extra`;
CREATE TABLE `mw_user_extra`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `merchant_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '银盛商户号',
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '淘宝体验卡等级',
  `level_jd` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '京东体验卡等级',
  `level_pdd` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '拼多多体验卡等级',
  `level_dy` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '抖音体验卡等级',
  `level_vip` tinyint(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '唯品会体验卡等级',
  `expired` datetime NULL DEFAULT NULL COMMENT '淘宝体验卡到期时间',
  `expired_jd` datetime NULL DEFAULT NULL COMMENT '京东体验卡到期时间',
  `expired_pdd` datetime NULL DEFAULT NULL COMMENT '拼多多体验卡到期时间',
  `expired_dy` datetime NULL DEFAULT NULL COMMENT '抖音体验卡到期时间',
  `expired_vip` datetime NULL DEFAULT NULL COMMENT '唯品会体验卡到期时间',
  `exp_log` int(11) NULL DEFAULT 0 COMMENT '体验淘宝数量',
  `exp_log_jd` int(11) NULL DEFAULT 0 COMMENT '体验京东数量',
  `exp_log_pdd` int(11) NULL DEFAULT 0 COMMENT '体验多多数量',
  `exp_log_dy` int(11) NULL DEFAULT 0 COMMENT '体验抖音数量',
  `exp_log_vip` int(11) NULL DEFAULT 0 COMMENT '体验唯品会数量',
  `exp_update` datetime NULL DEFAULT NULL COMMENT '体验淘宝更新时间',
  `exp_update_jd` datetime NULL DEFAULT NULL COMMENT '体验京东更新时间',
  `exp_update_pdd` datetime NULL DEFAULT NULL COMMENT '体验拼多多更新时间',
  `exp_update_dy` datetime NULL DEFAULT NULL COMMENT '体验抖音更新时间',
  `exp_update_vip` datetime NULL DEFAULT NULL COMMENT '体验抖音更新时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户额外信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_extract
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_extract`;
CREATE TABLE `mw_user_extract`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '平台简称',
  `real_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `extract_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'bank' COMMENT 'bank = 银行卡 alipay = 支付宝wx=微信',
  `bank_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '银行卡',
  `bank_address` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '开户地址',
  `alipay_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '支付宝账号',
  `extract_price` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '提现金额',
  `mark` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `balance` decimal(8, 2) UNSIGNED NULL DEFAULT 0.00,
  `ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ip',
  `fail_msg` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '无效原因',
  `fail_time` datetime NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `status` tinyint(2) NULL DEFAULT 0 COMMENT '-1 未通过 0 审核中 1 已提现',
  `wechat` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `order_list` json NULL COMMENT '订单json信息',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `extract_type`(`extract_type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `add_time`(`create_time`) USING BTREE,
  INDEX `openid`(`uid`) USING BTREE,
  INDEX `fail_time`(`fail_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户提现表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_extract_config
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_extract_config`;
CREATE TABLE `mw_user_extract_config`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `auto_extract` tinyint(1) NULL DEFAULT 0 COMMENT '0=打开提现 1=关闭提现,用户app端无法发起提现',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户提现配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_fee_log
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_fee_log`;
CREATE TABLE `mw_user_fee_log`  (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '预估类型 1=今天 2=昨天 3=本月 4=上月 5=近30日',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台，如tb、pdd、jd、vip、dy,traffic,fans',
  `cid` tinyint(2) NULL DEFAULT 0 COMMENT '佣金类型 1=总览 2=自购 3=流量扶持 4=金客 5=银客 6=已结算',
  `channel` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '渠道, 淘宝 。。。流量扶持 粉丝',
  `count` bigint(20) NULL DEFAULT 0 COMMENT '是否已支付 0=未支付 1=已支付',
  `fee` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '成交预估',
  `fee_value` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '原佣金',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `platform`(`platform`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `type_2`(`type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户预估收益' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_fee_log_opt
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_fee_log_opt`;
CREATE TABLE `mw_user_fee_log_opt`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `tt` json NULL COMMENT '今日',
  `tm` json NULL COMMENT '本月',
  `tl` json NULL COMMENT '上月',
  `ts` json NULL COMMENT '近七日',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2784 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '预估收益优化表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_group
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_group`;
CREATE TABLE `mw_user_group`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户分组名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户分组表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_hb_scale
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_hb_scale`;
CREATE TABLE `mw_user_hb_scale`  (
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `exp_scale` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 1.00 COMMENT '体验订单翻倍比例',
  `month_scale` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 1.00 COMMENT '月卡订单翻倍比例',
  `exp_invalid_day` int(5) NULL DEFAULT 0 COMMENT '体验翻倍失效天数，相比create_time',
  `month_invalid_day` int(5) NULL DEFAULT 0 COMMENT '月卡翻倍失效天数，相比create_time',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '能量订单翻倍比例' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_level
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_level`;
CREATE TABLE `mw_user_level`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '等级vip',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'tb' COMMENT '会员类型，如tb、pdd、jd、vip、dy',
  `valid_time` int(11) NOT NULL DEFAULT 0 COMMENT '过期时间',
  `is_forever` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否永久',
  `mer_id` int(11) NOT NULL DEFAULT 0 COMMENT '商户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:禁止,1:正常',
  `mark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `remind` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已通知',
  `is_del` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否删除,0=未删除,1=删除',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `discount` int(11) NOT NULL DEFAULT 0 COMMENT '享受折扣',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 473 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户等级记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_pool
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_pool`;
CREATE TABLE `mw_user_pool`  (
  `uid` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `refund` int(11) NULL DEFAULT 0 COMMENT '退款次数',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '退款类型设置 0=默认 订单退款 1=系统检测到异常订单',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71800 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户红包配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_recharge
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_recharge`;
CREATE TABLE `mw_user_recharge`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NULL DEFAULT NULL COMMENT '充值用户UID',
  `oid` bigint(20) NULL DEFAULT 0 COMMENT '付款用户UID',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '',
  `order_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `price` decimal(8, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `give_price` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '购买赠送金额',
  `recharge_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '充值类型',
  `recharge_id` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '充值id',
  `paid` tinyint(1) NULL DEFAULT NULL COMMENT '是否充值',
  `type` tinyint(1) NULL DEFAULT 0 COMMENT '加盟类型 0=加盟 1=体验卡',
  `channel_id` bigint(20) NULL DEFAULT 0 COMMENT '通道id',
  `grade` int(11) NOT NULL DEFAULT 0 COMMENT '用户级别',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'tb' COMMENT '会员类型，如tb、pdd、jd、vip、dy',
  `used` tinyint(1) NULL DEFAULT 0 COMMENT '是否已被用于开启流量扶持 0=未使用 1=使用',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '充值支付时间',
  `result` varchar(5000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '充值结果',
  `create_time` datetime NULL DEFAULT NULL COMMENT '充值时间',
  `update_time` datetime NULL DEFAULT NULL,
  `refund_price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '退款金额',
  `is_del` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_id`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `recharge_type`(`recharge_type`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2552 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户充值表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_sign
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_sign`;
CREATE TABLE `mw_user_sign`  (
  `int` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '签到说明',
  `number` int(11) NOT NULL DEFAULT 0 COMMENT '获得积分',
  `balance` int(11) NOT NULL DEFAULT 0 COMMENT '剩余积分',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`int`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '签到记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_task_finish
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_task_finish`;
CREATE TABLE `mw_user_task_finish`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) NOT NULL DEFAULT 0 COMMENT '任务id',
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户id',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有效',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户任务完成记录表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_traffic
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_traffic`;
CREATE TABLE `mw_user_traffic`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `log_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '记录id',
  `rank` tinyint(1) NULL DEFAULT 0 COMMENT '分红级别 0=自身 1=1级 2=2级',
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `release_uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '发放的用户uid',
  `release_money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '发放金额',
  `release_time` datetime NULL DEFAULT NULL COMMENT '发放时间',
  `hb` tinyint(1) NULL DEFAULT 0 COMMENT '是否拆红包 0=未拆 1=已拆',
  `paid` tinyint(1) NULL DEFAULT 0 COMMENT '是否已支付 0=未支付 1=已支付',
  `order_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单号',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台，如tb、pdd、jd、vip、dy',
  `refund` tinyint(1) NULL DEFAULT 0 COMMENT '是否退款订单 0=默认 1=需要退款 2=已退款',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `orderId`(`order_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `paid`(`paid`) USING BTREE,
  INDEX `release_time`(`release_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流量扶持记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_traffic_log
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_traffic_log`;
CREATE TABLE `mw_user_traffic_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) NOT NULL DEFAULT 0 COMMENT '用户uid',
  `uid_one` bigint(20) NULL DEFAULT 0 COMMENT '上级用户uid',
  `uid_two` bigint(20) NULL DEFAULT 0 COMMENT '上上级用户uid',
  `money` decimal(8, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '升级花费的金额',
  `scale` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '自身分红比例',
  `scale_one` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '上级比例',
  `scale_two` decimal(8, 2) NULL DEFAULT 0.00 COMMENT '上上级比例',
  `platform` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '平台，如tb、pdd、jd、vip、dy',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `is_del` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '流量扶持开启记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_user_union
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_union`;
CREATE TABLE `mw_user_union`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
  `open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId unionId优先',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '名称 对应yml中pay.name',
  `wx_profile` json NULL COMMENT '微信用户json信息',
  `tb_pid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '淘宝渠道id',
  `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `name`(`name`) USING BTREE,
  INDEX `open_id`(`open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 164 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户联盟信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_live
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_live`;
CREATE TABLE `mw_wechat_live`  (
  `room_id` bigint(11) NOT NULL COMMENT '直播间id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '直播间标题',
  `cover_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '背景图',
  `share_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享图片',
  `live_status` int(9) NULL DEFAULT NULL COMMENT '直播间状态',
  `start_time` bigint(11) NULL DEFAULT NULL COMMENT '开始时间',
  `end_time` bigint(11) NULL DEFAULT NULL COMMENT '预计结束时间',
  `anchor_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主播昵称',
  `anchor_wechat` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主播微信号',
  `anchor_imge` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主播头像',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '直播间类型 1：推流 0：手机直播',
  `screen_type` tinyint(1) NULL DEFAULT NULL COMMENT '横屏、竖屏 【1：横屏，0：竖屏】',
  `close_like` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭点赞 【0：开启，1：关闭】',
  `close_comment` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭评论 【0：开启，1：关闭】',
  `close_goods` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭货架 【0：开启，1：关闭】',
  `product_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品id 多个,分割',
  `close_replay` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭回放【0：开启，1：关闭】',
  `close_share` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭分享【0：开启，1：关闭】',
  `close_kf` tinyint(1) NULL DEFAULT NULL COMMENT '是否关闭客服【0：开启，1：关闭】',
  PRIMARY KEY (`room_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信小程序直播表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_live_goods
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_live_goods`;
CREATE TABLE `mw_wechat_live_goods`  (
  `goods_id` bigint(9) NOT NULL COMMENT '直播商品id',
  `product_id` bigint(9) NULL DEFAULT NULL COMMENT '关联商品id',
  `cover_imge_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品图片',
  `url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品小程序路径',
  `price_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '价格类型 1：一口价（只需要传入price，price2不传） 2：价格区间（price字段为左边界，price2字段为右边界，price和price2必传） 3：显示折扣价（price字段为原价，price2字段为现价， price和price2必传）',
  `price` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `price2` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `third_party_tag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1, 2：表示是为api添加商品，否则是直播控制台添加的商品',
  `audit_id` bigint(20) NULL DEFAULT NULL COMMENT '审核单id',
  `audit_status` int(1) UNSIGNED ZEROFILL NULL DEFAULT NULL COMMENT '审核状态 0：未审核，1：审核中，2:审核通过，3审核失败',
  PRIMARY KEY (`goods_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '微信小程序直播商品表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_media
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_media`;
CREATE TABLE `mw_wechat_media`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) UNSIGNED NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `type`(`type`, `media_id`) USING BTREE,
  INDEX `type_2`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_menu
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_menu`;
CREATE TABLE `mw_wechat_menu`  (
  `key` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '缓存数据',
  `add_time` int(10) NULL DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信缓存表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_reply
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_reply`;
CREATE TABLE `mw_wechat_reply`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复数据',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE,
  INDEX `type`(`type`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `hide`(`hide`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信关键字回复表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for mw_wechat_template
-- ----------------------------
DROP TABLE IF EXISTS `mw_wechat_template`;
CREATE TABLE `mw_wechat_template`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模板ID',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '状态',
  `is_del` tinyint(1) NULL DEFAULT 0,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型：template:模板消息 subscribe:订阅消息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tempkey`(`tempkey`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '微信模板' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `system_picture`;
CREATE TABLE `system_picture`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `create_time` datetime NULL DEFAULT NULL COMMENT '上传日期',
  `delete_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '删除的URL',
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片名称',
  `height` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片高度',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片大小',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名称',
  `width` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片宽度',
  `md5code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件的MD5值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Sm.Ms图床' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_qiniu_config
-- ----------------------------
DROP TABLE IF EXISTS `system_qiniu_config`;
CREATE TABLE `system_qiniu_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `access_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'accessKey',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `host` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '外链域名',
  `secret_key` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'secretKey',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '空间类型',
  `zone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '机房',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '七牛云配置' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_qiniu_content
-- ----------------------------
DROP TABLE IF EXISTS `system_qiniu_content`;
CREATE TABLE `system_qiniu_content`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bucket` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Bucket 识别符',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件大小',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件类型：私有或公开',
  `update_time` datetime NULL DEFAULT NULL COMMENT '上传或同步的时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `suffix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '七牛云文件存储' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_quartz_job
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_job`;
CREATE TABLE `system_quartz_job`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `bean_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Spring Bean名称',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'cron 表达式',
  `is_pause` bit(1) NULL DEFAULT NULL COMMENT '状态：1暂停、0启用',
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '方法名称',
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '参数',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 50 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_quartz_log
-- ----------------------------
DROP TABLE IF EXISTS `system_quartz_log`;
CREATE TABLE `system_quartz_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `baen_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `exception_detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `is_success` bit(1) NULL DEFAULT NULL,
  `job_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `method_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `params` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` bigint(20) NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2715326 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务日志' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `system_role`;
CREATE TABLE `system_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限',
  `level` int(255) NULL DEFAULT NULL COMMENT '角色级别',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '功能权限',
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_roles_depts
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_depts`;
CREATE TABLE `system_roles_depts`  (
  `role_id` bigint(20) NOT NULL,
  `dept_id` bigint(20) NOT NULL,
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE,
  INDEX `FK7qg6itn5ajdoa9h9o78v9ksur`(`dept_id`) USING BTREE,
  CONSTRAINT `FK7qg6itn5ajdoa9h9o78v9ksur` FOREIGN KEY (`dept_id`) REFERENCES `system_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKrg1ci4cxxfbja0sb0pddju7k` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色部门关联' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `system_roles_menus`;
CREATE TABLE `system_roles_menus`  (
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`menu_id`, `role_id`) USING BTREE,
  INDEX `FKcngg2qadojhi3a651a5adkvbq`(`role_id`) USING BTREE,
  CONSTRAINT `FKo7wsmlrrxb2osfaoavp46rv2r` FOREIGN KEY (`menu_id`) REFERENCES `system_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKtag324maketmxffly3pdyh193` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色菜单关联' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `avatar_id` bigint(20) NULL DEFAULT NULL COMMENT '头像',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `enabled` bigint(20) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `job_id` bigint(20) NULL DEFAULT NULL COMMENT '岗位名称',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `last_password_reset_time` datetime NULL DEFAULT NULL COMMENT '最后修改密码的日期',
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `is_del` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_kpubos9gc2cvtkb0thktkbkes`(`email`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_id`) USING BTREE,
  INDEX `FKfftoc2abhot8f2wu6cl9a5iky`(`job_id`) USING BTREE,
  INDEX `FKpq2dhypk2qgt68nauh2by22jb`(`avatar_id`) USING BTREE,
  CONSTRAINT `FK5rwmryny6jthaaxkogownknqp` FOREIGN KEY (`dept_id`) REFERENCES `system_dept` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKfftoc2abhot8f2wu6cl9a5iky` FOREIGN KEY (`job_id`) REFERENCES `system_job` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKpq2dhypk2qgt68nauh2by22jb` FOREIGN KEY (`avatar_id`) REFERENCES `system_user_avatar` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_user_avatar
-- ----------------------------
DROP TABLE IF EXISTS `system_user_avatar`;
CREATE TABLE `system_user_avatar`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实文件名',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路径',
  `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大小',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户头像' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_users_roles
-- ----------------------------
DROP TABLE IF EXISTS `system_users_roles`;
CREATE TABLE `system_users_roles`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FKq4eq273l04bpu4efj0jd0jb98`(`role_id`) USING BTREE,
  CONSTRAINT `FKgd3iendaoyh04b95ykqise6qh` FOREIGN KEY (`user_id`) REFERENCES `system_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKt4v0rrweyk393bdgt107vdx0x` FOREIGN KEY (`role_id`) REFERENCES `system_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户角色关联' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for system_verification_code
-- ----------------------------
DROP TABLE IF EXISTS `system_verification_code`;
CREATE TABLE `system_verification_code`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建日期',
  `status` bit(1) NULL DEFAULT NULL COMMENT '状态：1有效、0过期',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码类型：email或者短信',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接收邮箱或者手机号码',
  `scenes` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '业务名称：如重置邮箱、重置密码等',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '验证码' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Table structure for visits
-- ----------------------------
DROP TABLE IF EXISTS `system_visits`;
CREATE TABLE `system_visits`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip_counts` bigint(20) NULL DEFAULT NULL,
  `pv_counts` bigint(20) NULL DEFAULT NULL,
  `week_day` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_11aksgq87euk9bcyeesfs4vtp`(`date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1266934639347151313 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '访客记录' ROW_FORMAT = COMPACT;

SET FOREIGN_KEY_CHECKS = 1;


-- ----------------------------
-- 3.0.5更新
-- ----------------------------


ALTER TABLE `mw_app_version` ADD `ios_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ios版本号' AFTER `id`;
ALTER TABLE `mw_app_version` ADD `android_version` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '安卓版本号' AFTER `ios_version`;
ALTER TABLE `mw_app_version` ADD `enable` tinyint(1) NULL DEFAULT 0 COMMENT '是否激活更新弹窗' AFTER `android_version`;
ALTER TABLE `mw_app_version` DROP COLUMN `version_code`;
ALTER TABLE `mw_app_version` ADD `platform_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '平台简称' AFTER `enable`;
ALTER TABLE `mw_app_version` ADD INDEX platform_name (platform_name);


--
-- 表的结构 `mw_order_ele`
--

DROP TABLE IF EXISTS `mw_order_ele`;
CREATE TABLE IF NOT EXISTS `mw_order_ele` (
    `trade_id` varchar(128) NOT NULL COMMENT '子订单号',
    `trade_parent_id` varchar(128) NOT NULL COMMENT '订单号',
    `shop_id` int(10) DEFAULT '0' COMMENT '店铺id',
    `actual_money` double DEFAULT '0' COMMENT '实际佣金',
    `predictMoney` double DEFAULT '0' COMMENT '预估佣金',
    `channelCode` varchar(64) DEFAULT '' COMMENT '渠道信息',
    `shop_name` varchar(64) DEFAULT '' COMMENT '店铺名称',
    `earning_time` datetime NULL DEFAULT NULL COMMENT '结算时间',
    `settled_status` tinyint(1) DEFAULT '0' COMMENT '结算状态：0待结算、1已结算、2订单无效',
    `order_status` tinyint(1) DEFAULT '0' COMMENT '订单状态：1已付款、2已结算、3已退款、4已收货',
    `item_img` varchar(255) DEFAULT '' COMMENT '商品主图',
    `item_title` varchar(255) DEFAULT '' COMMENT '商品标题',
    `pay_price` double DEFAULT '0' COMMENT '订单金额',
    `paid_time` datetime NULL DEFAULT NULL COMMENT '支付时间',
    `bind` tinyint(1) DEFAULT '0' COMMENT '0=未拆红包 1=已拆红包 2=已退款 3=已失效',
    `uid` bigint(20) unsigned DEFAULT NULL COMMENT '用户ID',
    `integral` bigint(20) DEFAULT '0' COMMENT '奖励积分',
    `hb` double DEFAULT NULL COMMENT '拆红包奖励金额',
    `cash` tinyint(1) DEFAULT '0' COMMENT '是否已提现，0 未提现 1 已提现',
    `inner_type` tinyint(1) DEFAULT '0' COMMENT '内部类型 0=默认 1=虚拟',
    `platform_name` varchar(32) DEFAULT '' COMMENT '平台简称',
    `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
    `is_del` tinyint(1) DEFAULT NULL COMMENT '删除标识',
    PRIMARY KEY (`trade_id`) USING BTREE,
    INDEX `paid_time`(`paid_time`),
    INDEX `platform_name`(`platform_name`),
    INDEX `uid`(`uid`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='饿了么订单';


-- ----------------------------
-- 3.1.1更新
-- ----------------------------

ALTER TABLE `mw_user_union` ADD `tlj_count` tinyint(1) NULL DEFAULT 0 COMMENT '淘礼金领取次数' AFTER `tb_pid`;
ALTER TABLE `mw_user_union` ADD `tlj_data` json NULL COMMENT '淘礼金id数据' AFTER `tlj_count`;
ALTER TABLE `mw_user_bill` ADD `unlock_time` datetime(0) NULL DEFAULT NULL COMMENT '账单解锁时间' AFTER `order_create_time`;
ALTER TABLE `mw_user_bill` ADD `unlock_status` tinyint(1) NULL DEFAULT 0 COMMENT '解锁状态 0=已解锁 默认值 1=待解锁 2=失效' AFTER `unlock_time`;


-- ----------------------------
-- Table structure for mw_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `mw_user_feedback`;
CREATE TABLE `mw_user_feedback`
(
    `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
    `uid` bigint(20) UNSIGNED NOT NULL COMMENT '用户id',
    `feedback` varchar(512) NOT NULL COMMENT '反馈内容',
    `create_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
    `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
    `is_del` tinyint(1) NULL DEFAULT 0,
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户反馈表' ROW_FORMAT = DYNAMIC;
