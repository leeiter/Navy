<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/include-head.jspf" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--page include-->
          <main class="col offset-2 h-100 user-main" id="admin_content">
            <div class="row bg-light">
              <div class="col-12 py-4 text-center">
                <span style="font-size: 30px;">회원관리</span>
              </div>
            </div>
            <div class="row bg-white">
              <div class="col-12 py-4">
                <table class="table">
                  <thead>
                    <tr>
                      <th class="in-ck-box">SEQ</th>
                      <th class="in-ck-box">USER.ID</th>
                      <th class="in-ck-box">AUTHORITY</th>
                      <th class="in-ck-box">AUTHORITY Y/N</th>
                      <th class="in-ck-box">CHECKOUT Y/N</th>
                    </tr>
                  </thead>
                  <tbody>
                  <c:choose>
					<c:when test="${empty userList}">
						<tr><td colspan="5">User 정보 없음</td></tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${userList}" var="user" varStatus="i">
							<tr data-id="${user.username}" class="tr_user">
								<td class="in-ck-box td-click">${i.count}</td>
								<td class="in-ck-box td-click">${user.username}</td>
								<td class="in-ck-box td-click">권한</td>
								<td class="in-ck-box td-click">${user.enabled}
									<input type="checkbox" value="${user.enabled}" >
								</td>
								<td class="in-ck-box td-click">${user.checkout}
									<input type="checkbox" value="${user.checkout}" >
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				   </c:choose>
                    <tr data-id="${user.username}" class="tr_user">
                      <td class="in-ck-box td-click">1</td>
                      <td class="in-ck-box td-click">qussoa</td>
                      <td class="in-ck-box td-click">ADMIN</td>
                      <td class="in-ck-box">
                        <input type="checkbox" />
                      </td>
                      <td class="in-ck-box">
                        <input type="checkbox" />
                      </td>
                    </tr>
                  </tbody>
                </table>

                <!--pagination-->
                <div class="d-flex justify-content-center">
                  <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <li class="page-item">
                        <a
                          class="page-link black-text"
                          href="#"
                          aria-label="Previous"
                        >
                          <span aria-hidden="true" class="black-text"
                            >&laquo;</span
                          >
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <li class="page-item black-text">
                        <a class="page-link black-text" href="#">1</a>
                      </li>
                      <li class="page-item black-text">
                        <a class="page-link black-text" href="#">2</a>
                      </li>
                      <li class="page-item black-text">
                        <a class="page-link black-text" href="#">3</a>
                      </li>
                      <li class="page-item black-text">
                        <a
                          class="page-link black-text"
                          href="#"
                          aria-label="Next"
                        >
                          <span aria-hidden="true" class="black-text"
                            >&raquo;</span
                          >
                          <span class="sr-only black-text">Next</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
                <!--pagination end-->
              </div>
            </div>
          </main>
</body>
</html>