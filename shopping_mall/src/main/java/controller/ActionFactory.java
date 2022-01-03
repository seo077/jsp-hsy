package controller;

import controller.action.Action;
import controller.action.BoardUpdateAction;
import controller.action.GoBoardUpdateAction;
import controller.action.BoardWriteAction;
import controller.action.ClotheUpdateAction;
import controller.action.GoClotheWriteAction;
import controller.action.CommentAction;
import controller.action.CommentDeleteAction;
import controller.action.GoAdminPageAction;
import controller.action.GoBoardAction;
import controller.action.GoBoardViewAction;
import controller.action.GoBoardWriteAction;
import controller.action.GoClotheUpdateAction;
import controller.action.GoMainAction;

public class ActionFactory {
	private ActionFactory() {};
	private static ActionFactory instance = new ActionFactory();
	public static ActionFactory getInstance() {
		return instance;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if(command.equals("goMain")) action = new GoMainAction();
		else if(command.equals("goBoard")) action = new GoBoardAction();
		else if(command.equals("goBoardWrite")) action = new GoBoardWriteAction();
		else if(command.equals("goBoardView")) action = new GoBoardViewAction();
		else if(command.equals("boardWrite")) action = new BoardWriteAction();
		else if(command.equals("goBoardUpdate")) action = new GoBoardUpdateAction();
		else if(command.equals("boardUpdate")) action = new BoardUpdateAction();
		else if(command.equals("comment")) action = new CommentAction();
		else if(command.equals("commentDelete")) action = new CommentDeleteAction();
		else if(command.equals("goClotheWrite")) action = new GoClotheWriteAction();
		else if(command.equals("goClotheUpdate")) action = new GoClotheUpdateAction();
		else if(command.equals("clotheUpdate")) action = new ClotheUpdateAction();
		else if(command.equals("goAdmin")) action = new GoAdminPageAction();
		return action;
	}
}
