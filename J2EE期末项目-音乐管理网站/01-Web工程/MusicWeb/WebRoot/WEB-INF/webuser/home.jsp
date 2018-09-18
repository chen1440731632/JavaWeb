<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>用户主页</title>
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
  </head>
  
  <body style="background-color:#f2f9fd;">
		<div class="header bg-main">
		  <div class="logo margin-big-left fadein-top">
		    <h1><img src="<%=basePath%>images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />在线音乐网站</h1>
		  </div>
		  <div class="head-l" style="margin-left: 300px;"><a class="button button-little bg-red"  onclick="logout()" ><span class="icon-power-off"></span> 退出登录</a> </div>
		</div>
		<div class="leftnav">
		  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
		  <h2><span class="icon-user"></span>基本管理</h2>
		  <ul style="display:block">
		    <li><a href="<%=basePath%>webUser/toWebUserUpdate" target="right"><span class="icon-caret-right"></span>个人信息修改</a></li>
		  </ul>   
		  <div class="leftnav-title"><strong><span class="icon-list"></span>在线音乐</strong></div>
		   <ul style="display:block">
		    <li><a href="<%=basePath%>webUser/toSearchAllMusic" target="right"><span class="icon-caret-right"></span>按歌曲名搜索</a></li>
		    <li><a href="<%=basePath%>webUser/toSearchAllAlbm" target="right"><span class="icon-caret-right"></span>按专辑名搜索</a></li>
		    <li><a href="<%=basePath%>webUser/toSearchAllSinger" target="right"><span class="icon-caret-right"></span>按歌手名搜索</a></li>
		  
		   
		  </ul>  
		</div>
		<script type="text/javascript">
		$(function(){
		  $(".leftnav h2").click(function(){
			  $(this).next().slideToggle(200);	
			  $(this).toggleClass("on"); 
		  })
		  $(".leftnav ul li a").click(function(){
			    $("#a_leader_txt").text($(this).text());
		  		$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
		  })
		});
		</script>
		
		<div class="admin">
		  <iframe scrolling="auto" rameborder="0" id="mainFrame" name="right" width="100%" height="100%"></iframe>
		</div>
		
		</body>
		
		<script type="text/javascript">
		  function logout(){
			  //退出登录
			  window.location.href="<%=basePath%>webUser/logout";
			  
			  
			  
		  }
		
		
		</script>
</html>
