<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   function checkForm() {
      if (!document.newMember.id.value) {
         alert("아이디를 입력하세요.");
         return false;
      }

      if (!document.newMember.password.value) {
         alert("비밀번호를 입력하세요.");
         return false;
      }

      if (document.newMember.password.value != document.newMember.password_confirm.value) {
         alert("비밀번호를 동일하게 입력하세요.");
         return false;
      }
   }

   
   function SetEmailTail(emailValue) {
        var email = document.all("email")    // 사용자 입력
        var emailTail = document.all("email2") // Select box
        
        if ( emailValue == "notSelected" )
         return;
        else if ( emailValue == "etc" ) {
         emailTail.readOnly = false;
         emailTail.value = "";
         emailTail.focus();
        } else {
         emailTail.readOnly = true;
         emailTail.value = emailValue;
         
        }
       }
    function setThumbnail(event) {
        var reader = new FileReader();

        reader.onload = function(event) {
          var img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          document.querySelector("div#image_container").appendChild(img);
        };

        reader.readAsDataURL(event.target.files[0] );
      }
   
   
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
<title>회원수정</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
   <%@ include file="header.jsp"%>
   <%@ include file="hostdbconn.jsp"%>
   <%
      
       
      String sql = "select * from hostuser where userID = ? ";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,userID);
      rs = pstmt.executeQuery();
      if (rs.next()) {
             
   %>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">호스트회원 수정</h1>
      </div>
   </div>
   <div class="container">
      <form name="newMember" class="form-horizontal"  action="addMemberUpdateProc.jsp" method="post" enctype ="multipart/form-data" >
         <div class="form-group  row">
            <label class="col-sm-2 ">아이디</label>
            <div class="col-sm-3">
               <input name="id" type="text" class="form-control" placeholder="id" value="<%=rs.getString("userID")%>" readonly >
            </div>
         </div>  
   
         <div class="form-group  row">
            <label class="col-sm-2 ">국가</label>
            <div class="col-sm-3">
               <input type="text" name="country" id="my-language" class="form-control mr-sm-4" size="30" placeholder="호스트 지역" value="<%=rs.getString("hostCountry")%>">
            </div>
         </div>
         
         <div class="form-group  row">
            <label class="col-sm-2 ">업무 내용</label>
            <div class="col-sm-7" >
            <input type="checkbox" name ="work" value="봉사활동"/><label class="col-3">봉사활동</label>
            <input type="checkbox" name ="work" value="예술 프로젝트"/><label class="col-3">예술 프로젝트</label>
            <input type="checkbox" name ="work" value="통역"/><label class="col-3">통역</label><br/>
            <input type="checkbox" name ="work" value="환경 보호활동"/><label class="col-3">환경 보호활동</label>
            <input type="checkbox" name ="work" value="노약자 도움활동"/><label class="col-3">노약자 도움활동</label>
            <input type="checkbox" name ="work" value="교육"/><label class="col-3">교육</label><br/>
            <input type="checkbox" name ="work" value="동물관리"/><label class="col-3">동물관리</label>
            <input type="checkbox" name ="work" value="농사"/><label class="col-3">농사</label>
            <input type="checkbox" name ="work" value="아기 돌보기"/><label class="col-3">아기 돌보기</label><br/>
            <input type="checkbox" name ="work" value="요리"/><label class="col-3">요리</label>
            <input type="checkbox" name ="work" value="컴퓨터"/><label class="col-3">컴퓨터</label>
            <input type="checkbox" name ="work" value="공예"/><label class="col-3">공예</label><br/>
            </div>
         </div>

         <div class="form-group  row">
            <label class="col-sm-2 ">한줄 소개</label>
            <div class="col-sm-5">
               <textarea class="form-control" id="oneintroduction" name="oneintroduction"><%=rs.getString("hostoneIntroduction")%></textarea> 
            </div>
         </div>

         <div class="form-group  row">
            <label class="col-sm-2 ">상세 소개</label>
            <div class="col-sm-5">
               <textarea class="form-control" id="introduction" name="introduction" ><%=rs.getString("hostIntroduction")%></textarea> 
      
            </div>
         </div>
         <div class="form-group  row">
            <label class="col-sm-2 ">사진 등록</label>
            <div class="col-sm-5 ">
                <input  type="file" name="filename" id="file" accept="image/*" onchange="setThumbnail(event);" class="form-control"  value="" multiple/>
                <%=rs.getString("hostFilename")%>
                  <div id="image_container"></div>
             </div>
         </div>
             
         
         <div class="form-group  row">
            <div class="col-sm-offset-2 col-sm-10 ">
               <input onclick="return checkForm()" type="submit" class="btn btn-primary " value="수정 " > 
               <input type="reset" class="btn btn-primary " value="처음으로" onclick="reset()" >
            </div>
         </div>
      </form>
   </div>
 
    
         
         
      <%
         
      }
      
      if (rs != null)
         rs.close();
      if (pstmt != null)
         pstmt.close();
      if (conn != null)
         conn.close();
   %>
   
   
    
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>