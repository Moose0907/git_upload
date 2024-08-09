package com.cathaybk.practice.nt50349.b;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class Practice2_RandomLotto {

	public static void main(String[] args) {
		Random random = new Random();
		List<Integer> numberList = new ArrayList<>();
		while (numberList.size() < 7) {
			int a = random.nextInt(49) + 1;
			if (!numberList.contains(a)) {
				numberList.add(a);
			}
		}
		System.out.print("排序前 :");
		for (int randomnumber : numberList) {
			System.out.print(randomnumber + " ");
		}
		System.out.println();
		Collections.sort(numberList);
		System.out.print("排序後 :");
		for (int randomnumber2 : numberList)
			System.out.print(randomnumber2 + " ");

	}
}
