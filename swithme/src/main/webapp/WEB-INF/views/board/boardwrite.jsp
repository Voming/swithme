<link href="<%=request.getContextPath()%>/resources/css/reset.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/core.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/layout.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/footer.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/resources/css/board/boardwrite.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="wrapper">
        <div class="wrap-header">
            <header>
                <div class="tn">
                    <!-- 최상단 네비(로고 및 회원가입, 로그인) -->
                    <div class="nav1-wrap">
                        <div class="logo-side">
                            <a href="#">
                                <img src="<%=request.getContextPath()%>/resources/images/logo.jpg" alt>
                            </a>
                        </div>
                        <div class="log">
                            <ul>
                                <li><a href="#">로그인</a></li>
                                <li><a href="#">회원가입</a></li>
                                <li><a href="#">마이페이지</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="bn">
                    <div class="nav2-wrap">
                        <ul>
                            <li><a href="#">나의기록</a></li>
                            <li><a href="/HTML/group_home.html" >그룹</a></li>
                            <li><a href="#">랭킹</a></li>
                            <li><a class="active" href="#">커뮤니티</a></li>
                            <li><a href="#">시험달력</a></li>
                        </ul>
                    </div>
                </div>
                <div class="hrline">
                    <hr>
                </div>
            </header>
        </div>
        
        <div class="wrap-body">
        	<div class="boardwrite">
        		게시글 작성
        	</div>
        	<form id="form-write" method="post" action="insert.no">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" placeholder="제목을 입력하시오." required></td>	
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="content" cols="80" rows="25" placeholder="내용을 입력하시오." required></textarea></td>
					</tr>		
				</table>
				
				<div class="btn">
					<div><button type="button" class="btn write">등록</button></div>
					<div><button type="button" class="btn esc">취소</button></div>
					<div><button type="button" class="btn board">목록</button></div>
				</div>
			</form>	    		
        </div>
	</div>

    <div class="wrap-footer">
        <footer>
            <div class="inner">
                <ul>
                    <li>
                        <div class="tf">
                            <p>스윗미</p>
                        </div>
                        <div class="to">
                            <p>정보</p>
                            <p>문의하기</p>
                        </div>
                    </li>
                    <li>
                        <div class="tf">
                            <p>커뮤니티</p>
                        </div>
                        <div class="to">
                            <p>깃허브</p>
                            <p>인스타그램</p>
                        </div>
                    </li>
                    <li>
                        <div class="tf">
                            <p>제작자</p>
                        </div>
                        <div class="to">
                            <p>김보민</p>
                            <p>김은진</p>
                            <p>송채원</p>
                            <p>오예인</p>
                        </div>
                    </li>
                    <li>
                        <div class="tf">
                            <p>법적고지</p>
                        </div>
                        <div class="to">
                            <p>개인정보 처리방침</p>
                            <p>운영정책</p>
                        </div>
                    </li>
                </ul>
            </div>
        </footer>
    </div>
</body>
</html>