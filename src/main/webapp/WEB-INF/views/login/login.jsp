<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<div style="text-align: center; font:bold 30px black; margin:3% 0 3% 0;">로그인</div>
<div class="container" style="margin: 0 auto; width: 30%; height: 400px; background-color: #c4bfbe;">
<form class="form-horizontal" action="/action_page.php" style="margin:10% 13% 0 0;">
        <div class="form-group">
            <label class="control-label col-sm-2" for="email"></label>
            <div class="col-sm-10">
                <input type="email" class="form-control" id="id" placeholder="ID를 입력하세요">
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-2" for="pwd"></label>
            <div class="col-sm-10">
                <input type="password" class="form-control" id="pw" placeholder="Password를 입력하세요">
            </div>
        </div>       
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn">로그인</button>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <div class="checkbox">
                    <label><input type="checkbox">아이디 저장</label>
                </div>s
            </div>
        </div>
        <div style="margin: 0 auto;">
            <div style="margin-left: 38%; font-size: 30px; height: 60px;" >간편로그인<br><br></div>
            <div style="margin-left: 30%; margin-top: 2%; margin-right: 12%;">
                <button type="button" class="btn btn-primary" style="margin-right: 3%;" >네이버 로그인</button>
                <button type="button" class="btn btn-primary">카카오톡 로그인</button><br>            
            </div>
            <div style="margin-left: 30%; margin-top: 3%;">
            <button type="button" class="btn btn-link">아이디/비밀번호찾기</button>
            <button type="button" class="btn btn-link">회원가입</button>
            </div>
        </div>
    </div>
    </form>
