<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#cMyPageLeft{
		display: block;
	}
	.wordcut{
		overflow:hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.leavepopupDiv{
		position:absolute;
		top:500px;
		background-color: white;
	}
	.leavepopupDiv, .leavepopupBar, .leavepopupContent{
		width:680px;
	}
	.leavepopupBar{		
		height:50px;
		background-color: rgb(252,118,45);
		position:absolute;
		color:white;
		text-align: center;
		line-height: 50px;
	}
	.leaveListBarClose{
		height:50px;
		width:50px;
		background-color: white;
		position:absolute;
		font-size:40px;
		line-height:40px;
		text-align:center;
		border:1px solid rgb(252,118,45);
		left:630px;
	}
	.leavepopupContent{
		height:700px;
		border:1px solid rgb(252,118,45);
	}
	
	#leaveDiv{
		padding-top:20px;
		padding-left:20px;
		height:670px;
		width:1080px;
	}
	#leaveDiv>div{
		margin-top:200px;
	}
	#leaveDiv>div>form{
		margin-top:40px;
		text-align:center;
	}
	#leaveDiv>div>h3{
		text-align:center;
	}
	#pwdInput{
		width:300px;
		height:40px;
	}
	#leaveCheck, #leaveCancel{
		margin-top:30px;		
	}
	#buyCancelRollBack{
		display:none;
		left:650px;
	}
	#leaveBtn{
		width:100px;
		margin-top:20px;
	    height: 30px;
	    background: white;
	    border: 1px solid black;
	    border-radius: 3px;
	}
	#modal{
		background-color: gray;
		opacity: 0.6;
		position: fixed;
		left:0px;
		top:0px;
		width:100%;
		height:100%;
		display:none;
		margin-top:0px;
	}
</style>
<script>
	$(function(){
		$(".leaveBtn").click(function(){
			$(this).parent().parent().css('display',"none");
			$("#leavepopupContent").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$("#leaveBtn").click(function(){
			$(this).parent().parent().css('display',"none");
			$("#leavepopupContent").css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$(".leaveListBarClose").click(function(){
			$(this).parent().css("display","none");
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
		})
		$("#leaveCancel").click(function(){
			$("#modal").css("display","none");
			$(document.body).css("overflow","visible");
			location.href="/sshj";
		})
		$("#leaveCheck").click(function(){
			if(confirm('????????? ???????????? ???????????????????')){
				$.ajax({
					url : 'memberDelete',
					data : 'm_id='+$("#pwdInput").val(),
					success: function(result){
						console.log("result = "+result);
						if(result == 0){
							alert('?????? ?????????????????????.');
						}else if(result == -1){
							$("#buyCancelRollBack").css("display","block");
							$("#modal").css("display","block");
							$(document.body).css("overflow","hidden");
						}else if(result == -2){
							alert("??????????????? ?????????????????????.")
						}else if(result == 1){
							alert("??????????????? ?????????????????????. \n ?????????????????? ???????????????.");
							location.href="logout";
						}
					}, error: function(){
						console.log("??????")
					}
				});
			};
		});
	});
</script>
<div class="section" id="leaveDiv">
	<div id="modal" style="margin-top:0px;"></div>
	<h2>?????? ??????</h2>
	<h4>????????? ?????????????????????????</h4>
	<div>
		<h3>??????????????? ??????????????????</h3>
		<form method="post">
			<input type="password" placeholder="??????????????? ??????????????????" id="pwdInput" name="m_pw"/><br/>
			<input type="button" value="??????" id="leaveCheck" class="btn"/>
			<input type="button" value="??????" id="leaveCancel" class="btn"/>
		</form>
	</div>
	<div class="leavepopupDiv" id="buyCancelRollBack">
		<div class="leavepopupBar" style="font-size:21px;">?????? ??????</div><div class="leaveListBarClose">&times;</div>
		<div class="leavepopupContent" style="text-align: center;padding-top:100px; height:340px;">
			<h2>?????? ?????????/???????????? ????????? ????????????.</h2>
			<h2>??????????????? ??????????????????.</h2>
			<input type="button" value="??????" class="leavebtn" id="leaveBtn"  style="top:240px"/>
		</div>
	</div>	
</div>