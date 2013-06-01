<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
<%@ include file="../common/website.jsp"%>
<title>${viewinfo.info.title}</title>
<%@ include file="/common/ueditor.jsp"%>
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<ul class="breadcrumb">
					<li><a href="${ctx}/admin/index">首页</a> <span class="divider">/</span>
					</li>
					<li><a href="${ctx}/admin/product/">产品管理</a> <span
						class="divider">/</span>
					</li>
					<li class="active">添加产品</li>
				</ul>
				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/product/add'/>"
								class="btn btn-primary">添加</a>
						</div>
						<h3 class="yahei">产品添加</h3>
					</div>
					<div id="mainTab">
						<ul id="myTab" class="nav nav-tabs">
							<li class="active"><a data-toggle="tab"
								href="<c:url value='/admin/product'/>"> 产品列表</a>
							</li>
							<li><a data-toggle="tab"
								href="<c:url value='/admin/productCategory'/>"> 产品分类</a>
							</li>
						</ul>
					</div>
					<div id="productEdit">
						<s:form cssClass="form-horizontal" id="productForm" action="product!save" method="post" enctype="multipart/form-data">
							<fieldset>
								<div class="control-group">
									<label class="control-label" for="name">产品名称</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="name" name="product.name">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="productCategoryId">产品分类</label>
									<div class="controls">
										<s:action name="product-category!search"
											id="productCategoryList" executeResult="false" />
										<select id="productCategoryId" name="productCategoryId">
											<s:iterator value="%{#productCategoryList.productCategories}"
												status="rowStatus">
												<option value="${id}">${name}</option>
											</s:iterator>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="code">产品型号</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="code" name="product.code" value="">
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="price">产品价格</label>
									<div class="controls">
										<input type="text" class="input-xlarge" id="price" name="product.price" value=""> 数字
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="file">选择图片</label>
									<div class="controls">
										<input type="file" class="input-xlarge" name="file"
											id="file" />
										<p style="margin-top: 10px; color: #999;">图片大小不能超过2M，支持
											.jpeg .jpg .gif .bmp .png 格式</p>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="content">产品描述</label>
									<div class="controls">
										<textarea id="content" name="product.content" class="content"></textarea>
										<script type="text/javascript">
											var editorOption = {
												toolbars : [ [ 'Bold', 'underline',
														'forecolor', 'Undo',
														'Redo', 'insertimage',
														'link', 'unlink',
														'justifyleft',
														'justifycenter',
														'justifyright',
														'insertunorderedlist',
														'insertorderedlist', '|',
														'AutoTypeSet',
														'FormatMatch',
														'RemoveFormat', '|',
														'highlightcode', 'Source',
														'FullScreen' ] ],
												wordCount : false,
												initialContent : '',
												elementPathEnabled : false,
												minFrameHeight : 341,
												maxInputCount : 20
											};
											var _editor = new baidu.editor.ui.Editor(
													editorOption);
											_editor.render('content');
										</script>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">添加</button>
									<a class="btn" onclick="javascript:history.back();">取消</a>
								</div>
							</fieldset>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

