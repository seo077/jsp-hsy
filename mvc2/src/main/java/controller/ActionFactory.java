package controller;

import controller.action.Action;
import controller.action.CheckIdAction;
import controller.action.JoinAction;
import controller.action.JoinFormAction;
import controller.action.LoginAction;
import controller.action.LoginFormAction;
import controller.action.LogoutAction;
import controller.action.MainAction;

// Factory Method (gof 생성 [디자인 패턴]) (생성 디자인)
public class ActionFactory {
	
	// 싱글톤 (생성 디자인)
	private ActionFactory() {};
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	// command pattern (행위 디자인)
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("login")) action = new LoginAction();
		else if(command.equals("loginForm")) action = new LoginFormAction(); // 화면으로 이동
		else if(command.equals("join")) action = new JoinAction(); // 데이터 처리
		else if(command.equals("joinForm")) action = new JoinFormAction();
		else if(command.equals("checkId")) action = new CheckIdAction();
		else if(command.equals("logout")) action = new LogoutAction();
		else if(command.equals("main")) action = new MainAction();
		return action;
	}
}
