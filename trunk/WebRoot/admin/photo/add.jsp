<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<head>
	<title>上传图片</title>
	<link rel="stylesheet" href="<c:url value='/admin/styles/album.css'/>"
		type="text/css" />
	<link media="screen" type="text/css"
		href="<c:url value='/scripts/validate/theme/grey/formcheck.css'/>"
		rel="stylesheet" />
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/lang/zh-CN.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/scripts/validate/formcheck.js'/>"></script>
	<script type="text/javascript">
	window.addEvent('domready', function() {
		new FormCheck('photoForm');
	});
   </script>
</head>
<body>
	<div class="container mt">
		<div class="row-fluid">
			<s:include value="../left.jsp"></s:include>
			<div class="span10">
				<s:include value="../title.jsp"></s:include>

				<div class="well com">
					<div class="page-header">
						<div class="pull-right">
							<a href="<c:url value='/admin/photo/add'/>"
								class="btn btn-primary">发布</a>
						</div>
						<h3 class="yahei">
							<img src="<c:url value='/admin/images/app_list_album.gif'/>" />
							添加相册
						</h3>
					</div>
					<div id="edit">
						<s:form id="photoForm" action="photo!save.html" method="post"
							enctype="multipart/form-data">
							<p>
								<span class="l">图片名称:&nbsp;</span> <span class="r">&nbsp;
									<input class="inputtext text-input validate['required']"
									name="photo.name" class="inputtext" style="width: 200px;"
									maxlength="50" type="text" onblur="this.className='inputtext'" />
								</span><span class="t"><font color="red">*</font>必填</span>
							</p>
							<p>
								<span class="l">图片描述:&nbsp;</span> <span class="r">&nbsp;
									<textarea name="photo.description" cols="40" rows="4"
										id="description"></textarea> </span>
							</p>
							<p>
								<span class="l">选择相册:&nbsp;</span> <span class="r">&nbsp;
									<s:action name="album!search" id="albumList"
										executeResult="false">
									</s:action> <select id="albumId" name="albumId">
										<s:iterator value="%{#albumList.albums}" status="rowStatus">
											<option value="${id}">${name}</option>
										</s:iterator>
								</select> </span>
							</p>
							<p>
								<span class="l">选择图片:&nbsp;</span> <span class="r">&nbsp;
									<input type="file" name="file"
									class="inputtext text-input validate['image','required']"
									size="53" style="height:25px;" /> </span>
							</p>
							<script language="javascript">
								$(document).addEvent(function() {
									window.onbeforeunload = function() {
										if (getContentLength() > 0) {
											return "文章还没发表，离开将丢失当前的内容";
										}
									};
								});
							</script>
							<p>
								<input type="hidden" id="securitiesIds" name="listSecuritiesIds" />
							</p>
							<p style="margin-left: 100px;">
								<input type="submit" class="botton" value="发表"
									onmouseout="this.className='botton';"
									onmouseover="this.className='botton2';" /> <input
									type="button" class="botton_close1" value="取消"
									onmouseout="this.className='botton_close1';"
									onmouseover="this.className='botton_close2';"
									onclick="javascript:history.back();" />
							</p>
						</s:form>
					</div>
				</div>
			</div>

		</div>
	</div>
</body>

