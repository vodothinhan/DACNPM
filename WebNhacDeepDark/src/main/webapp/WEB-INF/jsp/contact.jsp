<!doctype html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <title>Contact Form 06</title>
    <meta charset="utf-8">
    <%--    <link rel="stylesheet" href="/css/contact.css">--%>
</head>
<body>
<jsp:include page="header.jsp" />
<section class="ftco-section" style="margin: 70px 40px 0 32%; padding : 0;overflow: hidden">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="wrapper">
                    <div class="row no-gutters mb-5">
                        <div class="col-md-7">
                            <div class="contact-wrap w-100 p-md-5 p-4">
                                <h3 class="mb-4">Contact Us</h3>
                                <div id="form-message-warning" class="mb-4"></div>
                                <c:if test="${message==true}">
                                    <div id="form-message-success" class="mb-4">
                                        Your message was sent, thank you!
                                    </div>
                                </c:if>
                                <form action="/send" method="POST" id="contactForm" name="contactForm" class="contactForm">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="label">Message</label>
                                                <textarea required pattern="\S+" name="message" class="form-control" id="message" cols="30"
                                                          rows="4" placeholder="Message"></textarea>

                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <input type="submit" value="Send Message"
                                                       style="background-color: #ff5500;padding: 10px; color: white;border-radius: 20px; border: 0px">
                                                <div class="submitting"></div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp" />
</body>
</html>

