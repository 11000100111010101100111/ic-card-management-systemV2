package com.nhky.utils;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.lang.reflect.Field;

import org.apache.log4j.Logger;

/**
 * Title : logUtil
 *@{author} 四原色
 *@{date} 2021年11月1日
 *@{description} 日志工具类
*/

public class LogUtil {

	private final static Logger log = Logger.getLogger(LogUtil.class);

	/**
	 * types 常见的数据类型，可以直接输出值。
	 */
	private final static String[] KEY_TYPES = {
			"java.lang.String",
			"java.lang.Integer",
			"int",
			"java.lang.Double",
			"double",
			"java.lang.Float",
			"float",
			"java.lang.Long",
			"long",
			"java.lang.Char",
			"char",
			"java.lang.Boolean",
			"boolean"
	};

	/**
	 *@{author} xjh
	 *@{date} 2021年11月1日
	 *@{tags} @param objects
	 * info输出信息
	 */
	public static void info(Object...objects) {
		StackTraceElement[] stack = Thread.currentThread().getStackTrace();
		String result = getPrintInfo(stack[2],objects);
		log.info(result);
	}

	/**
	 *@{author} 四原色
	 *@{date} 2021年11月1日
	 *@{tags} @param objects
	 * debug输出信息
	 */
	public static void debug(Object...objects) {
		StackTraceElement[] stack = Thread.currentThread().getStackTrace();
		String result = getPrintInfo(stack[2],objects);
		log.debug(result);
	}

	/**
	 *@{author} 四原色
	 *@{date} 2021年11月1日
	 *@{tags} @param objects
	 * error 输出信息
	 */
	public static void error(Object...objects) {
		StackTraceElement[] stack = Thread.currentThread().getStackTrace();
		String result = getPrintInfo(stack[2],objects);
		log.error(result);
	}


	/**
	 *@{author} 四原色
	 *@{date} 2021年11月1日
	 *@{tags} @param object
	 *@{tags} @return 获取参数值
	 */
	private static String getValue(Object object) {
		StringBuilder builder = new StringBuilder();
		int i = 0;
		//如果是异常类，打印异常信息。
		if (object instanceof Exception) {
			String message = ((Exception) object).getMessage();
			builder.append("Message:"+message+";");
			StringWriter sw = new StringWriter();
			//将详细异常用流输出
			PrintWriter pw = new PrintWriter(sw,true);
			((Exception) object).printStackTrace(pw);
			pw.flush();
			sw.flush();
			builder.append(sw.toString());
			return builder.toString();
		}
		if(object != null) {
			String name  = object.getClass().getName();
			//常见数据类型
			for(String type : KEY_TYPES) {
				if(name.equals(type)) {
					i++;
					builder.append("paramType="+name+":"+String.valueOf(object)).append(",");
				}
			}
			//实体,打印地址或者值
			if(i==0) {
				try {
					Field[] fields = object.getClass().getDeclaredFields();
					for(Field f: fields) {
						//允许读取私有属性
						f.setAccessible(true);
						String filedName = f.getType().getName();
						builder.append("paramType="+filedName+":"+f.get(object)).append(" ");
					}
				}catch (Exception e) {
					e.printStackTrace();
					builder.append(e.getMessage());
				}
			}
		}else {
			builder.append("参数为null");
		}
		return builder.toString();
	}

	/**
	 *@{author} 四原色
	 *@{date} 2021年11月1日
	 *@{tags} @return
	 */
	private static String getPrintInfo(StackTraceElement element,Object...objects) {
		String fileName  = element.getFileName();
		String className = element.getClassName();
		String methodName = element.getMethodName();
		int lineNumber = element.getLineNumber();
		StringBuilder builder = new StringBuilder();
		builder.append("[");
		builder.append("fileName="+fileName).append(";");
		builder.append("ClassName="+className).append(";");
		builder.append("methodName="+methodName).append(";");
		//有参数就打印
		if(objects.length > 0) {
			builder.append("paramter=[");
			for(Object obj : objects) {
				builder.append(getValue(obj));
			}
			builder.append("];");
		}
		builder.append("lineNumber="+lineNumber).append(".");
		return builder.toString();
	}

}