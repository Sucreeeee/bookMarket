<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>

	<%-- 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
		$(function(){
			$("a.deleteItem").click(function(){
				return confirm("确定删除《"+$(this).parent().parent().find("td:first").text()+"》吗？");
			})
			$("a.clear").click(function(){
				return confirm("确定清除购物车吗？");
			})
			$(".updateCount").change(function(){
				var id = $(this).attr('bookId');
				var count =  this.value;
				if (confirm("你确定要将"+$(this).parent().parent().find("td:first").text() +"商品数量修改为:"+ count+"?")){
					location.href="http://localhost:8080/book2/cartServlet?action=updateCount&count="+count+"&id="+id;
				}else{
					this.value = this.defaultValue;
				}
			})
		})
	</script>
</head>
<body>
	<div id="header">
			<img class="logo_img" alt="" src="static/img/zz.jpg" width="258" height="82">
			<span class="wel_word">购物车</span>

		<%--静态包含，登录 成功之后的菜单 --%>
		<%@ include file="/pages/common/login_success_menu.jsp"%>
	</div>
	
	<div id="main">
	
		<table>
			<tr>
				<td>商品名称</td>
				<td>数量</td>
				<td>单价</td>
				<td>金额</td>
				<td>操作</td>
			</tr>		
			<c:if test="${empty sessionScope.cart.items}">
				<tr>
					<td colspan="5"><a href="index.jsp">当前购物车为空！点我去浏览商品</a></td>
				</tr>
			</c:if>
			<c:forEach items="${sessionScope.cart.items}" var="entry">
				<tr>
					<td>${entry.value.name}</td>
					<td>
						<input bookId="${entry.value.id}" class="updateCount" style="width: 50px" type="text" value="${entry.value.count} ">

					</td>
					<td>${entry.value.price}</td>
					<td>${entry.value.totalPrice}</td>
					<td><a class="deleteItem" href="cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
				</tr>
			</c:forEach>
			
		</table>
		

			<c:if test="${not empty sessionScope.cart.items}">
				<div class="cart_info">
					<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
					<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
					<span class="cart_span"><a class="clear" href="cartServlet?action=clearCart">清空购物车</a></span>
					<span class="cart_span"><a href="pages/cart/checkout.jsp">去结账</a></span>
				</div>
			</c:if>
	</div>

	<%--静态包含页脚内容--%>
	<%@include file="/pages/common/footer.jsp"%>
</body>
</html>