<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("idKey");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css" type="text/css">
<style type="text/css">
	#registForm{
		width:100%;
	}
  
   h2{
   	 margin-top:50px;
      text-align: center;
   }
   table{
   width: 700px;
   margin:0 auto;
   padding-bottom:170px;
   border-top:1px solid #999;   
   }
   
   tr, td{
    padding: 12px;
	border-bottom:1px solid #999;
   }
      
   .td_left{
      width: 80px;
      background-color:#f3f3f3;
      border-right:1px solid #999;
   }
   .td_right{
      width: 270px;

   }
   #commandCell{
      text-align: center;
   }
   
   #commandCell input{
   	margin:5px;
	padding: 8px;
	border:1px solid #555;
	background-color:#333;
	font-size:14px;
	font-weight:bold;
	color:white;
   }
</style>
</head>
<body>
 <header id="header">
              <h1 class="title" onclick="javascript:location.href='main/main.jsp'">MOVIEMOA</h1>
            <form method="post" action="main/search.jsp" class="login">
            
             <%
             String ids = request.getParameter("id");
             if (id == null) {%>
             <button type="button" class="login" onclick="javascript:location.href='login/login.jsp'">Login</button>	
              <button type="button" class="login" onclick="javascript:location.href='login/agree.jsp'">Sign in</button>
                 
               <%}else if(id.equals("admin")){%>  
                <button type="button" class="login" onclick="javascript:location.href='adminPage.jsp'">관리자 화면</button>
                 <button type="button" class="login" onclick="javascript:location.href='login/logout.jsp'">Logout</button>
              <%} else if(id != null) {%>
              <span id="hi"><%=id %> 님, 반갑습니다.</span>
                 <button type="button" class="login" onclick="javascript:location.href='login/logout.jsp'">Logout</button><%} %>
            
	              <input type="text" name="search"  id="search" class="login" placeholder="Search...">
	              <input type="submit" id="searchBtn">
              </form>
                  
             <nav id="nav">
                  <span class="btn" onclick="javascript:location.href='movieList.mo'">MovieInfo</span>
                  <span class="btn" onclick="javascript:location.href='subpage/boardList.bo?boardtype=BOARDALL'">MovieTalk</span>
                  <span class="btn" onclick="javascript:location.href='newsList.mo'">MovieNEWS</span>
                  <span class="btn" onclick="javascript:location.href='main/loc.jsp'">Theater</span> 
              </nav>
            </header>  
          
          
<section id = "registForm">
  
      <h2>최신영화등록</h2>
   
      <form action="movieRegist.mo" method="post" name = "writeForm" enctype="multipart/form-data">
      
   <table>
   
   <tr>
      <td class = "td_left">
         <label for = "m_title">영화 제목  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_title" id ="m_title" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_date">개봉일  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_date" id ="m_date" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_title_eng">영화 영어 제목  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_title_eng" id ="m_title_eng" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_year">연도  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_year" id ="m_year" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_nation">국가 </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_nation" id ="m_nation" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_age">관람가  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_age" id ="m_age" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_genre">장르  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_genre" id ="m_genre" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_time">상영시간  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_time" id ="m_time" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_total">누적 관객수  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_total" id ="m_total" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_director">감독  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_director" id ="m_director" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_actor">출연  </label>
      </td>
      <td class = "td_right">
         <input type = "text" name = "m_actor" id ="m_actor" required="required"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_summary1">줄거리1  </label>
      </td>
      <td class = "td_right">
         <textarea name="m_summary1" id="m_summary1" rows="8" cols="40" wrap="off"></textarea>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_summary2">줄거리2  </label>
      </td>
      <td class = "td_right">
         <textarea name="m_summary2" id="m_summary2" rows="8" cols="40" wrap="off"></textarea>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_summary3">줄거리3  </label>
      </td>
      <td class = "td_right">
         <textarea name="m_summary3" id="m_summary3" rows="5" cols="40" wrap="off"></textarea>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_poster">영화 포스터  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_poster" id ="m_poster"/>
      </td>
   </tr>
   
    <tr>
      <td class = "td_left">
         <label for = "m_banner">영화 배너  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_banner" id ="m_banner"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide1">슬라이드1  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide1" id ="m_slide1"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide2">슬라이드2  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide2" id ="m_slide2"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide3">슬라이드3  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide3" id ="m_slide3"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide4">슬라이드4  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide4" id ="m_slide4"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide5">슬라이드5  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide5" id ="m_slide5"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_slide6">슬라이드6  </label>
      </td>
      <td class = "td_right">
         <input type = "file" name = "m_slide6" id ="m_slide6"/>
      </td>
   </tr>
   
   <tr>
      <td class = "td_left">
         <label for = "m_video">공식 예고편  </label>
      </td>
      <td class = "td_right">
         <textarea name="m_video" id="m_video" rows="3" cols="40" wrap="off"></textarea>
      </td>
   </tr>
   
   <tr>
      <td colspan="2" id = "commandCell"> 
         <input type = "submit" value = "최신영화등록"/>      
         <input type = "reset" value = "다시작성"/>      
         <input type = "button" value = "최신영화목록보기" onClick="window.location.href='movieList.mo'"/>      
      </td>
   </tr>   
   </table>
   </form>
   
</section>
		
			<div id="footer">
	             <article>
	             	 copyright@<br><br><hr><br>MOVIE주식회사: 인천광역시 서구 서곶로 284 새터빌딩 4층 연희직업전문학교<p/>대표전화: 032-555-1111&nbsp;/&nbsp;Email: movie@gmail.com 
	             </article>      
	        </div>
</body>
</html>