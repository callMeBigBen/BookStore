<%--
  Created by IntelliJ IDEA.
  User: zhong
  Date: 2018/6/14
  Time: 8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<HTML>
<HEAD>
    <title>欢迎您！十分抱歉，您要查看的网页当前已过期，或已被更名或删除！</title>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <STYLE type=text/css>
        INPUT {
            FONT-SIZE: 12px
        }
        TD {
            FONT-SIZE: 12px
        }
        .p2 {
            FONT-SIZE: 12px
        }
        .p6 {
            FONT-SIZE: 12px;
            COLOR: #1b6ad8
        }
        A {
            COLOR: #1b6ad8;
            TEXT-DECORATION: none
        }
        A:hover {
            COLOR: red
        }
    </STYLE>
    <META content="Microsoft FrontPage 5.0" name=GENERATOR>
</HEAD>
<BODY oncontextmenu="return false" onselectstart="return false">
<P align=center>　</P>
<P align=center>　</P>
<TABLE cellSpacing=0 cellPadding=0 width=540 align=center border=0>
    <TBODY>
    <TR>
        <TD vAlign=top height=270><DIV align=center><BR>
            <IMG height=211 src="<%=request.getContextPath() %>/img/404/error.gif"
                 width=329><BR>
            <BR>
            <TABLE cellSpacing=0 cellPadding=0 width="80%" border=0>
                <TBODY>
                <TR>
                    <TD>&nbsp;&nbsp;&nbsp; <IMG
                            height=13 src="<%=request.getContextPath() %>/img/404/emessage.gif"
                            width=12>&nbsp;无法访问本页的原因是：</TD>
                </TR>
                <TR>
                    <TD height=8></TD>
                <TR>
                    <TD><P><FONT color=#000000><BR>
                        您所请求的页面不存在</FONT>! </P></TD>
                </TR>
                </TBODY>
            </TABLE>
        </DIV></TD>
    </TR>
    <TR>
        <TD height=5></TD>
    <TR>
        <TD align=middle>
            <TABLE cellSpacing=0 cellPadding=0 width=480 border=0>
                <TBODY>
                <TR>
                    <TD width=6><IMG height=26 src="<%=request.getContextPath() %>/img/404/left.gif"
                                     width=7></TD>
                    <TD background="<%=request.getContextPath() %>/img/404/bg.gif"><DIV align=center><A
                            href="http://www.pc6.com/">返回首页</A>　 　|　　 <A
                            href="javascript:history.go(-1)">返回出错页</A>　 　|　　 <A
                            href="http://www.pc6.com/">关闭本页</A> </DIV></TD>
                    <TD width=7><IMG
                            src="<%=request.getContextPath() %>/img/404/right.gif"></TD>
                </TR>
                </TBODY>
            </TABLE>
        </TD>
    </TR>
    </TBODY>
</TABLE>
<P align=center>　</P>
<P align=center>　</P>
</BODY>
</HTML>
