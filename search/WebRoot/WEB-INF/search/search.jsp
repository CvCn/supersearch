<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>搜索</title>
		<link href="./img/i2.png"  rel="shortcut icon"/>
		<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
		<script src="http://cdn.jsdelivr.net/jquery.shadow-animation/1/mainfile"></script>
		<script>
			var b = true;//控制点击搜素状态
			var c = false;//控制搜索框状态
			//var a = false;//控制新闻显示
			window.onload=function(){
				$('#n1').text("<%=request.getAttribute("one")%>").attr('href', "<%=request.getAttribute("oneH")%>");
				$('#n2').text("<%=request.getAttribute("two")%>").attr('href', "<%=request.getAttribute("twoH")%>");
				$('#n3').text("<%=request.getAttribute("three")%>").attr('href', "<%=request.getAttribute("threeH")%>");
				$('#n4').text("<%=request.getAttribute("four")%>").attr('href', "<%=request.getAttribute("fourH")%>");
				$('#n5').text("<%=request.getAttribute("five")%>").attr('href', "<%=request.getAttribute("fiveH")%>");
				$('#n6').text("<%=request.getAttribute("six")%>").attr('href', "<%=request.getAttribute("sixH")%>");
				$('#t2').click(cli);
				$('#t1').keydown(function(e){
					if(e.keyCode==13){
						cli();
					}
				});
				$('#t1, #t2').hover(cc1, cc2);
				$('#t1, #t2').focus(cc3);
				$('#t1, #t2').blur(cc4);
				function cc1(){
					if(c) return false;
					onIt();
				}
				function cc2(){
					if(c) return false;
					outIt();
				}
				function cc3(){
					c = true;
					onIt();
				}
				function cc4(){
					c = false;
					outIt();
				}
				function onIt(){
					$("#t1").animate(
						{
							border:'1px solid #999999'
							, boxShadow:'0px 3px 7px #CDCDCD'
						}, 150);
				}
				function outIt(){
					$("#t1").animate(
						{
							border:'1px solid #B3B3B3'
							, boxShadow:'0px 1px 1px #CDCDCD'
						}, 150);
				}
					
				function reset(){
					if(b==false){
						$('#d2').css('display', 'none');
						$('#d1').animate({marginTop:'20%'}, 'slow', function(){news()});
					}
				}
				function cli(){
					var v = $('#t1').val();
					if(v.length == 0){
						reset();
						b = true;
					}else{
						$('#i1').val(v);
						$('#i2').val(v);
						$('#f1').submit();
						$("#f2").submit();
						if(b){
							var h = $(window).height();
							$('#d2').css('height', h-60); 
							$('#d1').animate({marginTop:'0'}, 'slow', function(){
								$("#d2").css('display', 'block');
							});
							resetNew();
							b = false;
						}
					}
				}
				$('#t1')[0].focus();
				function news(){
					$('#d3').css('display', 'block');
					setTimeout(function(){
							$('#a1').animate({marginLeft:'30px'}, 'fast');
						}, 100);
					setTimeout(function(){
							$('#a2').animate({marginLeft:'35px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 150);
					setTimeout(function(){
							$('#a3').animate({marginLeft:'40px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 200);	
					setTimeout(function(){
							$('#a4').animate({marginLeft:'45px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 250);
					setTimeout(function(){
							$('#a5').animate({marginLeft:'50px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 300);
					setTimeout(function(){
							$('#a6').animate({marginLeft:'55px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 350);	
					setTimeout(function(){
							$('#a7').animate({marginLeft:'60px'}, 'fast').animate({marginLeft:'30px'}, 1000);
						}, 400);	
				}
				function resetNew(){
					$('#d3').css('display', 'none');
					$('.c2').css('margin-left', '70%');
				}
				news();
				
		};
		</script>
		<style type="text/css">
			#d2{
				height: 600px;
				margin-top: 5px;
				display: none;
				padding-left: 20px;
			}
			#d1{
				height: 40px;
				margin-top: 20%;
				margin-left: 30%;
			}
			#d3{
				margin-top: 5%;
				display: none;
			}
			#t2{
				height: 25px;
				margin-left: -50px;
				padding-top: 7px;
				padding-bottom: 7px;
				outline: none;
			}
			#t1{
				height: 35px;
				width: 550px;
				font-size: 15px;
				float: left;
				padding-left: 5px;
				-webkit-appearance: none;
				border: 1px solid #B3B3B3;
				outline: none;
				-webkit-box-shadow:0px 1px 1px #CDCDCD;
			}
			.c1{
				border-radius: 2px;
			}
			.c2{
				margin: 15px;
				margin-left: 70%;
			}
			.c2>a{
				text-decoration: none;
			}
		</style>
	</head>
	<body style="margin: 0; margin-top: 5px;">
		<div>
		<form action="http://www.baidu.com/s" id="f1" target="f1">
			<input type="hidden" id="i1" name="wd"/>
		</form>
		<form action="https://www.so.com/s" id="f2" target="f2">
			<input type="hidden" id="i2" name="q"/>
		</form>
		</div>
		<div id="d1">
			<input type="text" id="t1" maxlength="2048" title="搜索" 
			aria-label="搜索" class="c1" spellcheck="false" 
			aria-haspopup="false" autocomplete="off" HaoyuSug="B9CAF892F47D47C19D54CAAE6320C88C"/>
			<input type="image" src="./img/i2.png" id="t2"/>
		</div>
		<div id="d2">
			<iframe width="49%" height="100%" width="100%" name="f1" frameborder="0"></iframe>
			<iframe width="49%" height="100%" width="100%" name="f2" frameborder="0"></iframe>
		</div>
		<div id="d3">
			<div id="a1" class="c2"><a target="_blank" id="n1"></a></div>
			<div id="a2" class="c2"><a target="_blank" id="n2"></a></div>
			<div id="a3" class="c2"><a target="_blank" id="n3"></a></div>
			<div id="a4" class="c2"><a target="_blank" id="n4"></a></div>
			<div id="a5" class="c2"><a target="_blank" id="n5"></a></div>
			<div id="a6" class="c2"><a target="_blank" id="n6"></a></div>
		</div>
	</body>
	<script charset="UTF-8" src="http://www.92find.com/inteltip.js"></script>
</html>