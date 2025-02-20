package com.kh.project.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.project.member.dao.MemberDao;
import com.kh.project.member.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberDao memberDao;
	
	// insert
	public int insertMember(Member member) throws Exception {
		int cnt = memberDao.insertMember(member);
		return cnt;
	}
	
	// 아이디 찾기
	public Member findId(Member member) throws Exception {
		Member findIdMember = memberDao.findId(member);
		return findIdMember;
	}

	// 아이디 중복체크
	@Override
	public int checkIdDup(String id) throws Exception {
		int cnt= memberDao.checkIdDup(id);
		return cnt;
	}

	// 닉네임 중복체크
	@Override
	public int checkNiDup(String nickname) throws Exception {
		int cnt = memberDao.checkNiDup(nickname);
		return cnt;
	}
	
	//by은지, 본인확인 -> 비밀번호 일치확인
	public String pwMatch(String id) throws Exception{
			return memberDao.pwMatch(id);
	}
		
	//by은지, 회원 정보 수정
	public int updateMember(Member member) throws Exception{
		return memberDao.updateMember(member);
	}
	
	//by은지, 회원정보 수정 -> 닉네임중복체크	(본인제외)											
	public int nicknameCheck(Member member) throws Exception{
		return memberDao.checkNickname(member);
	}
	
	//by은지, 회원탈퇴
	public int deleteMember(String id) throws Exception{
		return memberDao.deleteMember(id);
	}

	//login
	@Override
	public Member getMember(String id) throws Exception {
		return memberDao.getMember(id);
	}
	
	// 비밀번호 변경
	@Override
	public int updatePw(Member member) throws Exception {
		int cnt = memberDao.updatePw(member);
		return cnt;
	}
	
	
}
