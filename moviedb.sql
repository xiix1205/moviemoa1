-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        8.0.22 - MySQL Community Server - GPL
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- moviedb 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `moviedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `moviedb`;

-- 테이블 moviedb.boardfree 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardfree` (
  `FREE_NUM` int NOT NULL AUTO_INCREMENT,
  `FREE_GENRE` varchar(15) NOT NULL,
  `FREE_SUBJECT` varchar(50) NOT NULL,
  `FREE_CONTENT` varchar(2000) NOT NULL,
  `FREE_FILE` varchar(50) DEFAULT NULL,
  `ID` char(20) NOT NULL,
  `FREE_DATE` datetime DEFAULT NULL,
  `FREE_READCOUNT` int DEFAULT '0',
  PRIMARY KEY (`FREE_NUM`),
  KEY `USERBOARDFREE_ID_FK` (`ID`),
  CONSTRAINT `USERBOARDFREE_ID_FK` FOREIGN KEY (`ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.boardfree:~8 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardfree` DISABLE KEYS */;
INSERT INTO `boardfree` (`FREE_NUM`, `FREE_GENRE`, `FREE_SUBJECT`, `FREE_CONTENT`, `FREE_FILE`, `ID`, `FREE_DATE`, `FREE_READCOUNT`) VALUES
	(1, 'FREE', '잡담게시판 테스트', '123456', 'BOARD_FILE', 'user2', '2021-01-03 23:59:03', 2),
	(2, 'FREE', '잡담게시글 수정 테스트', '수정했음', NULL, 'admin', '2021-01-05 09:28:07', 0),
	(3, 'FREE', '2021년 1월', '1월입니다', NULL, 'admin', '2021-01-05 09:28:36', 3),
	(4, 'FREE', '잡담게시판 이미지 테스트', '이미지 파일 첨부합니다', 'HarryPotter1.jpg', 'user2', '2021-01-05 09:31:24', 0),
	(5, 'FREE', '다운로드', '이미지 다운로드 테스트', 'lala4.jpg', 'user2', '2021-01-05 09:32:11', 0),
	(6, 'FREE', '검색을 해보세요', '검색을 해보세요', NULL, 'user2', '2021-01-05 09:32:36', 5),
	(7, 'FREE', '자유롭게 글을 써주세요', '글을 써주세요', NULL, 'blake', '2021-01-05 09:35:39', 0),
	(8, 'FREE', '잡담게시판입니다(수정)', '자유롭게 글을 남겨주세요 이미지를 다운 받으세요 ', 'Hope5.jpg', 'blake', '2021-01-05 09:36:21', 6);
/*!40000 ALTER TABLE `boardfree` ENABLE KEYS */;

-- 테이블 moviedb.boardfreereply 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardfreereply` (
  `F_REPLY_NUM` int NOT NULL AUTO_INCREMENT,
  `F_REPLY_REF_NUM` int NOT NULL,
  `F_CONTENT` varchar(600) NOT NULL,
  `ID` char(20) NOT NULL,
  `F_REPLY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`F_REPLY_NUM`),
  KEY `UESRFREEREPLY_ID_FK` (`ID`),
  CONSTRAINT `freereply_free_NUM_FK` FOREIGN KEY (`F_REPLY_NUM`) REFERENCES `boardfree` (`FREE_NUM`),
  CONSTRAINT `UESRFREEREPLY_ID_FK` FOREIGN KEY (`ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.boardfreereply:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardfreereply` DISABLE KEYS */;
INSERT INTO `boardfreereply` (`F_REPLY_NUM`, `F_REPLY_REF_NUM`, `F_CONTENT`, `ID`, `F_REPLY_DATE`) VALUES
	(1, 6, '댓글 테스트!!', 'user2', '2021-01-05 09:33:23'),
	(2, 6, '댓글 달아주세요', 'user2', '2021-01-05 09:33:31'),
	(3, 8, '이미지', 'blake', '2021-01-05 09:36:40');
/*!40000 ALTER TABLE `boardfreereply` ENABLE KEYS */;

-- 테이블 moviedb.boardmovie 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardmovie` (
  `MOVIE_NUM` int NOT NULL AUTO_INCREMENT,
  `MOVIE_GENRE` varchar(15) NOT NULL,
  `MOVIE_SUBJECT` varchar(50) NOT NULL,
  `MOVIE_CONTENT` varchar(2000) NOT NULL,
  `MOVIE_FILE` varchar(50) DEFAULT NULL,
  `ID` char(20) NOT NULL,
  `MOVIE_DATE` datetime DEFAULT NULL,
  `MOVIE_READCOUNT` int DEFAULT '0',
  PRIMARY KEY (`MOVIE_NUM`),
  KEY `USERBOARDMOVIE_ID_FK` (`ID`),
  CONSTRAINT `USERBOARDMOVIE_ID_FK` FOREIGN KEY (`ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.boardmovie:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardmovie` DISABLE KEYS */;
INSERT INTO `boardmovie` (`MOVIE_NUM`, `MOVIE_GENRE`, `MOVIE_SUBJECT`, `MOVIE_CONTENT`, `MOVIE_FILE`, `ID`, `MOVIE_DATE`, `MOVIE_READCOUNT`) VALUES
	(1, 'MOVIE', '영화게시판 테스트', '테스트합니다', NULL, 'admin', '2021-01-05 09:25:53', 0),
	(2, 'MOVIE', '글쓰기 테스트', '글쓰기 테스트입니다', NULL, 'admin', '2021-01-05 09:26:58', 0),
	(3, 'MOVIE', '게시글 수정 테스트(수정함)', '테스트합니다 ', NULL, 'admin', '2021-01-05 09:27:12', 3),
	(4, 'MOVIE', '카테고리를 선택하세요', '카테고리 테스트', NULL, 'admin', '2021-01-05 09:27:43', 1),
	(5, 'MOVIE', '영화관련 이야기를 남겨주세요', '남겨주세요', NULL, 'user2', '2021-01-05 09:29:34', 1),
	(6, 'MOVIE', '이미지 파일첨부 테스트', '파일첨부 테스트입니다', 'HarryPotter6.jpg', 'user2', '2021-01-05 09:30:19', 1),
	(7, 'MOVIE', '해리포터', '해리포터 이미지를 올려주세요', 'HarryPotter2.jpg', 'user2', '2021-01-05 09:30:50', 3),
	(8, 'MOVIE', '1월의 영화', '게시글을 써주세요', NULL, 'blake', '2021-01-05 09:34:02', 1),
	(9, 'MOVIE', '영화게시판입니다', '글을 써주세요', 'tenet3.jpg', 'blake', '2021-01-05 09:34:40', 3),
	(10, 'MOVIE', '테스트', 'ㄹㄹ', NULL, 'user4', '2021-01-05 11:25:49', 1);
/*!40000 ALTER TABLE `boardmovie` ENABLE KEYS */;

-- 테이블 moviedb.boardmoviereply 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardmoviereply` (
  `M_REPLY_NUM` int NOT NULL AUTO_INCREMENT,
  `M_REPLY_REF_NUM` int NOT NULL,
  `M_CONTENT` varchar(600) NOT NULL,
  `ID` char(20) NOT NULL,
  `M_REPLY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`M_REPLY_NUM`),
  KEY `UESRMOVIEREPLY_ID_FK` (`ID`),
  CONSTRAINT `moviereply_MOVIE_NUM_FK` FOREIGN KEY (`M_REPLY_NUM`) REFERENCES `boardmovie` (`MOVIE_NUM`),
  CONSTRAINT `UESRMOVIEREPLY_ID_FK` FOREIGN KEY (`ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.boardmoviereply:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardmoviereply` DISABLE KEYS */;
INSERT INTO `boardmoviereply` (`M_REPLY_NUM`, `M_REPLY_REF_NUM`, `M_CONTENT`, `ID`, `M_REPLY_DATE`) VALUES
	(1, 9, '댓글도 써주세요', 'blake', '2021-01-05 09:35:14');
/*!40000 ALTER TABLE `boardmoviereply` ENABLE KEYS */;

-- 테이블 moviedb.boardnotice 구조 내보내기
CREATE TABLE IF NOT EXISTS `boardnotice` (
  `NOTICE_NUM` int NOT NULL AUTO_INCREMENT,
  `NOTICE_GENRE` varchar(15) NOT NULL,
  `NOTICE_SUBJECT` varchar(50) NOT NULL,
  `NOTICE_CONTENT` varchar(2000) NOT NULL,
  `NOTICE_FILE` varchar(50) DEFAULT NULL,
  `ID` char(20) NOT NULL,
  `NOTICE_DATE` date DEFAULT NULL,
  `NOTICE_READCOUNT` int DEFAULT '0',
  PRIMARY KEY (`NOTICE_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.boardnotice:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `boardnotice` DISABLE KEYS */;
INSERT INTO `boardnotice` (`NOTICE_NUM`, `NOTICE_GENRE`, `NOTICE_SUBJECT`, `NOTICE_CONTENT`, `NOTICE_FILE`, `ID`, `NOTICE_DATE`, `NOTICE_READCOUNT`) VALUES
	(1, 'NOTICE', '공지사항 테스트입니다', '테스트합니다', NULL, 'admin', '2021-01-05', 1),
	(2, 'NOTICE', '공지사항 테스트입니다', '공지사항', NULL, 'admin', '2021-01-05', 0);
/*!40000 ALTER TABLE `boardnotice` ENABLE KEYS */;

-- 테이블 moviedb.movielist 구조 내보내기
CREATE TABLE IF NOT EXISTS `movielist` (
  `m_id` int NOT NULL AUTO_INCREMENT,
  `m_title` varchar(30) DEFAULT NULL,
  `m_poster` varchar(30) DEFAULT NULL,
  `m_date` varchar(20) DEFAULT NULL,
  `m_banner` varchar(50) DEFAULT NULL,
  `m_title_eng` varchar(50) DEFAULT NULL,
  `m_year` int DEFAULT NULL,
  `m_nation` varchar(50) DEFAULT NULL,
  `m_age` varchar(50) DEFAULT NULL,
  `m_genre` varchar(50) DEFAULT NULL,
  `m_time` varchar(50) DEFAULT NULL,
  `m_total` varchar(50) DEFAULT NULL,
  `m_director` varchar(50) DEFAULT NULL,
  `m_actor` varchar(50) DEFAULT NULL,
  `m_summary1` varchar(300) DEFAULT NULL,
  `m_summary2` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `m_summary3` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `m_star` varchar(50) DEFAULT NULL,
  `m_review` varchar(300) DEFAULT NULL,
  `m_slide1` varchar(50) DEFAULT NULL,
  `m_slide2` varchar(50) DEFAULT NULL,
  `m_slide3` varchar(50) DEFAULT NULL,
  `m_slide4` varchar(50) DEFAULT NULL,
  `m_slide5` varchar(50) DEFAULT NULL,
  `m_slide6` varchar(50) DEFAULT NULL,
  `m_video` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.movielist:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `movielist` DISABLE KEYS */;
INSERT INTO `movielist` (`m_id`, `m_title`, `m_poster`, `m_date`, `m_banner`, `m_title_eng`, `m_year`, `m_nation`, `m_age`, `m_genre`, `m_time`, `m_total`, `m_director`, `m_actor`, `m_summary1`, `m_summary2`, `m_summary3`, `m_star`, `m_review`, `m_slide1`, `m_slide2`, `m_slide3`, `m_slide4`, `m_slide5`, `m_slide6`, `m_video`) VALUES
	(1, '도굴', 'Collectors1.jpg', '2020.11.04', 'Collectors2.jpg', 'Collectors', 2020, '한국', '12세이상관람가', '범죄', '114분', '1,458,200명', '박정배', '이제훈 조우진', '“고물인 줄 알았는데 보물이었다?!”\r\n땅 파서 장사하는 도굴꾼들이 온다!', '흙 맛만 봐도 보물을 찾아내는 타고난 천재 도굴꾼 강동구(이제훈).\r\n자칭 한국의 \'인디아나 존스\'로 불리는 고분벽화 도굴 전문가 존스 박사(조우진), 전설의 삽질 달인 삽다리(임원희)를 만나 환상(?)의 팀플레이를 자랑하며 위험천만하고도 짜릿한 도굴의 판을 키운다.\r\n<br><br>\r\n한편, 그의 재능을 알아본 고미술계 엘리트 큐레이터 윤실장(신혜선)은\r\n강동구에게 매력적이면서도 위험한 거래를 제안하는데...!\r\n<br><br>\r\n황영사 금동불상, 고구려 고분벽화 그리고 서울 강남 한복판 선릉까지!\r\n팔수록 판이 커지는 도굴의 세계!', '2020 범죄오락무비\r\n<도굴>\r\n올 11월, 급이 다른 삽질이 시작된다!', NULL, NULL, 'Collectors3.jpg', 'Collectors4.jpg', 'Collectors5.jpg', 'Collectors6.jpg', 'Collectors7.jpg', 'Collectors8.jpg', 'https://www.youtube.com/embed/HHXyQiCGgKw'),
	(2, '삼진그룹 영어토익반', 'Samjin1.jpg', '2020.10.21', 'Samjin2.jpg', 'SAMJIN COMPANY ENGLISH CLASS', 2019, '한국', '12세이상관람가', '드라마', '110분', '1,568,852명', '이종필', '고아성(이자영) 이솜(정유나)', '마이 드림 이즈 커리어우먼”\r\n1995년, 토익 600점만 넘기면 대리가 될 수 있다!', '입사 8년차 동기인 말단 여직원들이 ‘삼진그룹 영어토익반’에 모인다!\r\n실무 능력 퍼펙트, 현실은 커피 타기 달인인 생산관리3부 오지랖 ‘이자영’(고아성),\r\n추리소설 마니아로 뼈 때리는 멘트의 달인 마케팅부 돌직구 ‘정유나’(이솜),\r\n수학 올림피아드 우승 출신, 실체는 가짜 영수증 메꾸기 달인 회계부 수학왕 ‘심보람’(박혜수)은\r\n대리가 되면 진짜 ‘일’을 할 수 있을 것이라는 희망에 부푼다.\r\n<br><br>\r\n내부고발이라도 하게? 나서지 마. 우리만 다쳐\r\n잔심부름을 하러 간 공장에서 검은 폐수가 유출되는 것을 목격한 ‘자영’은\r\n‘유나’, ‘보람’과 함께 회사가 무엇을 감추고자 하는지, 결정적 증거를 찾으려 한다.\r\n불가능해 보이는 싸움, 세 친구는 해고의 위험을 무릅쓰고 고군분투를 시작하는데…', '아이 캔 두 잇, 유 캔 두 잇, 위 캔 두 잇! 회사와 맞짱 뜨는 용감한 세 친구!', NULL, NULL, 'Samjin3.jpg', 'Samjin4.jpg', 'Samjin5.jpg', 'Samjin6.jpg', 'Samjin7.jpg', 'Samjin8.jpg', 'https://www.youtube.com/embed/Vg8VH4BH6uo'),
	(3, '담보', 'Pawn1.jpg', '2020.09.20', 'Pawn2.jpg', 'Pawn', 2020, '한국', '12세이상관람가', '드라마', '113분', '1,719,104명', '강대규', '성동일 하지원', '빚 떼려다 혹 붙였다!\r\n책임지고 받아 키워 드립니다!', '1993년 인천\r\n거칠고 까칠한 사채업자 두석(성동일)과 종배(김희원)는\r\n떼인 돈 받으러 갔다가 얼떨결에 9살 승이(박소이)를 담보로 맡게 된다.\r\n<br><br>\r\n“담보가 무슨 뜻이에요?”\r\n<br><br>\r\n뜻도 모른 채 담보가 된 승이와 승이 엄마의 사정으로 아이의 입양까지 책임지게 된 두석과 종배.\r\n하지만 부잣집으로 간 줄 알았던 승이가 엉뚱한 곳에 있다는 것을 알게 된 두 사람은\r\n승이를 데려와 돌보게 된다.\r\n<br><br>\r\n예고 없이 찾아온 아이에게 인생을 담보 잡힌 두석과 종배.\r\n빚 때문에 아저씨들에게 맡겨진 담보 승이.\r\n두석, 종배, 승이 세 사람은 어느덧 서로에게 특별한 존재가 되는데..', '돈 받으러 갔다가 인생의 보물을 만났다!\r\n올 가을, 담보가 보물이 됩니다!', NULL, NULL, 'Pawn3.jpg', 'Pawn4.jpg', 'Pawn5.jpg', 'Pawn6.jpg', 'Pawn7.jpg', 'Pawn8.jpg', 'https://www.youtube.com/embed/fWZcwe6TBWg'),
	(4, '조제', 'josee1.jpg', '2020.12.10', 'josee2.jpg', 'josee', 2020, '한국', '15세이상관람가', '드라마,멜로', '117분', '139,435명', '김종관', '한지민 남주혁', '자신을 ‘조제’로 불러달라는 그녀\r\n처음 만난 그날부터\r\n‘조제’는 ‘영석’에게 잊을 수 없는 이름으로 남는다.', '할머니와 단둘이 사는 집, 그곳에서 책을 읽고 상상하며\r\n자신만의 세계를 살고 있는 ‘조제’.\r\n<br><br>\r\n우연히 만난 그녀에게 특별한 감정을 느끼기 시작한 ‘영석’은\r\n천천히, 그리고 솔직하게 다가가기 시작한다.\r\n<br><br>\r\n하지만 처음 경험해보는 사랑이 설레는 한편 가슴 아픈 ‘조제’는\r\n자신에게 찾아온 낯선 감정을 밀어내는데…', '기억할 거야\r\n너와 함께한 모든 순간을', NULL, NULL, 'josee3.jpg', 'josee4.jpg', 'josee5.jpg', 'josee6.jpg', 'josee7.jpg', 'josee8.jpg', 'https://www.youtube.com/embed/M5tvXLIu2iE'),
	(5, '안티고네', 'antigone1.jpg', '2020.11.19', 'antigone2.jpg', 'Antigone', 2019, '캐나다', '15세이상관람가', '드라마', '109분', '10,064명', '소피 데라스페', '나에마 리치 라와드 엘-제인', '“전 언제든 다시 법을 어길 거예요”', '캐나다 몬트리올에 정착한 이민자 가족의\r\n막내 안티고네에게 비극이 벌어진다.\r\n<br><br>\r\n두 오빠 중 하나가 경찰의 총에 맞아 사망하고,\r\n하나는 그 자리에서 구속된 것.', '사랑하는 가족을 지키고 싶은\r\n안티고네는 오빠 대신 감옥에 들어가고,\r\n<br><br>\r\n용기 있는 그의 행동에 대중들은\r\n안티고네를 SNS 영웅으로 만들기 시작하는데...', NULL, NULL, 'antigone3.jpg', 'antigone4.jpg', 'antigone5.jpg', 'antigone6.jpg', 'antigone7.jpg', 'antigone8.jpg', 'https://www.youtube.com/embed/K9bBUmfzI8E'),
	(6, '테넷', 'tenet1.jpg', '2020.08.26', 'tenet2.jpg', 'TENET', 2020, '영국,미국', '12세이상관람가', '액션,블록버스터', '150분', '199만명', '크리스토퍼 놀란', '존 데이비드 워싱턴, 로버트 패틴슨', '당신에게 줄 건 한 단어 ‘테넷’\r\n“이해하지 말고 느껴라!”', '시간의 흐름을 뒤집는 인버전을 통해 현재와 미래를 오가며 세상을 파괴하려는 사토르(케네스 브래너)를 막기 위해 투입된 작전의 주도자(존 데이비드 워싱턴). 인버전에 대한 정보를 가진 닐(로버트 패틴슨)과 미술품 감정사이자 사토르에 대한 복수심이 가득한 그의 아내 캣(엘리자베스 데비키)과 협력해 미래의 공격에 맞서 제3차 세계대전을 막아야 한다!', '[KEY POINT]\r\n인버전: 사물의 엔트로피를 반전시켜 시간을 거스를 수 있는 미래 기술. 미래에서 인버전된 무기를 현재로 보내 과거를 파괴할 수 있다.', NULL, NULL, 'tenet3.jpg', 'tenet4.jpg', 'tenet5.jpg', 'tenet6.jpg', 'tenet7.jpg', 'tenet8.jpg', 'https://www.youtube.com/embed/IW_khaePCBE'),
	(7, '호프', 'Hope1.jpg', '2020.12.17', 'Hope2.jpg', 'Hope', 2019, '스웨덴,노르웨이', '12세이상관람가', '드라마', '125분', '2381명', '마리아 소달', '스텔란 스카스카드, 안드레아 베인 호픽', '엄마, 아내, 그리고 나...\r\n생의 희망을 꿈꾸는 마지막 일주일', '성공한 감독이자 여섯 아이의 엄마,\r\n그리고 사실혼 관계인 \'토마스\'의 아내 \'안야\'는\r\n크리스마스 이틀 전, 시한부 선고를 받는다.\r\n<br><br>\r\n식어버린 토마스와의 사이,\r\n끊이지 않는 집안일까지,\r\n아무렇지 않은 듯 오늘을 살아내는 \'안야\'.\r\n<br><br>\r\n그러나 조금씩 지쳐가던 그녀는\r\n행복한 크리스마스 날, 모두에게 시한부임을 밝히는데...', '', NULL, NULL, 'Hope3.jpg', 'Hope4.jpg', 'Hope5.jpg', 'Hope6.jpg', 'Hope7.jpg', 'Hope8.jpg', 'https://www.youtube.com/embed/mKX1mg6onMA'),
	(8, '라라랜드', 'lala1.jpg', '2020.12.31', 'lala2.jpg', 'La La Land', 2020, '미국', '12세이상관람가', '뮤지컬, 멜로·로맨스, 드라마', '126분', '3,744,189명', '데이미언 셔젤', '엠마 스톤, 라이언 고슬링', '황홀한 사랑, 순수한 희망, 격렬한 열정…\r\n이 곳에서 모든 감정이 폭발한다!', '꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.', '여자 주인공 미아는 배우 지망생입니다. 자신의 꿈을 이루기 위해 사소한 배역들까지 포함해서 오디션이란 오디션은 다 보러 다니지만, 오디션을 다 진행하기도 전에 끊어버리고, 홀대당합니다. 계속된 탈락에 낙심한 그녀는 친구들과 함께 파티를 가지만 그 어디에서도 자신이 존재해야할 곳을 찾지 못합니다. 심란한 마음으로 집으로 돌아가던 중, 어느 가게 안에서 들리는 피아노 소리에 이끌려 그 안으로 들어갑니다. 그 안에는 남자주인공 세바스찬이 피아노를 치고 있습니다.', NULL, NULL, 'lala3.jpg', 'lala4.jpg', 'lala5.jpg', 'lala6.jpg', 'lala7.jpg', 'lala8.jpg', 'https://www.youtube.com/embed/3sQ3lsOItUE'),
	(41, '해리포터와 아즈카반의 죄수', 'HarryPotter1.jpg', '2020.08.26', 'HarryPotter2.jpg', 'Harry Potter and the Prisoner of Azkaban', 2019, '영국,미국', '12세이상관람가', '액션,블록버스터', '150분', '199만명', '크리스토퍼 놀란', '존 데이비드 워싱턴, 로버트 패틴슨', '올 여름, 놀라움으로 가득한 새로운 마법이 온다!', '13세가 된 해리 포터(다니엘 래드클리프)는 또 한번의 여름 방학을 이모 가족인 더즐리 일가와 우울하게 보내야 했다. 물론 마법을 쓰는 건 일체 금지. 하지만, 버논 이모부의 누이인 마지 아줌마(팸 페리스)가 더즐리 가를 방문하면서 상황은 변한다. 위압적인 마지는 해리에겐 늘 공포의 대상. 마지 아줌마 때문에 스트레스를 받던 해리는 급기야 `실수`로 그녀를 거대한 괴물 풍선으로 만들어 하늘 높이 띄워 보내버리고 만다.', '해리는 자신의 모든 용기와 마법의 힘과 친구들의 도움을 총동원, 이러한 의문점들을 풀고 자신과 시리우스 블랙 사이에 얽혀있는 비밀을 파헤쳐 가는데…', NULL, NULL, 'HarryPotter3.jpg', 'HarryPotter4.jpg', 'HarryPotter5.jpg', 'HarryPotter6.jpg', 'HarryPotter7.jpg', 'HarryPotter8.jpg', 'https://www.youtube.com/embed/FNHkrMZJowk');
/*!40000 ALTER TABLE `movielist` ENABLE KEYS */;

-- 테이블 moviedb.moviereview 구조 내보내기
CREATE TABLE IF NOT EXISTS `moviereview` (
  `r_num` int NOT NULL AUTO_INCREMENT,
  `id` char(20) NOT NULL,
  `m_id` int NOT NULL,
  `m_star` varchar(50) DEFAULT NULL,
  `m_review` varchar(300) DEFAULT NULL,
  `r_date` datetime DEFAULT NULL,
  PRIMARY KEY (`r_num`),
  KEY `id` (`id`),
  KEY `m_id` (`m_id`),
  CONSTRAINT `moviereview_ibfk_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `moviereview_ibfk_2` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.moviereview:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `moviereview` DISABLE KEYS */;
INSERT INTO `moviereview` (`r_num`, `id`, `m_id`, `m_star`, `m_review`, `r_date`) VALUES
	(20, 'admin', 2, '4', '최고', '2020-12-23 16:15:22'),
	(22, 'admin', 7, '4', '최고', '2020-12-23 17:25:57'),
	(24, 'admin', 1, '5', '최고', '2020-12-24 12:17:52'),
	(25, 'user1', 1, '1', 'ㅂㄹ', '2020-12-28 10:01:57'),
	(31, 'apple', 2, '5', '2020년 최고의 영화', '2021-01-03 22:57:52'),
	(34, 'user3', 8, '4', '최고', '2021-01-04 18:49:32'),
	(35, 'admin', 8, '5', '재밌다', '2021-01-05 09:26:14'),
	(36, 'blake', 8, '3', '배경이 이뻐요', '2021-01-05 09:37:04'),
	(37, 'apple', 8, '5', '또 보러갈겁니다', '2021-01-05 09:40:02'),
	(40, 'user2', 8, '5', '재밌다', '2021-01-05 10:18:28');
/*!40000 ALTER TABLE `moviereview` ENABLE KEYS */;

-- 테이블 moviedb.news 구조 내보내기
CREATE TABLE IF NOT EXISTS `news` (
  `news_num` int NOT NULL AUTO_INCREMENT,
  `news_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `news_subject` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `img_a` text,
  `content_a` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `img_b` text,
  `content_b` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `img_c` text,
  `content_c` text,
  `img_d` text,
  `content_d` text,
  `img_e` text,
  `content_e` text,
  `img_f` text,
  `content_f` text,
  `news_date` date DEFAULT NULL,
  `count` int DEFAULT NULL,
  PRIMARY KEY (`news_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=290 DEFAULT CHARSET=utf8;

-- 테이블 데이터 moviedb.news:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` (`news_num`, `news_name`, `news_subject`, `img_a`, `content_a`, `img_b`, `content_b`, `img_c`, `content_c`, `img_d`, `content_d`, `img_e`, `content_e`, `img_f`, `content_f`, `news_date`, `count`) VALUES
	(1, '글 배동미 사진 최성열', '\'스위트홈\' 박규영 - 괴물이 된다면, 눈물 괴물?', 'news1-1.jpg', '짝사랑에 설레는 마음 대신 살아야 한다는 절박한 본능이다. 드라마 <사이코지만 괜찮아>에서 정신병동 보호사를 짝사랑하는 간호사, <녹두꽃>에서 조선시대 개화주의자를 남몰래 마음에 품은 양반집 아씨를 연기했던 배우 박규영에게 <스위트홈>은 여러모로 새로운 도전이다. 그가 연기하는 지수는 현수(송강)의 집 위층에 사는 베이시스트로, 괴물이 나타나자 악기 대신 야구방망이를 드는 인물이다.<br><br>\r\n<h3>-웹툰에서 지수는 짧은 머리인데, 드라마에서는 긴 염색 모발을 묶은 채 등장한다. 원작과 다른 외모를 탄생시킨 과정이 궁금하다.</h3><br><br>\r\n=지수는 베이스 기타를 다루는 인물이고, 외적으로도 강해 보여야 했다. 제작진이 머리카락을 탈색하고 색감을 넣으면 좋겠다고 했고, 긴 생머리의 반 정도를 탈색한 뒤 분홍색을 입혔다. 분홍색으로 정한 건 내 의견이었다. 탈색을 처음 해봤는데 5번 탈색한 끝에 분홍색을 입혔다. 왜 핑크였나면 개성이 강해 보일 것 같았고 분홍색 머리는 꼭 한번 해보고 싶었기 때문이다. (웃음) 새로워서 정말 좋았다. 마음 같아선 머리카락 전체를 다 탈색하고 싶었는데, 촬영 기간이 길다보니 머리카락이 길 때마다 계속 탈색하려면 모발이 남아나지 않을 거란 주변의 만류 끝에 반만 변신했다.<br><br>\r\n<h3>-<스위트홈>의 세계관에서 괴물이 된 사람은 그가 가진 욕망이 크게 발현돼 기괴한 모습으로 변한다. 만약 지수가 괴물이 된다면 어떤 모습일까.</h3><br><br>\r\n=지수는 강한 척하지만 사실 여러 가지 슬픔과 아픔을 억누르고 있는 캐릭터다. 그런 부분을 티내지 않으려고 강한 외형을 갖추고 강한 언행을 한다고 생각한다. 지수에게 숨겨진 욕망이라면 여린 모습을 보여주고 싶은 눈물이 아닐까. 그래서 ‘눈물 괴물’이 되지 않을까 싶다. 계속 울면서 물을 몰고 다니는 괴물. 방금 든 생각이다. (웃음) 엉엉 소리내 울지만 지수가 힘을 발현할 때 물이 몰려오면 무서울 것 같다.<br><br>\r\n<h3>-배우 박규영에게 <사이코지만 괜찮아>는 조급함이 사라지게 하는 작품이라고 인터뷰를 통해 밝힌 적 있다. 그에 앞서 촬영한 <스위트홈>은 어떤 의미인가.</h3><br><br>\r\n=조급함은 배우와 떼려야 떼기 힘든 감정이다. 배우는 정해진 방향이 없고, 하나의 길로 예정된 게 없기 때문이다. <스위트홈>의 촬영기간이 꽤나 길었다. 촬영에만 집중해야 해서 ‘이 작품 뒤에 뭔가를 해야지’라고 생각하면서 조급하기보다, 지수란 캐릭터와 작품에 임하기에 급급했다. 체력적으로도 많은 노력이 필요했다.<br><br>\r\n<h3>-맑은 얼굴 때문인지 선한 캐릭터를 자주 연기하면서도 스펙트럼을 다르게 만들어나가는 것 같다.</h3><br><br>\r\n=선한 인물에 국한된다기 보다, 인간에게는 정말 많은 모습이 있다고 생각한다. 마침 내가 맡은 캐릭터마다 내게서 꺼낼 수 있는 부분이 있었다. <사이코지만 괜찮아>의 주리에게서도 내가 가지고 있는 부분이 보였고, 연기할 때 내 많은 부분이 들어갔다. <스위트홈>의 지수도 내가 가진 면이 있었다. 세보이고 싶고 약해보이고 싶지 않아 하는 모습. 머릿속으로는 정말 많은 생각을 하면서도 겉으로 ‘신경 쓰지 않아, 난 강해’를 표현하는 모습이 내게도 있다. 연기할 때 내 안에서 어떤 걸 꺼낼까 생각하면 정말 재밌다.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-16', NULL),
	(2, '김진우(뉴미디어팀 기자)', '\'스파이더맨 3\' 토비 맥과이어X앤드류 가필드X톰 홀랜드, 역대급 스파이더맨 콜라보 성사될까', 'news2-1.jpg', '역대 스파이더맨이 한 편의 영화에 모두 모일 수 있을까? 마블 시네마틱 유니버스의 \'큰 그림\'의 정체가 드러나고 있다. 샘 레이미 감독의 <스파이더맨 2>의 옥토퍼스로 출연했던 배우 알프레드 몰리나가 MCU의 새영화 <스파이더맨 3>(가제)에 옥토퍼스 역할로 다시 캐스팅됐다. 이 소식을 전하는 대부분의 매체가 "역대 스파이더맨들이 (한 영화에) 모두 등장할 확률이 높아지고 있다"고 보도하고 있다.<br><br>\r\n샘 레이미 감독의 <스파이더맨> 3부작의 토비 맥과이어, <어메이징 스파이더맨> 시리즈의 앤드류 가필드, MCU <스파이더맨> 시리즈의 톰 홀랜드까지, 역대 스파이더맨 출연설이 제기된 것은 이번이 처음은 아니다. MCU 페이즈 3기의 엔딩을 장식했던 <스파이더맨: 파 프롬 홈>에 J.K. 시몬스가 출연하면서 수많은 스파이더맨 팬들에게 여지를 남긴 것. 그 이유는 샘 레이미 감독의 <스파이더맨> 3부작에서 신문사 데일리 뷰글의 J. 조나 제임슨 편집장을 연기한 배우가 바로 J.K. 시몬스였고, 심지어 두 영화에서 동일한 캐릭터를 연기했기 때문이다. 지난 10월에는 앤드류 가필드 주연의 <스파이더맨 2>에서 악역 일렉트로를 연기한 제이미 폭스가 <스파이더맨 3>에 동일한 역할로 캐스팅된 바 있다. 당시 제이미 폭스는 개인 SNS에 일렉트로와 세 명의 스파이더맨이 마주하고 있는 사진을 올려, 세간에 떠돌던 역대 스파이더맨 랑데부설에 힘을 실어줬다.', '<img src="http://image.cine21.com/resize/cine21/still/2020/1210/20_31_29__5fd20711f050a[W680-].jpg">', '옥토퍼스역의 알프레드 몰리나 캐스팅 소식은 현재 다른 캐릭터의 출연설도 현실성이 있는 것 아니냐는 확대 해석을 낳고 있다. 스파이더맨 시리즈 세계관 내에서 꽤 중요한 악역 캐릭터인 옥토퍼스 외에도 샘 레이미 감독의 <스파이더맨> 3부작에 출연했던 메리 제인 왓슨 역의 커스틴 던스트, <어메이징 스파이더맨> 시리즈에서 그웬 스테이시 역이었던 엠마 스톤 등 스파이더맨 주변 인물들의 재등장설이 과연 실현 가능할지는 더 지켜봐야 할 것 같다.', '<img src="http://image.cine21.com/resize/cine21/still/2020/1210/20_32_15__5fd2073f570d1[W680-].jpg">', '물론 창작자들의 의지만 가지고 성사될 수 있는 이슈도 아니다. 각각 판권을 쥐고 있는 마블과 소니 픽처스의 기획 방향도 고려해야 한다. 소니 픽처스는 2018년 개봉한 <베놈>을 시작으로 \'소니 픽처스 유니버스 오브 마블 캐릭터스\'를 꾸려나갈 것이라고 알렸다. 현재 촬영을 완료하고 개봉을 준비 중인 <베놈: 렛 데어 비 카니지>와 <모비우스>가 이에 해당하며, 두 영화 모두 마블 코믹스에서 스파이더맨과 대적하는 빌런인 베놈과 모비우스를 주인공을 한 작품이다. 그중 <모비우스>의 예고편에서는 샘 레이미 감독의 <스파이더맨> 3부작, MCU의 <스파이더맨> 시리즈와의 접점이 등장하며 팬들의 기대를 산 바 있다. 예고편 속에서 그라피티의 형태로 잠깐 등장한 스파이더맨의 모습은 토비 맥과이어가 연기한 스파이더맨의 외형과 동일했으며, 예고편 후반부에는 <스파이더맨: 홈커밍>의 빌런이었던 벌쳐(마이클 키튼)가 직접 모습을 드러내며 MCU와의 연계가 사실상 확정됐다. MCU와 역대 <스파이더맨> 시리즈, 소니에서 제작하는 \'소니 픽처스 유니버스 오브 마블 캐릭터스\'가 모두 하나로 이어질 가능성이 농후해진 셈이다.', NULL, NULL, NULL, NULL, NULL, NULL, '2020-12-17', NULL),
	(3, '김진우(뉴미디어팀 기자)', '넷플릭스, <인간수업> 진한새 작가의 신작 <글리치> 제작 확정', 'news3-1.jpg', '십 대 청소년들의 비행을 소재로 우리 사회의 어두운 단면을 포착했던 <인간수업>의 제작진이 다시 한번 뭉친다. <인간수업> 각본을 집필한 진한새 작가의 산작 <글리치>가 넷플릭스에서 만들어진다. <글리치>는 정체불명의 불빛과 함께 사라진 사람들을 찾아 나서는 UFO 커뮤니티 회원들의 특별한 여정을 그린, 코미디와 미스터리 스릴러를 결합한 작품이다.\r\n<br>\r\n진한새 작가의 첫 장편 드라마 <인간수업>은 논란과 호평을 동시에 부른 바 있다. 자극적인 소재와 폭력 묘사로 비판을 받기도 했으며, 날카로운 메시지를 지닌 전형성을 탈피한 성장 드라마라는 호평을 받기도 했다. 당시 진한새 작가는 <한겨례>와의 인터뷰에서 "원론적인 질문에 최대한 진지하게 답하기 위해서는 사회에서 가장 들여다보기 불편하고 건드리기 고통스러운 부분을 다뤄야 한다고 생각했다. 윤리적으로 민감한 소재를 다루는 것에 대한 부담이 컸다. 다양한 사람들의 피드백을 강박적으로 들었다"고 답한 바 있다.', 'news3-2.jpg', '당시 인터뷰에서 진한새 작가는 차기작에 대한 질문에 "청춘이라기엔 좀 간당간당한 나이의 인물들에 관한 이야기를 해보고 싶다. 그럭저럭 살아내고 있던 이들이 어느 날 엉뚱한 사건에 말려드는 식의 이야기에 관심이 간다"고 말했다. 그가 넷플릭스와 다시 손잡은 <글리치>에서도 이런 요소들이 담길지 주목된다.\r\n<br>\r\n<글리치>의 제작은 <인간수업>을 비롯해 드라마 <육룡이 나르샤>, <개와 늑대의 시간>, <해신>, <풀하우스> 등 여러 흥행작들을 배출해 온 ‘스튜디오 329’가 맡는다. 신인이었던 진한새 작가를 발탁한 ‘스튜디오 329’의 윤신애 대표가 다시 제작을 총괄한다. <글리치>는 넷플릭스에서 단독 공개될 예정이며 연출, 캐스팅, 공개일 등은 알려지지 않았다.', NULL, '', NULL, '', NULL, '', NULL, '', '2020-12-30', NULL),
	(4, '조현나', '2021년 가장 주목해야 할 배우는... 한국 콘텐츠 산업 이끄는 리더 55인에게 물었다', 'news4-1.jpg', '한국 영상 콘텐츠 업계를 이끄는 전문가 55인이 가장 주목하는 2021년의 배우는 이병헌, 김태리, 이도현, 신시아였다. <씨네21>은 급변하는 국내 엔터테인먼트 산업의 현황을 진단하고 미래를 전망하기 위해 영화·드라마 제작사, 투자배급사, OTT, 매니지먼트사 등 한국 엔터테인먼트 산업을 움직이는 키플레이어 55명을 대상으로 설문조사를 진행했다. 이번 설문은 영화와 방송 그리고 OTT 등 영상 콘텐츠 산업의 흐름을 주도하는 주요 결정권자들 대부분이 참여했고, 이들이 생각하는 한국 영상 콘텐츠 산업의 전망을 한눈에 파악할 수 있다는 점 때문에 더욱 의미 있다.', 'news4-2.jpg', '‘2021년 주목해야 할 배우’ 설문 조사 결과의 키워드는 ‘세대교체’였다. 기성배우들에 대한 믿음은 여전했으나 그 사이로 새로운 가능성을 내비친 젊은 배우들의 면모가 관계자들의 시선을 사로잡았다. “감독과 더불어 배우들의 세대교체가 이뤄지는 2021년이 될 것이다”라는 전문가들의 예측이 반영된 셈이다. 이러한 변화의 흐름은 여자배우들의 순위에서 특히 두드러졌다. 반대로 남자배우 순위에선 여러 편의 신작 공개를 앞둔 기성배우들에 대한 기대가 큰 것으로 드러났다.\r\n<br><br>\r\n‘주목해야 할 여성배우’ 1위에 오른 김태리는 “창작자들이 첫손에 꼽는 캐스팅”이라 언급되며 다수의 지지를 얻었다. “출연작의 장르와 시대가 늘 달랐던, 개척자와 같은 이미지”를 지닌,“당분간 활약과 성장세가 단연 기대되는 배우다.” 2위에 오른 전지현은 <지리산>과 <킹덤: 아신전>으로 4년 만에 관객 앞에 나선다. “‘전지현’이라는 위상을 다시 한번 공고히 다질 수 있을지” 또한 “기존 캐릭터에서 벗어난 모습을 보여줄지” 등 기대하는 목소리가 이어졌다. 3위의 전종서는 차기작 <우리, 자영>이 로맨스영화인 만큼 <콜>의 영숙과 상반된 모습을 확인할 수 있을 것이라는, 4위의 김다미는 <소울메이트>에서 <이태원 클라스>와 또 다른 청춘의 모습으로 등장할 것이라는 기대를 받았다.\r\n<br><br>\r\n남자배우의 경우 <비상선언> <콘크리트 유토피아> <승부> 등 “최근 많은 작품에 출연하며 왕성하게 활동 중인” 이병헌이 1위에 올랐다. “이병헌의 단단한 연기력” 외에도 세 영화의 각기 다른 분위기에 녹아든 모습을 확인할 수 있을 것이란 예측에서다. 마찬가지로 <헤어질 결심> <헤븐: 행복의 나라로> <한산> 등 “작품의 중량감으로 따지면 단연 박해일”이라며 그를 선택한 이들도 많았다. <야차> <자산어보> <킹메이커>를 통해 “극장에서 활발히 활동할 모습이 눈앞에 그려진다”는 설경구도 4위에 안착했다. 작품에 대한 관심과 배우에 대한 기대감이 맞물린 경우도 있었다. ‘가장 주목하는 한국영화’ 1위에 오른 <외계인>의 류준열은 주목해야 할 남자배우 2위에 선정됐다. <승부>에서 이병헌과 대적을 펼치고, 현재 연상호 감독의 넷플릭스 드라마 <지옥>을 촬영 중인 유아인은 3위에 이름을 올렸다.', 'news4-3.jpg', ' ', '', '', '', '', '', '', '2020-12-29', NULL),
	(5, '김진우(뉴미디어팀 기자)', '박지윤·장도연·재재·비비·최예나, 티빙의 첫 오리지널 콘텐츠 <여고추리반>으로 뭉친다', 'news5-1.jpg', '국내 OTT 시장의 큰 축을 담당하고 있는 티빙이 첫 오리지널 콘텐츠 <여고추리반>을 론칭했다. <여고추리반>은 출연진들이 추리반 동아리원이 되어 학교에서 벌어지는 미스터리한 사건의 진상을 밝히는 사건 해결 어드벤처 버라이어티다.\r\n<br><br>\r\n<여고추리반>에는 아나운서 박지윤, 예능인 장도연, 유튜브채널 <문명특급>으로 스타MC로 거듭난 재재, 가수 비비, 걸그룹 아이즈원의 멤버 최예나까지 총 5인이 출연을 확정지었다. 다양한 분야에서 활약 중인 5인의 출연진들이 한 팀이 되어 두뇌, 재치, 근성, 체력 등을 동원해 얽히고설킨 사건 속 진실을 찾아나가는 과정이 담긴다.', 'news5-2.jpg', '연출은 심리게임 버라이어티 <더 지니어스> 시리즈, 모의사회 게임쇼 <소사이어티 게임>, 어드벤쳐 버라이어티 <대탈출> 등 다양한 장르예능으로 두터운 마니아층을 형성한 정종연 PD가 맡았다. 그는 "OTT 플랫폼에 새롭게 도전하게 되어 설레는 마음으로 준비하고 있다. <여고추리반>은 <대탈출> 시리즈와 같은 어드벤처 장르의 연장선상에 있다고 보면 이해가 쉽다. 여자고등학교라는 장소, 여성출연진들의 추리능력, 그들이 보여줄 특별한 감성에 크게 기대하고 있다"며 <여고추리반> 론칭에 대한 감회를 전했다.\r\n<br><br>\r\n티빙의 조대현 티빙사업본부장은 "정종연 PD의 대표작인 <대탈출>은 두터운 팬덤을 확보하여 tvN뿐만 아니라, 20대·30대 이용자들이 특히 많은 티빙에서도 늘 최상위 인기 프로그램이었다. 새롭게 선보일 <여고추리반>은 티빙의 첫 번째 오리지널 콘텐츠로서 OTT형 예능의 정석을 성공적으로 보여줄 수 있을 것이라 기대한다"고 덧붙였다.\r\n<br><br>\r\n티빙은 2021년부터 자사 및 외부의 우수 크리에이터와 협업해 다양한 오리지널 예능 및 드라마를 순차적으로 선보일 예정이다. 그 시작이 될 <여고추리반>은 2021년 1월 말 티빙에서 단독 공개된다.', NULL, '', NULL, '', NULL, '', NULL, '', '2020-12-17', NULL),
	(6, '김현수', '송강호, 김민희가 21세기 최고 배우로 선정된 이유', 'news6-1.jpg', '뉴욕타임스가 21세기 가장 위대한 배우 25인을 선정하면서 한국의 배우 송강호, 김민희를 포함시켰다. 할리우드를 포함한 다양한 국가의 배우들을 대상으로 한 이 리스트에서 김민희는 16위에, 송강호는 6위의 자리에 언급되었다. 뉴욕타임스는 리스트 공개에 앞서 얼마든지 여기 언급되지 못한 더 좋은 배우들이 있을 수 있음을 시인하며 “지난 20년 동안 우리가 가장 좋아하는 영화 배우들을 주관적인 관점에서” 선정했다고 밝혔다.\r\n<br><br>\r\n뉴욕타임스는 리스트에 오른 25명의 배우에 대한 각각의 선정 이유도 함께 공개했다. 선정위원들은 16위에 오른 김민희의 출연작 중 <지금은맞고그때는틀리다>와 <아가씨>의 연기에 가장 주목했다. 그 중에서도 <지금은맞고그때는틀리다>의 “시간에 갇혀 버린 것처럼 끊임없이 술을 마시던 모습”과 <아가씨>의 “공포와 고통이 쾌락과 해방감으로 변하며 뒤틀리는 육체와 표정”에 주목했다. 뉴욕타임스의 평론가 마놀라 다기스는 <지금은맞고그때는틀리다>에서 “김민희의 절묘한 뉘앙스 연기가 극의 중심에 있다.”면서 “홍상수 감독의 영화 속 내러티브 상에서의 중요한 포인트인 반복과 변주가 김민희의 명쾌한 표현력에 힘입어 비로소 아름다워진다”고 전했다.\r\n<br><br>\r\n또한, 리스트에 오른 몇몇 배우들의 경우에는 그와 오랫동안 작업한 감독이 직접 연기에 관한 짧은 소개를 맡았는데, 송강호 배우는 봉준호 감독이 직접 소개글을 썼다. 봉 감독은 송강호에 대해 “이창동 감독의 <초록물고기>에서 그를 처음 본 감독들 사이에 실제 깡패가 아니냐는 소문이 돌 정도로 리얼한 연기를 보여줬다”면서 “항상 새로운 면이 드러나는 사람이자, 끊임없이 자라는 캔버스 같은, 어마어마한 다이아몬드 광산 같은 배우”라고 찬사를 보냈다. 그러면서 송강호가 연기하는 인물들이 진정으로 특별해 보이는 이유는 평범한 일상적 연기를 “독특하고 흉내낼 수 없는 특유의 목소리로 실어 나르기 때문”이라고 했다.\r\n<br><br>\r\n선정된 25명의 배우 가운데 다니엘 데이 루이스(3위)와 이자벨 위페르(2위)를 누르고 1위에 선정된 배우는 덴젤 워싱턴이다. 그의 연기에 대해서는 “오랜 무대 경력을 지녔고 또 스포트라이트를 받는 스타로서 아주 섬세하고 예민한 장인, 스크린의 신같은 존재”라고 극찬했다. 송강호, 김민희와 함께 리스트에 포함된 아시아 배우는 중국의 배우 자오 타오(8위)를 포함해 총 3명이다. 또한 프랑스 배우 까트린 드뇌브(21위), 이탈리아 배우 토니 세르빌로(7위) 등 배우들의 국적과 활동범위를 제한하지 않고 선정했다. 그 밖에 아카데미 수상자인 마허샬라 알리(23위)와 멜리사 맥카시(22위), 윌렘 데포(19위), 마이클 B. 조던(15위), 시얼샤 로넌(10위), 니콜 키드먼(5위) 등이 선정됐다.', NULL, '', NULL, '', NULL, '', NULL, '', NULL, '', '2020-11-27', NULL),
	(7, '김진우(뉴미디어팀 기자)', '올해 전세계 넷플릭스 시청자들이 가장 많이 본 작품은?', 'news7-1.jpg', '넷플릭스 미니시리즈 <퀸스 갬빗>이 넷플릭스 미니시리즈 드라마 부문 최고시청률을 기록했다. 넷플릭스에 따르면, <퀸스 갬빗>은 "공개 후 4주 동안 전 세계 92개국에서 6천2백만 명의 회원“이 시청했다. 시청률 집계 방식과는 달리, 넷플릭스는 작품당 2분 이상 콘텐츠를 시청한 계정의 숫자를 시청률 기준으로 잡는다.\r\n<br><br>\r\n장르와 부문을 통틀어 넷플릭스 공개 후 첫 한 달 동안 가장 많은 회원이 시청한 콘텐츠는 넷플릭스 오리지널 시리즈 <더 위쳐> 시즌1(7천6백만 명)이며, 2위는 <종이의 집> 시즌4(6천5백만 명), 3위는 <타이거 킹>(6천4백만 명)이다. <퀸스 갬빗>은 4위를 기록했다. 이중 미니시리즈로 제작된 작품이 <타이거 킹>과 <퀸스 갬빗>이며, 다큐멘터리 작품인 <타이거 킹>을 제외하면 <퀸스 갬빗>이 미니시리즈 드라마 부문 중 최고시청률을 기록한 것.\r\n<br><br>\r\n넷플릭스 오리지널 시리즈 부사장 피터 프리드랜더는 <할리우드 리포터>와의 인터뷰를 통해 "스콧 프랭크 감독의 경이로운 연출과 안야 테일러 조이가 놀라운 캐릭터 연기 덕에 가능한 일이었다. 둘을 비롯해 작곡가, 제작 디자이너, 의상 디자이너 등 팀원들에게 축하의 말을 전한다"고 말했다.', 'news7-2.jpg', '<퀸스 갬빗>은 현재 평점 사이트 \'로튼 토마토\'에서 신선도(전문가 평점) 100%, 팝콘지수(관람객 평점) 96%라는 높은 평점을 기록하고 있으며 이외에도 \'메타크리틱\', \'IMDB\' 등 미국 영화 사이트에서 높은 점수를 유지하며 입소문을 타고 있다. 많은 북미 언론들은 <퀸스 갬빗>이 2021년 에미상 시상식에서 많은 트로피를 거머쥘 것으로 예상했다.\r\n<br><br>\r\n월터 테비스의 동명 소설을 드라마화한 <퀸스 갬빗>은 교통사고로 어머니를 잃고 고아가 된 베스(안야 테일러 조이)가 세계 최고의 체스 플레이어가 되는 과정을 그렸다. 총 7개의 에피소드로 구성된 드라마 속에는 여러 사건과 시련을 겪으며 변화하는 베스의 심리, 치열한 체스 게임 속 두뇌 싸움 등이 세밀하게 담겼다.', NULL, '', NULL, '', NULL, '', NULL, '', '2020-11-25', NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;

-- 테이블 moviedb.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `id` char(20) NOT NULL,
  `pwd` char(20) NOT NULL,
  `name` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `birthday` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `zipcode` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `details` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `genre` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `info` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 테이블 데이터 moviedb.user:~9 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `pwd`, `name`, `gender`, `birthday`, `email`, `zipcode`, `address`, `details`, `genre`, `info`) VALUES
	('aa', '1234', 'aa', '1', '12', 'gusdud7359@gmail.com', '03643', '서울특별시 서대문구 송죽길 19-3', '5432', '100001', 'ㅗㅓㅎ'),
	('admin', '1234', '관리자', '2', '201218', 'gusdud7359@gmail.com', '12345', '서울', 'ㅇ', '로코', 'ㅇ'),
	('apple', '1234', 'james', '2', '201231', 'gusdud7359@gmail.com', '03643', '서울특별시 서대문구 송죽길 19-3', '네네빌딩', '100000', NULL),
	('blake', '1234', '이순신', '2', '201228', 'gusdud7359@gmail.com', '06267', '서울특별시 강남구 강남대로 238', '네네빌딩', '100000', 'ㅇㅇㅇㅇ'),
	('user1', '1234', '홍길동', '2', '201222', 'gusdud7359@gmail.com', '12345', '서울', 'ㅇ', '호러', 'ㅇ'),
	('user2', '1234', 'Lilly', '2', '201125', 'gusdud7359@gmail.com', '06267', '서울특별시 강남구 강남대로 238', '네네빌딩', '100000', '반갑습니다'),
	('user3', '1234', '김길동', '1', '931208', 'kimbocah39@gmail.com', '22769', '인천광역시 서구 건지로 7', '네네빌딩', '111000', '안녕하세요'),
	('user4', 'uodWX0F9', '김유미', '2', '201125', 'gusdud7359@gmail.com', '22769', '인천광역시 서구 건지로 7', '아파트', '110000', NULL),
	('user6', '1234', 'james', '2', '201216', 'gusdud7359@gmail.com', '06267', '서울특별시 강남구 강남대로 238', '네네빌딩', '100000', NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
