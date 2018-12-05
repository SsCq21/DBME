package bean;

public class MyTools {
	public static int strToint(String str) {
		if(str==null||str.equals(""))
			str="0";
		int i=0;
		try { i=Integer.parseInt(str);		}
		catch(Exception ex) {
			System.out.println(ex.getMessage()); 
		}
		return i;
	}
	public static String toChinese(String str) {
		if(str==null) str="";
		try {
			byte a[]=str.getBytes("UTF-8");
			str=new String(a);
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage()); 
		}
		return str;
	}


}
