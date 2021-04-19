<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>

<html>
<head>
<meta charset="UTF-8">
<title>여행의 일락</title>
<!-- 부트스트랩 CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
</head>
<body>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
$(function() {
	var languages = [
		"가나", "가봉", "가이아나", "감비아", "과테말라", "그레나다", "그리스", "기니", "기니비사우", "나고르노카라바흐 공화국", "나미비아", "나우루", "나이지리아", "남수단",
		"남아프리카 공화국", "남오세티야", "네덜란드", "네팔", "노르웨이", "뉴질랜드", "니제르", "니카라과", "대한민국", "덴마크", "도미니카", "도미니카 공화국", "독일", "동티모르",
		"라오스", "라이베리아", "라트비아", "러시아", "레바논", "레소토", "루마니아", "룩셈부르크", "르완다", "리비아", "리투아니아", "리히텐슈타인", "마다가스카르", "마셜 제도",
		"마케도니아 공화국", "말라위", "말레이시아", "말리", "멕시코", "모나코", "모로코", "모리셔스", "모리타니", "모잠비크", "몬테네그로", "몰도바", "몰디브", "몰타", "몽골", "미국",
		"미얀마", "미크로네시아 연방", "바누아투", "바레인", "바베이도스", "바티칸 시국", "바하마", "방글라데시", "베냉", "베네수엘라", "베트남", "벨기에", "벨라루스", "벨리즈",
		"보스니아 헤르체고비나", "보츠와나", "볼리비아", "부룬디", "부르키나파소", "부탄", "북키프로스", "불가리아", "브라질", "브루나이", "사모아", "사우디아라비아", "사하라 아랍 민주 공화국",
		"산마리노", "상투메 프린시페", "세네갈", "세르비아", "세이셸", "세인트루시아", "세인트빈센트 그레나딘", "세인트키츠 네비스", "소말리아", "소말릴란드", "솔로몬 제도", "수단", "수리남",
		"스리랑카", "스와질란드", "스웨덴", "스위스", "스페인", "슬로바키아", "슬로베니아", "시리아", "시에라리온", "싱가포르", "아랍에미리트", "아르메니아", "아르헨티나", "아이슬란드", "아이티",
		"아일랜드", "아제르바이잔", "아프가니스탄", "안도라", "알바니아", "알제리", "압하스", "앙골라", "앤티가 바부다", "에리트레아니아", "에콰도르", "에티오피아", "엘살바도르", "영국", "예멘",
		"오만", "오스트레일리아", "오스트리아", "온두라스", "요르단", "우간다", "우루과이", "우즈베키스탄", "우크라이나", "이라크", "이란", "이스라엘", "이집트", "이탈리아", "인도", "인도네시아",
		"일본", "자메이카", "잠비아", "적도 기니", "조선민주주의인민공화국", "조지아", "중앙아프리카 공화국", "중화민국", "중화인민공화국", "지부티", "짐바브웨", "차드", "체코", "칠레", "카메룬",
		"카보베르데", "카자흐스탄", "카타르", "캄보디아", "캐나다", "케냐", "코모로", "코소보 공화국", "코스타리카", "코트디부아르", "콜롬비아", "콩고 공화국", "콩고 민주 공화국", "쿠바", "쿠웨이트",
		"크로아티아", "키르기스스탄", "키리바시", "키프로스", "타지키스탄", "탄자니아", "태국", "터키", "토고", "통가", "투르크메니스탄", "투발루", "튀니지", "트란스니스트리아", "트리니다드 토바고",
		"파나마", "파라과이", "파키스탄", "파푸아뉴기니", "팔라우", "팔레스타인", "페루", "포르투갈", "폴란드", "프랑스", "피지", "핀란드", "필리핀", "헝가리"
	];

	$( "#my-language" ).autocomplete({
		source: languages
	});
});
</script>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-color: #d9e5ff;">
			<form action="main.jsp" method="post" style="margin:0 auto;">
	     <input type="text" name="search" style="width:300px;" id="my-language" class="form-control mr-sm-4" size="30" placeholder="호스트 또는 지역">
	     <input type="submit" class="btn btn-outline-light" value="검색" style="margin-top: 10px; margin-left: 120px;">
	        </form>
	</nav>
    
              

              
         


<!-- 부트스트랩 JS (1.제이쿼리, 2.번들) -->
  <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>