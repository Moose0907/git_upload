package com.cathaybk.practice.nt50349.b;

public class Practice1_NineNineTable {

	public static void main(String[] args) {
		for (int i = 1; i < 10; i++) {
			for (int j = 2; j < 10; j++) {
				System.out.printf("%s" + "*" + "%s" + "=" + "%s" + "\t", j, i, j * i);
			}
			System.out.println();
		}

	}

}
