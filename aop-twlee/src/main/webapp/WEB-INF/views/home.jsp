<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<html>
<head>
  <meta charset="UTF-8">
<style>
    /* FROM HTTP://WWW.GETBOOTSTRAP.COM
     * Glyphicons
     *
     * Special styles for displaying the icons and their classes in the docs.
     */

    .bs-glyphicons {
      padding-left: 0;
      padding-bottom: 1px;
      margin-bottom: 20px;
      list-style: none;
      overflow: hidden;
      
    }

    .bs-glyphicons li {
      float: left;
      width: 25%;
      height: 115px;
      padding: 10px;
      margin: 0 -1px -1px 0;
      font-size: 12px;
      line-height: 1.4;
      text-align: center;
      border: 1px solid #ddd;
    }

    .bs-glyphicons .glyphicon {
      margin-top: 5px;
      margin-bottom: 10px;
      font-size: 24px;
      color: black;
    }

    .bs-glyphicons .glyphicon-class {
      display: block;
      text-align: center;
      word-wrap: break-word; /* Help out IE10+ with class names */
      color: black;
    }

    .bs-glyphicons li:hover {
      background-color: rgba(86, 61, 124, .1);
    }

    @media (min-width: 768px) {
      .bs-glyphicons li {
        width: 25.09%;
      }
    }
  </style>


</head>
<!-- ADD THE CLASS layout-top-nav TO REMOVE THE SIDEBAR. -->
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">
<!-- Header.jsp -->
  <%@include file="include/header.jsp"%>
	<!-- /.Header.jsp -->
	
  <!-- Full Width Column -->
  <div class="content-wrapper">
    <div class="container">
      <!-- Content Header (Page header) -->
      <!-- Main content -->
      <section class="content">
      <!-- START ACCORDION & CAROUSEL
      <h2 class="page-header">Bootstrap Accordion & Carousel</h2>
		-->
	      <div class="row">
	        <!-- /.col -->
	        <div class="col-md-12">
	          <div class="box box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title">Event</h3>
	              <a href="/myweb/BoardList?boardFlag=eve"><span class="pull-right"> more</span></a>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	                <ol class="carousel-indicators">
	                  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	                  <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
	                  <li data-target="#carousel-example-generic" data-slide-to="2" class=""></li>
	                </ol>
	                <div class="carousel-inner">
	                  <div class="item active">
	                    <img src="http://placehold.it/1090x300/39CCCC/ffffff&text=Food" alt="First slide">
	
	                    <div class="carousel-caption">
	                      First Slide
	                    </div>
	                  </div>
	                  <div class="item">
	                    <img src="http://placehold.it/1090x300/3c8dbc/ffffff&text=Life" alt="Second slide">
	
	                    <div class="carousel-caption">
	                      Second Slide
	                    </div>
	                  </div>
	                  <div class="item">
	                    <img src="http://placehold.it/1090x300/f39c12/ffffff&text=Balence" alt="Third slide">
	
	                    <div class="carousel-caption">
	                      Third Slide
	                    </div>
	                  </div>
	                </div>
	                <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
	                  <span class="fa fa-angle-left"></span>
	                </a>
	                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
	                  <span class="fa fa-angle-right"></span>
	                </a>
	              </div>
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.col hidden-sm col-md-2-->
	        
	        <!-- Notic Form -->
	        <div class="col-md-8">
	          <div class="box box-solid">
	            <div class="box-header with-border">
	              <h3 class="box-title">Notice</h3>
	              <a href="/myweb/BoardList?boardFlag=not"><span class="pull-right"> more</span></a>
	            </div>
	            <!-- /.box-header -->
	            <div class="box-body">
	              <table id="example2" class="table table-bordered table-hover">
					<thead>
			            <tr>
			                <th>No</th>
			                <th>제목</th>
			                <th>작성자</th>
			            	<th>작성 일자</th>
			        	</tr>
			        </thead>
			            <tbody>
			            <!-- Memory 출력 -->
						<c:choose>
							<c:when test="${fn:length(notice) > 0}">
						    	<c:forEach items="${notice}" var="notice" varStatus="rowcnt">
						        	<tr>
						            	<td>${notice.boardIdx}</td>
						                <td>${notice.boardTitle}</td>
						                <td>${notice.writer}</td>
						                <td>${notice.writeDate}</td>
						            </tr>
						        </c:forEach>
						    </c:when>
							<c:otherwise>
								<tr>
									<td colspan="6">조회된 결과가 없습니다.</td>
					  			</tr>
							</c:otherwise>
						</c:choose>
				        </tbody>
					</table>
	            </div>
	            <!-- /.box-body -->
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.Notic Form -->
	        
	        <!-- Login Form -->
	        <div class="col-md-4">
	          <div class="box box-solid">
	          	<!-- 로그인 완료시 -->
	          	<sec:authorize access="isAuthenticated()">
		          	<div class="box-header with-border">
		            	<h3 class="box-title">Welcome to FLB</h3>
		            </div>   	
		            <div class="box-body">
		            	<sec:authentication property="principal.username"/> 님 반갑습니다.
		            </div>

		            <div class="box-footer">
			            <form action="${pageContext.request.contextPath}/logout" method="POST">
				            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				            <div class="pull-right">	
				            	<input class="btn btn-default btn-flat" type="submit" value="Sign out" /> 
				            </div>
			            </form>
		            </div>

	            </sec:authorize>
	            
	            <!-- 로그인이 안돼어있을때 -->
	            <sec:authorize access="isAnonymous()">
		            <div class="box-header with-border">
		              <h3 class="box-title">please check login</h3>
		            </div>
		            <!-- /.box-header -->
		            <div class="box-body">
		            	<a href="/myweb/loginPage">
		              		<button type="button" class="btn btn-block btn-warning btn-flat">Login</button>
		              	</a>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer">
			            <ul class="list-inline">
			            	<li><a href="#" class="link-black text-sm">아이디/비밀번호 찾기</a></li>
			            	<li class="pull-right"><a href="/myweb/registerPage" class="link-black text-sm">회원가입</a></li>
			            </ul>
		            </div>
	            </sec:authorize>
	          </div>
	          <!-- /.box -->
	        </div>
	        <!-- /.Login Form -->
	        
	        <div class="col-xs-12">
	          <div class="box">
	          <!-- 
	            <ul class="nav nav-tabs">
	              <li class="active"><a href="#glyphicons" data-toggle="tab">Glyphicons</a></li>
	              <li><a href="#fa-icons" data-toggle="tab">Font Awesome</a></li>
	            </ul>
	           --> 
	            <div class="box-body">
	 
	              <!-- glyphicons-->
	              <div class="tab-pane" id="glyphicons">
	                <ul class="bs-glyphicons">
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=han">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">한식</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=bun">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">분식</span>
	                    </a>
	                  </li>
	                  <li>
	                  <a href="/myweb/StoreList?storeCategory=caf">
	                   		<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">카페 디저트</span>
	                    </a>
	                  </li>
	                  <li>
	                  <a href="/myweb/StoreList?storeCategory=jpn">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">돈까스 회 일식</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=chi">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">치킨</span>
	                    </a>
	                  </li>
	                  <li>
		                <a href="/myweb/StoreList?storeCategory=piz">
		                	<span class="glyphicon glyphicon-picture"></span>
		                	<span class="glyphicon-class">피자</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=cha">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">중국집</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=jog">
	                    	<span class="glyphicon glyphicon-picture"></span>
	                    	<span class="glyphicon-class">족발 보쌈</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=yas">
		                    <span class="glyphicon glyphicon-picture"></span>
		                    <span class="glyphicon-class">야식</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=zzi">
		                    <span class="glyphicon glyphicon-picture"></span>
		                    <span class="glyphicon-class">찜 탕</span>
	                    </a>
	                  </li>
	                  <li>
	                  	<a href="/myweb/StoreList?storeCategory=dos">
		                    <span class="glyphicon glyphicon-picture"></span>
		                    <span class="glyphicon-class">도시락</span>
	                    </a>
	                  </li>
	                  <li>
		                <a href="/myweb/StoreList?storeCategory=fas">
		                	<span class="glyphicon glyphicon-picture"></span>
		                    <span class="glyphicon-class">패스트푸드</span>
	                    </a>
	                  </li>
	 				
	                </ul>
	              </div>
	              <!-- /glyphicons -->				
				<div class="tab-pane active" id="fa-icons">
				</div>
	            </div>
	            <!-- /.tab-content -->
	          </div>
	          <!-- /.nav-tabs-custom -->
	        </div>        
	      </div>
	      <!-- /.row -->
	      <!-- END ACCORDION & CAROUSEL-->
		</section>
		<!-- /.content -->
    	</div>
        <!-- /.box -->
    </div>
  <!-- /.content-wrapper -->
  
  <!-- Footer.jsp -->
<%@include file="include/footer.jsp"%>
<!-- /.Footer.jsp -->

</div>
<!-- /.wrapper -->
<script>
  $(function () {
    $('#example1').DataTable()
    $('#example2').DataTable({
      'paging'      : false,
      'lengthChange': false,
      'searching'   : false,
      'ordering'    : true,
      'info'        : false,
      'autoWidth'   : false
    })
  })
</script>
</body>
</html>
