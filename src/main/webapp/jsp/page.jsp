<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%> 

<c:if test="${pageInfo.size >0 }">
		<!-----------------------------------------分页插件-------------------------------------------->
		<nav aria-label="Page navigation" id="fenye">
		<input type="hidden" value="${pageNo }" name="pageNo" id="pageNo"/>
	 	<button type="submit" style="display: none" id="sub"></button>
	 	
	 	
			<ul class="pagination" style="float:right;">
				<!-----------------------------------------首页分割线-------------------------------------------->

				<li class="page-item"><a class="page-link" data-p=1
					href="javascript:;">首页</a></li>

				<!-----------------------------------------上一页分割线------------------------------------------>
				<c:if test="${pageInfo.hasPreviousPage && pageInfo.pageNum>1}">
					<li class="page-item"><a class="page-link"
						href="javascript:;" data-p=${pageInfo.pageNum-1}
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<!-----------------------------------------数字翻页分割线---------------------------------------->
				<c:forEach items="${pageInfo.navigatepageNums}" var="page">
					<c:if test="${page==pageInfo.pageNum}">
						<li class=" page-item active"><a href="javascript:;"  class="page-link" data-p=${page}>${page}</a></li>
					</c:if>

					<c:if test="${page!=pageInfo.pageNum }">
						<li class="page-item"><a href="javascript:;" data-p=${page} class="page-link">${page}</a></li>
					</c:if>
					 
				</c:forEach>

				<!-----------------------------------------下一页分割线------------------------------------------>
				<c:if test="${pageInfo.pageNum>1&&pageInfo.pageNum+1<pageInfo.pages}">
					<li class="page-item"><a class="page-link"
						href="javascript:;" data-p=${pageInfo.pageNum+1}
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>

				</c:if>
				<!-----------------------------------------末页分割线-------------------------------------------->

				<li class="page-item"><a class="page-link"
					href="javascript:;" data-p=${pageInfo.pages}>末页</a></li>

			</ul>
		</nav>
		<p style="text-align: right;clear: both;">共${pageInfo.total }条数据，当前是第${pageInfo.pageNum }页，每页${pageInfo.pageSize }条，共${pageInfo.pages }页</p>
	</c:if>
								
	 
<script type="text/javascript">
 $("#fenye a").click(function(){
	 $("#pageNo").val( $(this).attr("data-p"));
	 $("#sub").click();
	 return false;
 })
 </script>
 
