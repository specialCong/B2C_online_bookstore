package edu.iss.ects.exception;

/**
 * 专门处理订单表的异常类
 * 
 * @author Microwind
 * 
 */
public class ManagerOrderException extends Exception {

	public ManagerOrderException(String message) {

		super("订单表操作出现异常，异常信息为：" + message);

	}

}
