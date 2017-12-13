
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%if (session.getAttribute("member") != null) {%>
<%System.out.println("mem:" );%>
<% model.Member member = (model.Member) session.getAttribute("member");
    if (request.getParameter("delete") != null) {
        if (request.getParameter("id") != null) {
            member.deleteMessage(Integer.parseInt(request.getParameter("id")));
        }
    }
%>

<h2>All message</h2>
<ul class="list-group">
    <%  List<model.Message> messages = member.getMessages();
    System.out.println("mes L:" );
        if (messages.size() == 0) {
    %> <li class="message-text-inside list-group-item">คุณไม่มีข้อความในขณะนี้</li>
        <%
            }
            for (int i = 0; i < messages.size(); i++) {
        %> <a href="#" class="message-text-inside list-group-item">
        <img onclick="javascript:delMessage(<%= messages.get(i).getId()%>)" class="message-delete" src="img/error.png">
        <h3 class="message-header"><%= messages.get(i).getMessage().split(":")[0]%></h3>
        <p>จาก: <%= messages.get(i).getSender()%> เวลา: <%= messages.get(i).getDate()%> <%= messages.get(i).getTime()%></p>
        <%= messages.get(i).getMessage()%>
        <% if (messages.get(i).getStatus() == 0) {%>
        <span class="badge"> ใหม่ </span>
        <%}%>
    </a>
    <% member.markAsRead(messages.get(i).getId());
                        }%>
</ul>
<%}else if(session.getAttribute("admin") != null){%>
<%System.out.println("madadas:" );%>
<% model.Admin member = (model.Admin) session.getAttribute("admin");
    if (request.getParameter("delete") != null) {
        if (request.getParameter("id") != null) {
            member.deleteMessage(Integer.parseInt(request.getParameter("id")));
        }
    }
%>
<h2>All message</h2>
<ul class="list-group">
    <%  List<model.Message> messages = member.getMessages();
        if (messages.size() == 0) {
    %> <li class="message-text-inside list-group-item">คุณไม่มีข้อความในขณะนี้</li>
        <%
            }
            for (int i = 0; i < messages.size(); i++) {
        %> <a href="#" class="message-text-inside list-group-item">
        <img onclick="javascript:delMessage(<%= messages.get(i).getId()%>)" class="message-delete" src="img/error.png">
        <h3 class="message-header"><%= messages.get(i).getMessage().split(":")[0]%></h3>
        <p>จาก: <%= messages.get(i).getSender()%> เวลา: <%= messages.get(i).getDate()%> <%= messages.get(i).getTime()%></p>
        <%= messages.get(i).getMessage()%>
        <% if (messages.get(i).getStatus() == 0) {%>
        <span class="badge"> ใหม่ </span>
        <%}%>
    </a>
    <% member.markAsRead(messages.get(i).getId());
                        }%>
</ul>
<%}%>