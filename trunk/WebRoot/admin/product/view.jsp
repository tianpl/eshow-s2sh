<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:set var="title">产品列表</c:set>
<s:action name="product!view" id="view" executeResult="false">
</s:action>
<head>
	<title>${view.product.name}</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/product.css'/>" type="text/css" />
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li class="active">${title}</li>
				</ul>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/product/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">产品列表</h3>
					</div>
					<ul id="myTab" class="nav nav-tabs">
						<li class="active"><a data-toggle="tab"
							href="<c:url value='/admin/product'/>"> 产品列表</a></li>
						<li><a data-toggle="tab"
							href="<c:url value='/admin/productCategory'/>"> 产品分类</a></li>
					</ul>
					<div id="productView">
						<s:form action="product!view.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.product.id}" />
							<div class="title">
								<span>${view.product.name}<br/></span><span class="r" style=" color: #999; font-size: 12px;"><a href="<c:url value='/admin/product/edit/${view.product.id}'/>">修改</a>
								</span>
								<span style="font-weight: bold; color: #999; font-size: 12px;">&nbsp;&nbsp;${view.product.user.username}&nbsp;&nbsp;&nbsp;发布于${view.product.addTime}</span>
							</div>
							<br />
							<div align="center">
								<img
									src="${pageContext.request.contextPath}/upload/product/<s:date name='%{#view.product.addTime}' format='yyyyMMdd' />/${view.product.img}"
									width="200" height="200" />

							</div>
							<div class="c"></div>
							<div class="contxt">
								&nbsp;&nbsp;${view.product.content}
							</div>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

