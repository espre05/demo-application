<t:messagesPanel/>

<spring:hasBindErrors name="passwordForm"><c:set var="bindingResult" scope="request"
                                                 value="${errors}"/></spring:hasBindErrors>

<form:form method="post" servletRelativeAction="/app/password" modelAttribute="passwordForm" class="form-horizontal">

    <sec:authorize access="isAuthenticated()" var="isAuthenticated"/>
    <c:choose>
        <c:when test="${isAuthenticated}">
            <form:hidden path="username"/>
        </c:when>
        <c:otherwise>
            <div class="form-group">
                <div class="${bindingResult.hasFieldErrors('username') ? 'has-error' : ''}">
                    <spring:message var="labelAccountId" code="accountId"/>
                    <form:label path="username" cssClass="col-sm-2 control-label">${f:h(labelAccountId)}</form:label>
                    <div class="col-sm-8">
                        <form:input path="username" cssClass="form-control" placeholder="${f:h(labelAccountId)}"/>
                        <formEx:errors path="username"/>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    <div class="form-group">
        <div class="${bindingResult.hasFieldErrors('currentPassword') ? 'has-error' : ''}">
            <spring:message var="labelCurrentPassword" code="currentPassword"/>
            <form:label path="currentPassword" class="col-sm-2 control-label">${f:h(labelCurrentPassword)}</form:label>
            <div class="col-sm-4">
                <form:password path="currentPassword" cssClass="form-control"
                               placeholder="${f:h(labelCurrentPassword)}"/>
                <formEx:errors path="currentPassword"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <spring:message var="labelNewPassword" code="newPassword"/>
        <div class="${bindingResult.hasFieldErrors('password') or bindingResult.hasFieldErrors('confirmPassword') ? 'has-error' : ''}">
            <form:label path="password" class="col-sm-2 control-label">${f:h(labelNewPassword)}</form:label>
        </div>
        <div class="${bindingResult.hasFieldErrors('password') ? 'has-error' : ''}">
            <div class="col-sm-4">
                <form:password path="password" cssClass="form-control" placeholder="${f:h(labelNewPassword)}"/>
                <formEx:errors path="password"/>
            </div>
        </div>
        <spring:message var="labelConfirmPassword" code="confirmPassword"/>
        <div class="${bindingResult.hasFieldErrors('confirmPassword') ? 'has-error' : ''}">
            <div class="col-sm-4">
                <form:password path="confirmPassword" cssClass="form-control"
                               placeholder="${f:h(labelConfirmPassword)}"/>
                <formEx:errors path="confirmPassword"/>
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-2 col-sm-8">
            <form:button class="btn btn-default" name="change">
                <span class="glyphicon glyphicon-edit"></span>
                <spring:message code="change"/>
            </form:button>
            <c:if test="${!isAuthenticated}">
                <form:button class="btn btn-default" name="changeAndLogin">
                    <span class="glyphicon glyphicon-log-in"></span>
                    <spring:message code="changeAndLogin"/>
                </form:button>
            </c:if>
        </div>
    </div>

</form:form>