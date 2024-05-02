<jsp:include page="/WEB-INF/views/common/links_file.jsp"/>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<!-- group_home-->
<link href="${pageContext.request.contextPath}/resources/css/group/grouphome.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/grouphome_list.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/group/groupmodal.css" rel="stylesheet">

<!-- carousel -->
<link href="${pageContext.request.contextPath}/resources/owlcarousel2-2.3.4/carousel_assets/owl.carousel.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/owlcarousel2-2.3.4/carousel_assets/owl.theme.default.css" rel="stylesheet">

<meta charset="UTF-8">
<title>SWITH.ME</title>
<!-- jQuery 선언 -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<jsp:include page="/WEB-INF/views/common/common_function.jsp"/>
</head>
<body>
	<script>
		$(loadedHandler);
		let morecnt = 0;
		
		function loadedHandler() {
			$(getGroupMylist);

			//그룹 탭
			// $('.prd-tab-content > div').hide();
            $('.group-tab-nav a').click(function () {
                $('.group-tab-content > div').hide().filter(this.hash).fadeIn();
                $('.group-tab-nav a').removeClass('active');
                $(this).addClass('active');
                return false;
            }).filter(':eq(0)').click();
            
        	
			$(".btn.find").on("click", btnFindClickHandler);
			$(".modal_btn").on("click", btnOpenClickHandler);
			$(".close_btn").on("click", btnCloseClickHandler);
			$(".btn.more").on("click", btnMoreClickHandler);
			$(".modal").hide();	
        }
		
		//더보기
		function btnMoreClickHandler(){
			morecnt += 1;
			
			$.ajax( { 
				url : "${pageContext.request.contextPath}/group/more.ajax"
				, method : "post"
				,data : { 
					more : morecnt
				}
				, dataType : 'json'
				, success : function(result){ 
					if(result != null){
						/* console.log(result); */
					 	displayGroupMorelist(result); 
					}
				}
				,error : ajaxErrorHandler
			} ); 
		}
		
		//더보기 리스트 뿌리기
		function displayGroupMorelist(datalist){
			var htmlVal = '';
			for(var idx in datalist){
				var moreDto = datalist[idx];
				htmlVal+= `
				<li>
					<div class="modal_btn">
						<img class="img_g" src="\${moreDto.sgroupImgPath}" alt="그룹 사진">
						<div class="tag">
							<p style="background-color: black; padding: 3px; font-size: var(--font5);">공개</p>
						</div>
						<div class="description">
							<p class="for-modal" style="display: none;">\${moreDto.sgroupId}</p>
							<p class="name"
								style="font-size: var(--font4); font-weight: bold;">\${moreDto.sgroupName}</p>
							<p class="name-sub" style="font-size: var(--font5);">\${moreDto.sgroupEx}</p>
						</div>
					</div>
				</li>
				`;
			}
			
			$(".group-box.t1").html(htmlVal);
			
			/*if(datalist.length > checkcnt){
				console.log(checkcnt);
				$(".btn.more").hide();
			}*/
			
			$(".modal_btn").on("click", btnOpenClickHandler);
			$(".close_btn").on("click", btnCloseClickHandler);
		}
		
		//나의 리스트 가져오기
		function getGroupMylist(){
			$.ajax( { 
				url : "${pageContext.request.contextPath}/group/mylist.ajax"
				, method : "post"
				, dataType : 'json'
				, success : function(result){ 
					if(result != null){
						displayGroupMylist(result);
					}
				}
				,error : ajaxErrorHandler
			} ); 
		}
		//나의 리스트 출력
		function displayGroupMylist(datalist){
			var htmlVal = '';
			for(var idx in datalist){
				var myDto = datalist[idx];
				htmlVal+= `
					<div class="item">
						<button type="button" onclick="location.href='${pageContext.request.contextPath}/group/info?groupId=\${myDto.sgroupId}'">
							<img src="\${myDto.sgroupImgPath}">
						</button>
						<figcaption>\${myDto.sgroupName }</figcaption>
					</div>
				`;
			}
			$(".owl-carousel").html(htmlVal);
			
			//캐러셀 호출
			$('.wrap-group .owl-carousel').owlCarousel({
				items : 3,
				margin : 10,
				loop : true,
				dots : true,
				autoplay: true,
				autoplayTimeout : 3000,
				autoplayHoverPause : true
			});
		}
		
		
		//모달 열기
		function btnOpenClickHandler() {
			var m_groupid = $(this).find(".for-modal").text().trim();
			var m_open = $(this).find("div.tag > p").text().trim();
			var m_img = $(this).find(".img_g").attr("src").trim();
			var m_name = $(this).find(".description>.name").text().trim();
			var m_name_sub = $(this).find(".description>.name-sub").text().trim();
			
			//만약 이미 가입한 그룹이라면 그룹 정보 페이지로 이동
			$.ajax( { 
				url : "${pageContext.request.contextPath}/group/join/check.ajax"
				,method : "post"
				,data : { 
					m_group_id : m_groupid
				}
				,success : function(result){ 
					if(result > 0){
						alert("해당 그룹으로 이동합니다");
						$(".modal").hide();	
						location.href="${pageContext.request.contextPath}/group/info?groupId=" + m_groupid;
					} else{
						var htmlMval= '';
						htmlMval += `
							<form>
							<img class="modal_img" src="\${m_img}" alt="그룹 사진">
							<div class="modal_description">
								<p class="m_group_id" style="display:none;">\${m_groupid}</p>
								<p class="name" style="font-size: var(--font1); font-weight: bold;">\${m_name}</p>
								<p class="m_open" style="font-size: var(--font3); font-weight: bold;">\${m_open}</p>
								<p class="name-sub" style="font-size: var(--font3);">\${m_name_sub}</p> 
						`;
						if(m_open == "비공개"){
							htmlMval += `
								<input type="text" name="m_pwd" placeholder="비밀번호를 입력하세요">
							`;
						}
						htmlMval += `
							</div>
							<button type="button" class="close_btn">취소</button>
							<button type="button" class="join_btn">가입하기</button>
						</form>
						`;
						
						$(".modal > .modal_popup > div").html(htmlMval);
						
						$(".modal").show();
						$(".close_btn").on("click", btnCloseClickHandler);
						$(".join_btn").on("click", btnJoinClickHandler);
					}
				}
				,error : ajaxErrorHandler
			} ); 
		}
		
		//그룹 가입하기
		function btnJoinClickHandler() {
			var m_groupid = $(this).parent().find(".m_group_id").text();
			$.ajax( { 
				url : "${pageContext.request.contextPath}/group/join.ajax"
				,method : "post"
				,data : { 
					m_group_id : $(this).parent().find(".m_group_id").text(),
					m_pwd : $(this).parent().find("input[name=m_pwd]").val()
				}
				,success : function(result){ 
					if(result > 0){
						alert("그룹 가입 성공!! 그룹 입장합니다.");
						$(".modal").hide();	
						location.href="${pageContext.request.contextPath}/group/info?groupId=" + m_groupid;
					} else if(result == "-1"){
						alert("비밀번호가 틀렸습니다");
					} else if(result == "-2"){
						alert("죄송합니다. 그룹 정원이 차있으므로 가입이 불가합니다.");
					} else if(result == "-3"){
						alert("가입 불가! 이미 가입한 그룹이 5개입니다.");
					}
				}
				,error : ajaxErrorHandler
			} ); 
		}
		
		//모달 닫기
		function btnCloseClickHandler() {
			/* console.log('close clicked!'); */
			$(".modal").hide();	
		}
		
		//그룹 검색
		function btnFindClickHandler() {
			if ($("[name=find]").val().trim().length == 0) {
				alert("빈문자열만 입력할 수 없습니다. 검색할 그룹명을 작성해주세요.");
				return;
			}
			
			$(".btn.more").hide();

			$.ajax({
				url:"${pageContext.request.contextPath }/group/find.ajax"
				, method : "post"
				, data :  $("#frm-find").serialize()
				, dataType : 'json'
				, success: function(result){
						displayFindWrap(result);
				}
				,error : ajaxErrorHandler
			});			
		}
		
		//그룹 검색 결과
		function displayFindWrap(datalist){
			var htmlVal = '';
			for(var idx in datalist){
				var findDto = datalist[idx];
				htmlVal+= `
					<li>
						<div class="modal_btn">
							<img class="img_g" src="\${findDto.sgroupImgPath}" alt="그룹 사진">
							<div class="tag">
								<p style="background-color: black; padding: 3px; font-size: var(--font5);">`;
				if(findDto.sgroupOpen == '0'){  //공개 비공개 판별
					htmlVal+= `공개`;}
				else{ htmlVal+= `비공개`;}
				htmlVal+= `	</p>
							</div>
						<div class="description">
							<p class="for-modal" style="display:none;">\${findDto.sgroupId}</p>
							<p class="name" style="font-size: var(--font4); font-weight: bold;">\${findDto.sgroupName}</p> 
							<p class="name-sub" style="font-size: var(--font5);">\${findDto.sgroupEx}</p>
					</div>
				</div>
			</li>`;

			}
			$(".group-box").html(htmlVal);
			$(".all-txt").hide();
			$(".group-tab-nav").hide();
			$(".modal_btn").on("click", btnOpenClickHandler);
		}
	
		
	</script>
	<div class="wrapper">
		<div class="wrap-header">
			<header>
				<%@include file="/WEB-INF/views/basic/header.jsp"%>
				<div class="bn">
					<div class="nav2-wrap">
						<ul>
							<li><a href="${pageContext.request.contextPath}/myrecord">나의기록</a></li>
							<li><a class="active"
								href="${pageContext.request.contextPath}/group">그룹</a></li>
							<li><a href="${pageContext.request.contextPath}/ranking">랭킹</a></li>
							<li><a href="${pageContext.request.contextPath}/board">커뮤니티</a></li>
							<li><a href="${pageContext.request.contextPath}/test">시험달력</a></li>
						</ul>
					</div>
				</div>
				<div class="hrline">
					<hr>
				</div>
			</header>
		</div>
		<!--모달 팝업-->
		<div class="modal">
			<div class="modal_popup">
				<div></div>
			</div>
		</div>
		<div class="wrap-body">
			<div class="wrap-group">
				<div class="wrap-my">
					<div class="txt-my">
						<p>내 그룹</p>
					</div>
					<div class="owl-carousel">
						<!-- 나의 그룹 리스트 ajax -->
					</div>
				</div>
			</div>
			<div class="wrap-search">
				<div>
					<p>그룹찾기</p>
				</div>
				<div>
					<div class="search">
						<form id="frm-find">
							<input type="text" name="find"
								placeholder="&nbsp;찾고 싶은 그룹 명을 입력하세요">
							<button type="button" class="btn find">
								<img class="search-btn"
									src="${pageContext.request.contextPath}/resources/images/find.png"
									alt="찾기">
							</button>
						</form>
					</div>
				</div>
				<div class="move-make">
					<div>
						<p>원하는 그룹이 없다면?</p>
					</div>
					<div>
						<button type="button" class="btn make"
							onclick="location.href='${pageContext.request.contextPath}/group/create'">그룹
							생성하러 가기</button>
					</div>
				</div>
			</div>
			<div class="wrap-openlist">
				<div class="tab-body">
					<p class="all-txt">전체그룹</p>
					<ul class="group-tab-nav">
						<li><a href="#tab01">공개 그룹</a></li>
						<li><a href="#tab02">추천 그룹</a></li>
					</ul>
					<div class="group-tab-content">
						<div id="tab01">
							<ul class="group-box t1">
								<c:if test="${not empty OpenGrouplist }">
									<c:forEach items="${OpenGrouplist}" var="groupDto">
										<li>
											<div class="modal_btn">
												<img class="img_g" src="${groupDto.sgroupImgPath}"
													alt="그룹 사진">
												<div class="tag">
													<p
														style="background-color: black; padding: 3px; font-size: var(--font5);">
														<c:if test="${groupDto.sgroupOpen == '0'}">공개</c:if>
														<c:if test="${groupDto.sgroupOpen == '1'}">비공개</c:if>
													</p>
												</div>
												<div class="description">
													<p class="for-modal" style="display: none;">${groupDto.sgroupId}</p>
													<p class="name"
														style="font-size: var(--font4); font-weight: bold;">${groupDto.sgroupName}</p>
													<p class="name-sub" style="font-size: var(--font5);">${groupDto.sgroupEx}</p>
												</div>
											</div>
										</li>
									</c:forEach>
								</c:if>
							</ul>
							<c:if test="${OpenGrouplist.size() > 4}">
								<div class="wrap-countb">
									<button class="btn more">더보기</button>
								</div>
							</c:if>
						</div>
						<div id="tab02">
							<ul class="group-box">
								<c:if test="${not empty RandGrouplist }">
									<c:forEach items="${RandGrouplist}" var="randDto">
										<li>
											<div class=modal_btn>
												<img class="btn-open-modal img_g" src="${randDto.sgroupImgPath}" alt="그룹 사진">
												<div class="tag">
													<p
														style="background-color: black; padding: 3px; font-size: var(--font5);">
														<c:if test="${randDto.sgroupOpen == '0'}">공개</c:if>
														<c:if test="${randDto.sgroupOpen == '1'}">비공개</c:if>
													</p>
												</div>
												<div class="description">
													<p class="for-modal" style="display: none;">${randDto.sgroupId}</p>
													<p class="name"
														style="font-size: var(--font4); font-weight: bold;">${randDto.sgroupName}</p>
													<p class="name-sub" style="font-size: var(--font5);">${randDto.sgroupEx}</p>
												</div>
											</div>
										</li>
									</c:forEach>
									
								</c:if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="wrap-footer">
		<%@include file="/WEB-INF/views/basic/footer.jsp"%>
	</div>
	<!-- carousel -->
<script src="${pageContext.request.contextPath}/resources/owlcarousel2-2.3.4/carousel_js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/owlcarousel2-2.3.4/carousel_js/owl.autoplay.js"></script>
<script	src="${pageContext.request.contextPath}/resources/owlcarousel2-2.3.4/carousel_js/owl.navigation.js"></script>
</body>
</html>