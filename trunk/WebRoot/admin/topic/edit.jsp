<%@ page language="java" errorPage="/error.jsp" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<s:action name="topic!view" id="view" executeResult="false" />
<head>
	<title>讨论区</title>
	<link rel="stylesheet"
		href="<c:url value='/admin/styles/topic.css'/>" type="text/css" />
	<script type="text/javascript" charset="utf-8"
		src="<c:url value="/components/kindeditor/kindeditor.js"/>"></script>
	<script type="text/javascript">
    KE.show({
        id : 'ke-text'
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
							<a href="<c:url value='/admin/tipic/add'/>" class="btn btn-primary">  添加</a>
						</div>
						<h3 class="yahei"><img src="<c:url value='/admin/images/app_list_info.gif'/>" />  我发表的话题</h3>
					</div>
				<div id="analysisEdit">
						<s:form action="topic!update.html" method="post"
							cssClass="creat_form clearfix">
							<input type="hidden" name="id" value="${view.topic.id}" />
							<p>
								<span class="l">
									话题标题：
								</span>
								<input type="text" id="title" name="topic.title"
									value="${view.topic.title}" maxlength="80" />
							</p>
							<br>
							<p>
								<span class="l">
									话题分类：
								</span>
								<s:action name="board!search" id="boardList"
									executeResult="false"/>
								<select id="boardId" name="boardId">
									<s:iterator value="%{#boardList.boards}"
										status="rowStatus">
										<option value="${id}"
											<c:if test="${view.topic.board.id==id}">selected="selected"</c:if>>
											${name}
										</option>
									</s:iterator>
								</select>
							</p>	
							<br>
							<p>
								<span class="l">话题内容：</span>
								<span class="l">
									<textarea id="ke-text" class="textarea text-input validate['required']"
										name="topic.content" style="width: 600px; height: 300px;">${view.topic.content}</textarea>
								</span>
							</p>
							<br>
							<p style="width: 640px; text-align: center;">
								<input name="submit1" class="bt_sub3w" type="submit"
									value="修改成功" />
							</p>
						</s:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

