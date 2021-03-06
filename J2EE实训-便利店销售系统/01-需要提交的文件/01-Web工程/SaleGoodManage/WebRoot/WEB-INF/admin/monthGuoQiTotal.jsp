<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<script type="text/javascript" src="<%=path%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/jquery.easyui.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/easyui/themes/default/easyui.css"></link>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/easyui/themes/icon.css"></link>
<link rel="stylesheet" type="text/css" href="<%=path%>/js/easyui/demo/demo.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/layout_blue.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/layout_page.css"/>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/style-search.css"/>
<html>
<head>
</head>
<body >
  <!--查询页面 -->
    <center><font color="red" size="20;">单个商品月过期率统计</font></center>
	<div class="searchinfo">
    	<form action="" id="frm">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#d3dbe0">
		  
		  <tr>
			<td class="search_head_td head_width15">统计开始月份：</td>
			<td class="search_content_td content_width15">
				 <select id="startMonth" style="width: 200px;">
				     <option value="">选择统计开始月份</option>
				     <option value="1">1</option>
				     <option value="2">2</option>
				     <option value="3">3</option>
				     <option value="4">4</option>
				     <option value="5">5</option>
				     <option value="6">6</option>
				     <option value="7">7</option>
				     <option value="8">8</option>
				     <option value="9">9</option>
				     <option value="10">10</option>
				     <option value="11">11</option>
				     <option value="12">12</option>
				 
				 </select>
			</td>
			<td class="search_head_td head_width15">统计结束月份：</td>
			<td class="search_content_td content_width15">
				      <select id="endMonth" style="width: 200px;">
				     <option value="">选择统计开始月份</option>
				     <option value="1">1</option>
				     <option value="2">2</option>
				     <option value="3">3</option>
				     <option value="4">4</option>
				     <option value="5">5</option>
				     <option value="6">6</option>
				     <option value="7">7</option>
				     <option value="8">8</option>
				     <option value="9">9</option>
				     <option value="10">10</option>
				     <option value="11">11</option>
				     <option value="12">12</option>
				 
				 </select>
			</td>
			<td class="search_head_td head_width15">请选择商品：</td>
			<td class="search_content_td content_width15">
				        <select id="goodId" name="goodId" style="width:200px;" >
					       <option value="">==请选择商品==</option>
					       <!-- 获取商品类型信息 ，每次取到数据存放于good变量-->
			               <c:forEach items="${lists}" var="good">
			               		<!-- value值，表单被提交时被发送到服务器的值 -->
			                   <option value="${good.id}">${good.goodName}</option>
			               </c:forEach>
			           
			           </select>
			</td>
				
		  </tr>
          
		   <tr>
			<td  colspan="6" class="search_button">
				<div class="btns m1">
					<ul>
						<li><input type="button" value="统计" class="select_btn"
							onclick="total()" /></li>
					
					</ul>
				</div>
			</td>
		</tr>
		  
		</table>
		
        
        </form>   
	</div>
  <div class="clear"></div>
  <div class="nrBox">
	<div class='m1'>
		<!-- 嵌入式框架 -->
	    <iframe id="totalIframe" width="100%" height="500px;"  src="" style="border: opx;">
	    
	    </iframe>
         <table id="resultDatas"  ></table>
    </div>

 
<script type="text/javascript">
	   function total(){
	   		//第一步,获取该选择的开始月份和结束月份
		     var startMonth=$("#startMonth").val();
		     var endMonth=$("#endMonth").val();
		     var goodId=$("#goodId").val();
		     if(startMonth==""||endMonth==""){
		    	 $.messager.alert('提醒', '统计开始月份和结束月份不能为空', 'info'); 
		    	 return;
		     }
		     if(startMonth==endMonth){
		    	 $.messager.alert('提醒', '统计开始月份和结束月份相等,不能统计', 'info'); 
		    	 return;
		    	 
		     }
		     if(startMonth>endMonth){
		    	 $.messager.alert('提醒', '统计开始月份大于结束月份,不能统计', 'info'); 
		    	 return;
		    	 
		     }
		     if(goodId==""){
		    	 $.messager.alert('提醒', '未选择商品,不能统计', 'info'); 
		    	 return;
		    	 
		     }
		     
		     //定义了url，以startMonth为参数，获取到信息对应值
		     var url="<%=path%>/total/showMonthGoodGuoQiTotal?startMonth="+startMonth+"&endMonth="+endMonth+"&goodId="+goodId;
		     //frame嵌入式框架为showMonthGoodGuoQiTotal.jsp
		     $("#totalIframe").attr("src",url);//赋值
		   
		   
	   }
	

</script>
</body>
</html>

