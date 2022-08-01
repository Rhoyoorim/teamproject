package controller;

import java.util.ArrayList;
import model.PersonDAO;
import model.PersonVO;
import model.PobbangDAO;
import model.PobbangVO;
import view.PobbangView;

public class PobbangController{
	PobbangDAO pobbangDAO;
	PersonDAO personDAO;
	PersonVO personVO;
	PobbangView view;
	String dummy = "";

	public PobbangController() {
		view = new PobbangView();
		pobbangDAO = new PobbangDAO();
		personDAO = new PersonDAO();
	}

	public void startAPP() {
		view.welcome();																	//환영 인사
		newAcount();																		//회원 저장
		while (true) {
			view.mainName(personVO.getName());
			view.mainMenu();															//메인 메뉴
			if (view.action==1) {					
				//빵 목록
				appNum1();
			}
			else if (view.action==2) {
				//빵 뽑기
				appNum2();
			}
			else if (view.action==3) {
				//뽑은 빵 리스트
				appNum3();
			}
			else if (view.action==4) {
				//종료
				view.returnMoney(personVO.getMoney());						//사용자의 게임머니 반환
				view.customerEnd();														//종료 문구
				break;
			}
			else if (view.action==view.adminNum) {
				//관리자 모드
				appAdmin();																//관리자 모드
			}
		}
	}

	void newAcount() {
		//계정 새로 생성
		personVO = new PersonVO();
		String name = view.insertID();
		personVO.setName(name);
		int money = view.insertMoney();
		personVO.setMoney(money);
		personVO.setCnt(5);
	}

	void appNum1() {
		//1번 빵목록 선택
		view.breadList();
		PobbangVO vo = null;
		ArrayList<PobbangVO> arr = pobbangDAO.selectAll(vo);
		for (int i = 0; i < arr.size(); i++) {
			String j = arr.get(i).getName();
			view.printString(j);
		}
	}

	void appNum2() {
		//2번 빵뽑기 선택
		while(true) {
			if (!limitSetGotcha()) {													//뽑기전 제한사항 확인
				break;																	//제한 사항에 1개라도 걸리면 처음으로
			}
			pobbangGotcha();														//빵 뽑기 실행

			view.againGacha();														// 다시 뽑겠나? print
			view.yesOrNo();															//	Yes or No print
			if(view.selectTryGame()){												// 다시 뽑을것인가에 대한 메서드 (T/N)
				continue;
			}
			break;
		}
	}
	boolean limitSetGotcha() {
		//빵 뽑기전 체크해야할 부분
		if(!pobbangDAO.totalCnt(null)) {
			view.breadZero();															//빵이 더이상 존재하지 않음을 알림
			return false;
		}
		if (!personDAO.checkMoney(personVO)) {
			view.moneyleft(personVO.getMoney());							//금액이 적다고 알림 + 남은 금액 출력
			return false;
		}
		if (!personDAO.checkCnt(personVO)) {
			view.cntZero();																//횟수가 0이 되어서 더이상 뽑을수 없음을 알림
			return false;
		}
		return true;
	}
	void pobbangGotcha() {
		// 빵뽑기 시작
		view.beforeGacha();															// 뽑기전 안내 UI
		PobbangVO vo = new PobbangVO();													
		String name = pobbangDAO.randomBbang(vo);					// 뽑은 빵이름 name에 inPut && 재고수 --
		personDAO.update(personVO);											//	money && cnt 감소
		dummy += name + "\n";
		vo.setName(name);

		view.dotDelay();																// 3초동안 초당 1씩 도트 출력
		if (name.substring(0,4).equals("로켓단빵")) {							// 이스터 에그 로켓단빵만 별도 출력
			view.roketEst();
		}

		view.afterGacha(name);														// 무슨빵인지 출력
		view.customerBuy(pobbangDAO.cutName(vo));						// 넌 내꺼야!
		String ssil = pobbangDAO.seal(vo);										//빵 뽑은후 띠부씰 작성
		view.outComeSsil(ssil);														// 띠부씰 출력
	}

	void appNum3() {
		//3번 뽑은 빵 리스트 선택
		if (dummy.equals("")) {
			view.gachaListZero();
			return;
		}
		view.gachaList();
		view.printString(dummy);
	}

	void appAdmin() {
		//히든 관리자 모드 선택
		while(true) {
			view.adminMenu();															// 관리자 모드 메인화면
			if(view.action==1) {
				//빵추가
				adminNum1();
			}
			else if(view.action==2) {
				//재료 추가
				adminNum2();
			}
			else if(view.action==3) {
				//빵삭제
				adminNum3();
			}
			else if(view.action==4) {
				//종료
				view.adminEnd();
				break;
			}
		}
	}

	void adminNum1() {
		//관리자 모드 1번 빵추가
		while (true) {
			PobbangVO vo = new PobbangVO();
			String name = view.breadAdd();
			vo.setName(name);
			int cnt = view.breadcntPlus();
			vo.setCnt(cnt);

			if(pobbangDAO.insert(vo)) {
				view.success();
			}
			else {
				view.fail();
			}
			break;
		}
	}

	void adminNum2() {
		//관리자 모드 2번 빵재고 추가
		while (true) {
			PobbangVO vo = new PobbangVO();
			vo.setCnt(0);
			view.adminView(pobbangDAO.selectAll(vo));
			int num = view.breadcntNum();												//추가할 빵 pk번호 입력
			vo.setNum(num);
			int cnt = view.breadcntPlus();													//추가할 빵 재고 수 입력
			vo.setCnt(cnt);

			if(pobbangDAO.update(vo)) {
				view.success();
			}
			else{
				view.fail();
			}
			break;
		}
	}

	void adminNum3() {
		//관리자 모드 3번 빵삭제
		while (true) {
			PobbangVO vo = new PobbangVO();
			vo.setCnt(0);
			view.adminView(pobbangDAO.selectAll(vo));
			view.deleteBread();																//빵 삭제 안내
			int num=0;
			try {
				num = Integer.parseInt(view.inputString());							//삭제할 번호 입력값 받음
			} catch (Exception e) {
				view.deleteNumWrong();
				continue;
			}
			vo.setNum(num);
			if(pobbangDAO.delete(vo)) {													//삭제에 성공할 경우
				view.deleteT();
			}
			else {
				view.deleteF();
			}
			break;
		}
	}
}