/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50743 (5.7.43-log)
 Source Host           : localhost:3306
 Source Schema         : library

 Target Server Type    : MySQL
 Target Server Version : 50743 (5.7.43-log)
 File Encoding         : 65001

 Date: 16/09/2023 13:11:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('admin', 'cd70467244c60b17e5615bdbe48360a3');
INSERT INTO `admin` VALUES ('root', 'e7ef63bc4c950228aa049fc02d2ec291');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告示标题',
  `detail` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '告示内容',
  `publish_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (1, '图书系统开始建设', '图书系统开始建设', '2020-06-02 22:28:31');
INSERT INTO `announcement` VALUES (2, '图书系统正在建设', '图书系统正在建设，冲鸭', '2020-06-02 08:29:40');
INSERT INTO `announcement` VALUES (3, '图书管理系统基本建成', '庆祝图书管理系统基本建成', '2020-06-09 16:43:18');

-- ----------------------------
-- Table structure for book_sort
-- ----------------------------
DROP TABLE IF EXISTS `book_sort`;
CREATE TABLE `book_sort`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '书籍类型名',
  `description` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_sort
-- ----------------------------
INSERT INTO `book_sort` VALUES (1, 'Weibo数据集', 'Weibo数据集已广泛应用于之前的多模态假新闻检测工作中。其中真实的新闻来自中国权威的新闻媒体新华社。虚假信息是在2012年5月至2016年1月这一段时间里，通过爬行微博的官方假新闻揭露系统来收集的。在实验中，训练集包含7532条新闻，其中包括3749条假新闻和3783条非假新闻；测试集包含1996篇新闻。');
INSERT INTO `book_sort` VALUES (2, 'Fakeddit数据集', 'Fakeddit数据集包括2分类（Real, Fake），3分类（True, The sample is fake and contains text that is true, The sample is fake with false text），6分类（True, Satire/Parody, Misleading Content, Imposter Content, False Connection, Manipulated Content），在本项目的模型中，本项目使用Fakeddit进行二分类，即真假分类。Fakeddit原始训练集有623,196个图像文本对，原始测试集有59,319个图像文本对，原始验证集有59,342个图像文本对。\n在本项目的实验中，本项目在Fakeddit的训练集中随机抽取了30000个图像文本对作为本项目的训练集；在测试集中随机抽取了10000个图像文本对作为本项目的训练集。考虑到类不平衡对实验效果的影响，本项目的训练集、测试集和验证集均保证类平衡，即真假新闻比例为1：1。');
INSERT INTO `book_sort` VALUES (3, 'Twitter数据集', '推特数据集来自MediaEval Validated Multimedia Usage Benchmark，用于检测推特上的假新闻。该数据集包含tweet列表，其中每个tweet都有带有附加图像的文本内容。该数据集分为训练集和测试集。训练集包含来自11个不同事件主题的约6000条假新闻和5000条真实新闻，测试集中约有1000条假新闻和1000条真实新闻。训练集和测试集之间不存在重叠事件。');
INSERT INTO `book_sort` VALUES (4, 'English Dataset', '本项目将FakeNewsNet中的两个数据集（即PolitiFact和GossipCop）和COVID构建一个英文数据集，它包含三个领域，即PolitiFact, GossipCop和COVID。PolitiFact：PolitiFact是由坦帕湾时报运营的一个网站，来自媒体事实的记者和编辑在这里查看政治新闻文章。PolitiFact在其网站上发布新闻文章的原始声明，以及完整的事实核查评估结果。GossipCop：GossipCop是一个收集各种媒体的网站。GossipCop分析新闻，并提供从0到10的真实评分，其中0表示新闻是完全错误的，10表示新闻是真实的。新闻内容爬虫从事实核查爬虫提供的url中提取原始新闻来源。新闻内容中的信息包括标题、正文、图片、作者信息、链接等各种信息。COVID：新闻的来源包括社交媒体上的脸书、推特、WhatsApp等帖子，以及在博客和传统新闻机构上发布的新闻文章。假新闻根据Snopes Media Group以及IFCN机构标注的假新闻标签，真新闻来自官方健康网站，并收集这些网站中的COVID-19相关新闻作为额外的真实信息。');
INSERT INTO `book_sort` VALUES (5, 'Chinese Dataset', '从新浪微博收集的多域假新闻检测数据集。目前共有9个领域，包括科学、军事、教育、灾难、政治、卫生、金融、娱乐和社会。在本项目的实验中，为了评估域数的影响，本项目从中文数据集中抽取3个域（政治、健康、娱乐），共3292条新闻，按6:2:2划分训练集、验证集和测试集，构建Chinese 3-domain。');
INSERT INTO `book_sort` VALUES (6, '项目正在构建的军事相关数据集', '从微博、中国军网、知乎、国防部、星河搜索、今日头条六家主流的新闻网站，按照时间的顺序，采用了Request和BeautifulSoup爬虫方法抓取了从2019年6月到2023年8月共40000条左右的军事相关的新闻。将爬取到的原始新闻采用人工筛选的方式对文本内容和图片内容进行数据清洗，过滤缺失样本和无关信息，将筛选之后的新闻按时间进行排序，最终保留30000条表达精炼的高质量新闻内容。\n');

-- ----------------------------
-- Table structure for book_sort_list
-- ----------------------------
DROP TABLE IF EXISTS `book_sort_list`;
CREATE TABLE `book_sort_list`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `post_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_id` int(20) NULL DEFAULT NULL,
  `user_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_date` datetime NULL DEFAULT NULL,
  `img_id` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `post_text` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `label` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book_sort_list
-- ----------------------------
INSERT INTO `book_sort_list` VALUES (1, '324597532548276224', 1, '886672620', 'boston_fake_03,boston_fake_35	SantaCruzShred', '2013-04-17 18:59:54', ' http://t.co/eXQTPZqqbG', NULL, 'Don\'t need feds to solve the #bostonbombing when we have #4chan!!', 'fake');

-- ----------------------------
-- Table structure for books
-- ----------------------------
DROP TABLE IF EXISTS `books`;
CREATE TABLE `books`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `library_id` int(20) NULL DEFAULT NULL,
  `sort_id` int(30) NULL DEFAULT NULL,
  `position` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of books
-- ----------------------------
INSERT INTO `books` VALUES (1, '基于模态特定和共享表示学习的跨模态融合模型', '罗伯特·阿尔特 ', 2, 12, '234sae', 1, '假新闻检测任务在利用多模态信息后取得了很大的进展。然而如何充分地利用模态特定和交互信息尚未得到很好地研究。本项目提出了一种假新闻检测方法，称为用于假新闻检测的单模态特征和交互特征联合决策网络。该网络由模态特定特征提取模块、跨模态融合模块和分类模块组成。模态特定特征提取模块提取来自图像和文本模态的模态特定特征。为了捕捉复杂的跨模态交互，跨模态模块先将模态特定特征融合得到融合矩阵，然后用交互网络得到交互特征。本项目利用分类损失得到每种特征的权重，将权重作为衡量每种特征对分类结果贡献的依据。为了让贡献大的特征在预测结果中占主导地位，在决策层利用权重对模态特定和交互特征预测的分布概率进行加权融合，得到最后的分类结果。');
INSERT INTO `books` VALUES (2, '基于注意力机制的跨模态融合模型', '陈嘉映', 1, 13, '234sdfd', 1, '现有的假新闻检测方法都强调对文本和图像等多模态信息的挖掘和利用。然而，如何为检测任务生成鉴别性的特征，并有效地聚合不同模态的特征进行假新闻检测，仍然是一个开放性问题。提出了一个全新的假新闻检测模型，即跨模态交互和融合网络（CMIFN）。本项目的CMIFN包括三个主要部分：1）基于监督对比学习的特征学习，联合进行模式内和模式间的监督对比学习，以学习判别模式的特定特征；2）多阶段跨模态交互，首先利用模态间注意力进行跨模态交互，然后采用图卷积网络（GCN）进一步学习图表示特征，旨在利用跨模态的相关性；3）跨模态聚合，引入基于模糊性学习的注意力方案，有效地聚合模态特定的特征和跨模态的图表示特征，从而使有用的多模态信息得到充分的利用。');
INSERT INTO `books` VALUES (3, '对比学习的跨模态关联模型', '杜格尔·狄克逊', 1, 14, '234s', 1, '现有的方法大多通过单个样本映射前后特征间的对齐来保留模态内信息，忽视了隐藏在原始数据集整体中的结构信息。本项目设计了一个信息蒸馏编码器来对模态特定特征进行编码，以此保留与任务相关的语言信息。本项目使用一个注意力子网络融合编码特征。本项目使用样本间的余弦相似性矩阵来表示邻接结构。本项目定义了三种相似性：模态内相似性，模态间相似性，联合相似性。为了实现模态内结构信息保留，本项目使用模态内相似性对齐约束输入特征和编码特征的相似性矩阵；为了有效减小模态间差异，本项目使用模态间相似性对齐编码特征的相似性矩阵；为了保留融合特征的结构信息，本项目通过联合相似性对齐联合相似性矩阵和融合特征的相似性矩阵。');
INSERT INTO `books` VALUES (4, '基于X模态生成的跨模态关联模型', '果麦', 1, 10, 'sd2342', 1, '假新闻中的图像通常有被重新压缩或篡改的痕迹，这会改变图像中的频域特征，故挖掘假新闻图像中的频域信息有助于假新闻检测。提出基于模态生成的跨模态关联方法，利用频域特征生成器在图像模态的基础上构建模态，以模态辅助关联各个模态。特征学习器将多种模态和模态的数据作为输入，在公共特征空间中学习多模态间的一致性，提取模态不变性特征。采用度量学习技术，通过模态加强模态间以及模态与其余模态的约束，进一步减小模态之间的差异。');
INSERT INTO `books` VALUES (5, '基于循环生成对抗网络的跨模态关联模型', '维斯拉瓦•辛波斯卡', 1, 10, '5楼1室234', 1, '社交媒体上的新闻帖子往往包含多种模态形式，如文字、图片等，涉及政治、经济等的事件类别也多种多样，造成了显著的模态差异和事件差异。如何有效地联合学习新闻帖子的模态不变和事件不变判别特征仍是一个挑战。本项目提出了一种新的假新闻检测方法，称为循环映射和对抗事件分类网络。它由两部分组成：多模态循环特征映射模块（CMM）和对抗事件分类模块。前者在于减少模态差异，后者在于减少事件差异。在CMM中，生成模型学习从一种模态生成另一种模态的特征，判别模型用于区分特征的模态来源的学习，重构器学习用文本和图像模态的融合特征重构文本特征和图像特征，以避免信息丢失。在AECM中，本项目设计了一个多任务事件分类器，其输出的每个维度对应于某个具体的事件类别，并且输出的额外维度表示与事件无关类别。多任务事件分类器在事件分类任务和事件独立分类任务之间执行事件对抗分类。CMAECN的网络训练以对抗方案为指导。');
INSERT INTO `books` VALUES (6, '基于图网络的多域自适应模型', '埃里克·马瑟斯', 1, 3, '4楼1室234', 1, '假新闻在社交媒体的各个领域上广泛传播，这导致了政治、灾难和金融等现实世界的许多方面的威胁。现有的方法大多集中在单域假新闻检测（SFND）上，当这些方法应用于多域假新闻检测时，其性能并不理想。多领域假新闻检测（MFND）作为一个新兴领域，越来越受到关注。然而，数据分布，如词频和传播模式，因域而异。面对严重的领域转移的挑战，现有的假新闻检测技术在多领域场景中表现不佳。因此，需要为MFND设计一个专门的模型。本项目提出了一个基于图网络的多域自适应方法。它包含四个模块。（1）特定域特征提取模块，根据每个域的词嵌入特征，基于注意力机制为每个域自适应选择特征提取网络，更充分提取特定域的特征；（2）共享域特征提取模块，本项目除了特定域特征提取器，额外设计了一个共享域特征提取器，有效提取共享域的特征；（3）基于图网络的特征融合模块，利用图能够更好利用特征的能力，进一步提取特征；（4）域对抗鉴别模块，用于混淆分类器，使其无法分辨样本来自哪个域，从而增强模型的分类能力。');
INSERT INTO `books` VALUES (7, '基于跨模态图结构保留和匹配的表征学习模型', '战斗', 2, 1, '五楼234', 1, '假新闻在网络上的持续发酵威胁着社会的稳定和安全，促使研究人员聚焦于研究假新闻检测。社交媒体的发展使仅依靠单一模态信息来检测假新闻变得具有挑战性。现有的研究倾向于集成多模态信息以追求信息挖掘的完整性。如何从多模态数据中很好地获取结构信息的同时，有效地消除模态差异，仍然是一个具有挑战性的问题。本方法提出了一种基于图结构保留的模态间融合网络（IF-GSP）的假新闻检测方法。本方法设计了模态间跨层融合模块，通过融合模态间不同层次的特征来弥合模态间差异。模态内和跨模态的对比损失旨在提高模态间的语义相似性，同时侧重于特定模态的鉴别特征学习。本方法设计了基于图卷积网络（GCN）的图结构保留模块，使学习到的特征充分感知图结构信息。多模态融合模块利用注意力机制自适应地整合跨模态特征表示。');
INSERT INTO `books` VALUES (8, '基于多模态图结构学习的表征学习模型', '1243', 1, 2, '撒旦法', 1, '为了充分利用样本结构信息，本项目利用图神经网络来进行表征学习。但图神经网络对图结构有较高的敏感性，图结构中存在的较多的噪声或原始图错误的连接关系都会使得图神经网络学习得到的表征较差。为了获得最优的图结构，本项目构建了基于图卷积神经网络的图结构学习模块来优化图结构以更好地服务于图表征学习，并设计了基于跨模态对比学习的模态鉴别器来缓解模态差异并增强特征的判别能力。');

-- ----------------------------
-- Table structure for borrow_books
-- ----------------------------
DROP TABLE IF EXISTS `borrow_books`;
CREATE TABLE `borrow_books`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `card_id` int(20) NULL DEFAULT NULL,
  `book_id` int(20) NULL DEFAULT NULL,
  `borrow_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `return_date` datetime NULL DEFAULT NULL,
  `illegal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `manager_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_books
-- ----------------------------
INSERT INTO `borrow_books` VALUES (20, 1805010202, 1, '2020-06-11 09:37:10', '2020-06-12 09:37:18', '2020-06-11 09:48:07', '', 'chen');
INSERT INTO `borrow_books` VALUES (21, 1805010206, 5, '2020-04-08 09:37:40', '2020-06-08 09:38:14', '2020-06-11 10:50:07', '已逾期3天', 'chen');
INSERT INTO `borrow_books` VALUES (22, 1805010207, 1, '2020-06-11 09:47:44', '2020-08-10 09:47:52', '2020-06-11 09:50:07', '', 'chen');
INSERT INTO `borrow_books` VALUES (24, 1805010202, 1, '2020-06-02 09:55:04', '2020-06-03 09:55:16', '2020-06-11 09:56:02', '已逾期8天', 'chen');
INSERT INTO `borrow_books` VALUES (25, 1805010204, 2, '2020-06-11 09:59:42', '2020-08-10 09:59:47', '2020-06-11 10:00:17', '', 'chen');
INSERT INTO `borrow_books` VALUES (26, 1805010202, 1, '2020-06-09 10:01:13', '2020-06-10 10:01:48', '2020-06-11 10:07:29', '超期一天', 'chen');
INSERT INTO `borrow_books` VALUES (27, 1805010202, 5, '2020-06-08 10:12:18', '2020-06-09 10:12:27', '2020-06-11 10:13:36', '已逾期2天', 'chen');
INSERT INTO `borrow_books` VALUES (28, 1805010204, 2, '2020-04-07 10:12:28', '2020-06-06 10:12:41', NULL, NULL, NULL);
INSERT INTO `borrow_books` VALUES (29, 1805010202, 6, '2020-06-11 08:19:56', '2020-06-12 08:20:07', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for borrow_card
-- ----------------------------
DROP TABLE IF EXISTS `borrow_card`;
CREATE TABLE `borrow_card`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `rule_id` int(11) NULL DEFAULT NULL,
  `status` smallint(6) NULL DEFAULT NULL COMMENT '0注销，1正常',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1805010220 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of borrow_card
-- ----------------------------
INSERT INTO `borrow_card` VALUES (1805010202, 'root', '老王', 7, 1);
INSERT INTO `borrow_card` VALUES (1805010203, 'root', '黄白白', 2, 0);
INSERT INTO `borrow_card` VALUES (1805010204, 'root', '黄土', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010205, '1234', '白云', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010206, '111', '月', 6, 1);
INSERT INTO `borrow_card` VALUES (1805010207, 'admin', '明月', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010208, 'admin', '明月复苏', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010210, 'yue', '张沙', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010211, 'mingming', '星星', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010212, 'admin', '明月', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010213, 'chen', '辰', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010214, '1234', '小红', 1, 1);
INSERT INTO `borrow_card` VALUES (1805010217, '赵雪', '赵雪', 2, 1);
INSERT INTO `borrow_card` VALUES (1805010219, '1234', '测试', 1, 0);

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES (1, '南图', NULL);
INSERT INTO `library` VALUES (2, '北图', NULL);
INSERT INTO `library` VALUES (3, '教师之家', NULL);

-- ----------------------------
-- Table structure for manager
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES (1, '辰', 'chen', 'chen', '232222@qq.com');
INSERT INTO `manager` VALUES (2, '明', 'ming', 'ming', '234234@qq.com');
INSERT INTO `manager` VALUES (3, '明月', 'root', '1234', '284908631@qq.com');
INSERT INTO `manager` VALUES (11, 'root', '1234', 'root', '123456@qq.com');
INSERT INTO `manager` VALUES (12, '测试员', 'test', 'test', 'test@qq.com');
INSERT INTO `manager` VALUES (13, '明月', '1', 'root', '1');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `card_id` int(20) NULL DEFAULT NULL,
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `public_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES (1, 1805010201, '冲鸭，一起来看书', '2020-06-01 23:11:59');
INSERT INTO `message` VALUES (2, 1805010202, '我爱学习', '2020-05-29 23:12:03');
INSERT INTO `message` VALUES (3, 1805010202, '图书馆的书质量很好，图书管理员态度非常好，系统管理员也非常热心，太棒了', '2020-06-04 23:12:24');
INSERT INTO `message` VALUES (6, 1805010202, '咋回事', '2020-06-12 08:34:18');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules`  (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `borrow_num` int(10) NULL DEFAULT NULL COMMENT '限制本数',
  `limit_day` int(10) NULL DEFAULT NULL COMMENT '限制天数',
  `borrow_library` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `overtime_fee` float(10, 3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES (1, 10, 60, '1、2、3', 0.100);
INSERT INTO `rules` VALUES (2, 1, 10, '2、3', 1.000);
INSERT INTO `rules` VALUES (3, 20, 120, '1、2、3', 1.000);
INSERT INTO `rules` VALUES (4, 20, 180, '1、2、3', 0.100);
INSERT INTO `rules` VALUES (5, 1, 100, '1', 0.100);
INSERT INTO `rules` VALUES (6, 15, 60, '1、2、3', 0.100);
INSERT INTO `rules` VALUES (7, 1, 1, '1、3', 1.000);

SET FOREIGN_KEY_CHECKS = 1;
