package com.kh.project.mypage.controller;

import java.net.URLEncoder;
import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.project.board.service.BoardService;
import com.kh.project.board.vo.Board;
import com.kh.project.board.vo.Criteria;
import com.kh.project.board.vo.Reply;
import com.kh.project.mypage.service.MypageService;

@Controller
public class MypageController {

	@Autowired
	MypageService mypageService;
	
	@Autowired
	BoardService bservice;
	//내가 쓴 글 리스트
	@RequestMapping(value="myList.do", method=RequestMethod.GET)
	public String myListView(Model model, Principal principal) throws Exception{
		
		String id= principal.getName();
		
		List<Board> myBoardList = mypageService.myBoardList(id);
		
		model.addAttribute("myBoardList", myBoardList);
		model.addAttribute("center","../mypage/myList.jsp");
		return "template/index";
	}
	
	//by은지, 내가 쓴 글 페이징 (infinite scroll 페이징) - ajax
	@ResponseBody
	@RequestMapping(value="myList.do", method=RequestMethod.POST)
	public String myListView(Principal principal, String more) throws Exception{
		
		//by은지, 로그인한 아이디.	
		String id= principal.getName();
		
		//by은지, more값이랑 id값 map에 저장 *더보기페이징때는 dao에서 해줌.
		Map<String, String> map = new HashMap<String, String>();
		map.put("more", more);
		map.put("id", id);
		
		//by은지, more & id값 전달 -> 내가 쓴 글 리스트
		List<Board> myBoardPage = mypageService.myBoardPage(map);
		
		//by은지, 전송용 최종 json객체
		JSONObject sendJson = new JSONObject();
			
		//by은지, JSONArray 객체를 생성하여 JSONObject 객체를 하나씩 담는다
		JSONArray jarr = new JSONArray();
		
		//by은지, 날짜형식 지정
		SimpleDateFormat sf = new SimpleDateFormat("MM-dd");
		
		//by은지, list를 jarr에 저장처리
		for(Board board : myBoardPage) {
			//by은지, board 정보 저장할 json객체 선언
			JSONObject jboard = new JSONObject();
			
			jboard.put("post_code",board.getPost_code());
			jboard.put("post_no",board.getPost_no());
			
			//by은지, 인코딩 (인코딩후 디코딩시 공백 +로 표시되는 문제 해결)
			String title = URLEncoder.encode(board.getPost_title(),"UTF-8");
			title = title.replaceAll("\\+", "%20");
			String address = URLEncoder.encode(board.getPost_address(),"UTF-8");
			address = address.replaceAll("\\+", "%20");
				
			jboard.put("post_title", title);
			jboard.put("post_address",address);
			jboard.put("post_date",sf.format(board.getPost_date()));
			jboard.put("post_price",board.getPost_price()); 
			jboard.put("rename_filename",board.getRename_filename());

			jarr.add(jboard);
		}
		
		//by은지, 전송할 객체 배열을 JSONObject에 담아 한번에 처리한다.
		sendJson.put("list", jarr);
		return sendJson.toJSONString();
	}
	
//	// 내가 쓴 글 페이징
//	@ResponseBody
//	@RequestMapping(value="myList.do", method=RequestMethod.POST)
//	public String myListView(Model model, Board board, Principal principal, String id, String more) throws Exception{
//		
//		Map<String, String> map = new HashMap<String, String>();
//		String Pid= principal.getName();
////		int page = Integer.parseInt(more);
//		map.put("more", more);
//		System.out.println("나와라나와라 :"+ more);
//		map.put("Pid", Pid);
//		System.out.println("아이디야 들어가라 : "+Pid);
//		List<Board> myBoardPage = mypageService.myBoardPage(map);
//		System.out.println(myBoardPage);
//		
//		JSONObject sendJson = new JSONObject();
//		JSONArray list = new JSONArray();
//		for(Board board2 : myBoardPage) {
//			JSONObject jboard = new JSONObject();
//			jboard.put("post_code",board2.getPost_code());
//			jboard.put("post_no",board2.getPost_no());
//			jboard.put("post_title", URLEncoder.encode(board2.getPost_title(),"UTF-8"));
//			jboard.put("post_address",URLEncoder.encode(board2.getPost_address(),"UTF-8"));
//			jboard.put("post_price",board2.getPost_price());
//			list.add(jboard);
//		}
//		sendJson.put("list", list);
//		return sendJson.toJSONString();
//	}
	
	
	// 내 댓글 보기
		@RequestMapping(value="myComment.do", method=RequestMethod.GET)
		public String myCommentView(@RequestParam(defaultValue="1", required=false) int page,Model model, Principal principal) throws Exception{
			String id = principal.getName();
			int listCount = bservice.allCountReplyById(id);
			Criteria cri = new Criteria(page, 10);
			model.addAttribute("cri",cri);
			model.addAttribute("listCount", listCount);
			model.addAttribute("page", page);
			model.addAttribute("myReplies",bservice.getReplybyId(cri,id));
			model.addAttribute("center", "../mypage/myComment.jsp");
			return "template/index";
		}
}
