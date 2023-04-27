package myPkg;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BCommand {
	// 미완성 메서드. 두가지 매개변수 타입 외우기.
	//  public abstract가 자동으로 들어온다.(일반 메서드는 default 가 붙음)
	void execute(HttpServletRequest request, HttpServletResponse response);
	// public static final int a;
	// 즉, 모든 멤버변수에는 public static final 이 자동으로 붙는다.
}