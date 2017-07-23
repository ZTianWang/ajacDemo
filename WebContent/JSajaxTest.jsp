<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script type="text/javascript">
        	var xmlHttp;
	      	/* 创建request异步对象 */
        	function createXMLHttpRequest(){
        	/* 	if (window.ActiveXObject()) { */
      			/* 支持IE5,6 */
        			/* xmlHttp=new ActiveXObject("Microsoft.XHLHTTP"); */
        	/* 	} else{ */
        			xmlHttp = new XMLHttpRequest();
        		/* } */
        	}
        	
        	function createQueryStr(){
        		var userName=document.getElementById("userName").value;
        		var userBirth=document.getElementById("userBirth").value;
        		var querystr = "userName="+userName+"&userBirth="+userBirth;
        		console.log(querystr);
        		return querystr;
        	}
        	
        	/* 回调函数 */
        	function handleStateChange() {
        		/* 请求发送成功 */
        		console.log(xmlHttp.readyState);
				if (xmlHttp.readyState == 4) {
					/* 服务器响应成功 */
					if (xmlHttp.status == 200) {
						/* 获得返回的数据 */
						var content=xmlHttp.responseText;
						console.log('handle');
						document.getElementById("content").innerHTML=content;
					}
				}
			}
        	
        	function startGet(){
        		createXMLHttpRequest();
	    		/* 时间戳防止访问缓存数据 */
        		var url = "request.jsp?timestamp="+new Date().getTime();
	    		/* get请求将请求的数据放在请求头中 */
        		xmlHttp.open("get",url+"&"+createQueryStr());
        		xmlHttp.send(null);
        		/* 触发事件 */
        		xmlHttp.onreadystatechange=handleStateChange;
        		console.log('get:'+url+"&"+createQueryStr());
        	}
        	
        	function startPost(){
        		createXMLHttpRequest();
	    		/* 时间戳防止访问缓存数据 */
        		var url = "request.jsp?timestamp="+new Date().getTime();
        		xmlHttp.open("post",url);
        		/* 添加请求头 */
        		xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
        		/* post方法将请求内容通过请求实体发送，做send的参数 */
        		xmlHttp.send(createQueryStr());
        		/* 触发事件 */
        		xmlHttp.onreadystatechange=handleStateChange;
        		console.log('post');
        	}
        	
        	window.onload=function(){
        		document.getElementById("btnGet").onclick = startGet;
        		document.getElementById("btnPost").onclick = startPost;
        	} 
        	
        </script>
    </head>
    <body>
    	<input type="text" name="userName" id="userName" /><br/>
    	<input type="text" name="userBirth" id="userBirth" /><br />
    	<input type="button" name="btnGet" id="btnGet" value="Get"/>
    	<input type="button" name="btnPost" id="btnPost" value="Post"/><br />
    	<div id="content"></div>
 	</body>
</html>