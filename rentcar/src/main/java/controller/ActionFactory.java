package controller;

import controller.action.Action;
import controller.action.BoardAction;
import controller.action.BoardDeleteAction;
import controller.action.BoardLikeAction;
import controller.action.BoardUpdateAction;
import controller.action.BoardUpdateFormAction;
import controller.action.BoardViewAction;
import controller.action.BoardWriteAction;
import controller.action.BoardWriteFormAction;
import controller.action.CarInfoAction;
import controller.action.CarSearchAction;
import controller.action.CommentAction;
import controller.action.EventAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.LongCarInfoAction;
import controller.action.LongCarRentAction;
import controller.action.MainFormAction;
import controller.action.MemberInfoAction;
import controller.action.MemberInfoFormAction;
import controller.action.ReservationAction;
import controller.action.ReservationConfirmAction;
import controller.action.ReservationConfirmFormAction;
import controller.action.ReservationFormAction;
import controller.action.ReviewAction;
import controller.action.ShortCarInfoAction;
import controller.action.ValidateFormAction;
import controller.action.WriteCommentAction;

public class ActionFactory {
	private ActionFactory() {};
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("comment"))action = new CommentAction();
		
		// 게시판
		else if(command.equals("boardWrite"))action = new BoardWriteAction();
		else if(command.equals("boardWriteForm"))action = new BoardWriteFormAction();
		else if(command.equals("boardView"))action = new BoardViewAction();
		else if(command.equals("board"))action = new BoardAction();
		else if(command.equals("boardLike"))action = new BoardLikeAction();
		else if(command.equals("boardUpdate"))action = new BoardUpdateAction();
		else if(command.equals("boardUpdateForm"))action = new BoardUpdateFormAction();
		else if(command.equals("boardDelete"))action = new BoardDeleteAction();
		
		// 댓글
		else if(command.equals("writeComment"))action = new WriteCommentAction();
		
		//로그인
		else if(command.equals("loginForm"))action = new LoginFormAction();
		else if(command.equals("login"))action = new LoginAction();
		
		//로그아웃
		else if(command.equals("logout"))action = new LogoutAction();
		
		//회원가입
		else if(command.equals("join"))action = new JoinAction();
		else if(command.equals("joinForm"))action = new JoinFormAction();
		else if(command.equals("validateForm"))action = new ValidateFormAction();
		
		//메인페이지
		else if(command.equals("mainForm"))action = new MainFormAction();
		
		//예약확인
		else if(command.equals("reservationConfirm"))action = new ReservationConfirmAction();
		else if(command.equals("reservationConfirmFrom"))action = new ReservationConfirmFormAction();
		
		// 차 세부 정보 페이지
		else if(command.equals("carInfo"))action = new CarInfoAction();
		
		//단기렌트카
		else if(command.equals("shortCarInfo"))action = new ShortCarInfoAction();
		
		//장기렌트카
		else if(command.equals("longCarInfo"))action = new LongCarInfoAction();
		else if(command.equals("longCarRent"))action = new LongCarRentAction();
		else if(command.equals("carSearch"))action = new CarSearchAction();
		
		//예약하기
		else if(command.equals("reservation"))action = new ReservationAction();
		else if(command.equals("reservationForm"))action = new ReservationFormAction();
		
		//리뷰
		else if(command.equals("review"))action = new ReviewAction();
		else if(command.equals("event"))action = new EventAction();
		
		//회원정보
		else if(command.equals("memberInfoForm"))action = new MemberInfoFormAction();
		else if(command.equals("memberInfo"))action = new MemberInfoAction();
		
		return action;
	}
}
