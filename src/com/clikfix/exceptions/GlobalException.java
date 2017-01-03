/**
 * GlobalException class is a custom exception class to deal with all types of exception
 */
package com.clikfix.exceptions;

/**
 * @author Chaitanya Devavarapu
 *	
 */
public class GlobalException extends Exception{
	
	/**
	 * Constructor
	 * @param message
	 */
	public GlobalException(String message) {
		super(message);
	}
}
