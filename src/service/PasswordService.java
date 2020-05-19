package service;

import org.apache.commons.codec.digest.DigestUtils;
/**
 * @Author : Choi
 * */
public class PasswordService {
	public static String sha256(String string) {
		System.out.println("Plain Text: " + string);
		String sha256hex = DigestUtils.sha256Hex(string);
		System.out.println("Encoded Text:" + sha256hex);
		return sha256hex;
	}

	public static void main(String[] args) {
		sha256("1234");
		sha256("1234");
		sha256("test");
	}

}
