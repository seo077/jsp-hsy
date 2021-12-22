<%@page import="java.io.PrintWriter"%>
<%@page import="rentalCar.RentalCarDTO"%>
<%@page import="reservation.ReservationDTO"%>
<%@page import="rentalCar.RentalCarDAO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="review.ReviewDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardDAO"%>
<%@page import="likes.LikesDAO"%>
<%@page import="comments.CommentsDAO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	
	String userId = (String)session.getAttribute("log");
	BoardDAO boarddao = BoardDAO.getInstance();
	CommentsDAO commentsdao = CommentsDAO.getInstance();
	LikesDAO likedao = LikesDAO.getInstance();
	ReservationDAO reserdao = ReservationDAO.getInstance();
	ReviewDAO reviewdao = ReviewDAO.getInstance();
	
	MemberDAO memberdao = MemberDAO.getInstance();
	int dir = Integer.parseInt(request.getParameter("dir"));
	if(dir==MemberDAO.UPDATE){
		//+ 아이디 중복 검사 ok (pk)
		// 필수정보 입력 검사 ok (js)
		
		
		String newid = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		if(userId.equals(newid)){
			// member database만 바꾸기
			memberdao.updateExceptId(newid,pw,name,email,phone);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('변경 완료.')");
			script.println("location.href='_04_main.jsp'"); 
			script.println("</script>");
		}else{
			// 만약 아이디가 변하면
			// 리뷰 댓글 ... 아이디 바꾸기
			// 로그인 중인 아이디도 바꾸기
			int result = memberdao.update(userId, newid, pw, name, email, phone);
			if(result == -2){
				// 아이디 중복
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('사용불가능한 아이디입니다.')");
				script.println("history.back()"); 
				script.println("</script>");
			}else{
				// 1.게시판 아이디 바꾸기
				boarddao.updateId(userId, newid);
				// 2. 댓글 아이디 바구기
				commentsdao.updateId(userId, newid);
				// 3. 좋아요 아이디 바꾸기
				likedao.updateId(userId, newid);
				// 4. 예약 아이디 바꾸기
				reserdao.updateId(userId, newid);
				// 5. 리뷰 아이디 바꾸기
				reviewdao.updateId(userId, newid);
				
				// 로그인 중인 아이디 변경
				session.removeAttribute("log");
				session.setAttribute("log", newid);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('변경 완료.')");
				script.println("location.href='_04_main.jsp'"); 
				script.println("</script>");
			}
		}
		
		
	}else if(dir==MemberDAO.DEL){
		// + 회원정보,댓글,좋아요,리뷰,예약 삭제
		//1.회원정보 삭제
		memberdao.delMember(userId);
		//2.댓글 삭제
		CommentsDAO commentdao = CommentsDAO.getInstance();
		commentdao.delComment(userId);
		
		//3.좋아요 삭제
		LikesDAO likesdao = LikesDAO.getInstance();
		ArrayList<Integer>boardNo = likesdao.myLikes(userId);
		likesdao.delLikes(userId);
		int size = boardNo.size();
		// -> 게시물의 좋아요 수 감소
		for(int i=0;i<size;i++){
			String num = String.valueOf(boardNo.get(i));
			BoardDTO bo = boarddao.getBoardView(num);
			int likes = bo.getLikes();
			boarddao.downLikes(num, likes);
		}
		
		//4.리뷰 삭제
		reviewdao.delReview(userId);
		
		// -> 차량 수 증가
		ReservationDAO reservationdao = ReservationDAO.getInstance();
		RentalCarDAO rentaldao = RentalCarDAO.getInstance();
		ArrayList<ReservationDTO>cars = reservationdao.reservation_confirmation(userId);
		int carsSize = cars.size();
		for(int i=0;i<carsSize;i++){
			int no = cars.get(i).getCarNo();
			RentalCarDTO car = rentaldao.getCarInfo(no);
			int qty = car.getQty();
			rentaldao.cancelReservation(qty, no);
		}
		//5.예약 삭제
		reservationdao.delReservation(userId);
		
		//6.게시물 삭제
		boarddao.delBoard(userId);
		
		session.invalidate();
		response.sendRedirect("_04_main.jsp");
	}
	%>
</body>
</html>