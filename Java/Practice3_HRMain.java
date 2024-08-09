package com.cathaybk.practice.nt50349.b;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class Practice3_HRMain {

	public static void main(String[] args) {
		List<Employee> employeeList = new ArrayList<>();
		employeeList.add(new Sales("張志城", "信用卡部", 35000, 6000));
		employeeList.add(new Sales("林大鈞", "保代部", 38000, 4000));
		employeeList.add(new Supervisor("李中白", "資訊部", 65000));
		employeeList.add(new Supervisor("林小中", "理財部", 80000));
		for (Employee emp : employeeList) {
			emp.printInfo();
		}

//		Practice_4_開始

		Collections.sort(employeeList, (o1, o2) -> {                         //排序出supervisor在前
			if (o1 instanceof Supervisor && o2 instanceof Supervisor) {
				return 0;
			} else if (o1 instanceof Supervisor) {
				return -1;
			} else if (o2 instanceof Supervisor) {
				return 1;
			} else {
				return 0;
			}
		});

		try (BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Practice4\\output.csv"));) {
			writer.write(new String(new byte[] { (byte) 0xEF, (byte) 0xBB, (byte) 0xBF }));
			for (Employee emp : employeeList) {

				if (emp instanceof Supervisor) {

					Supervisor emp1 = (Supervisor) emp;
					writer.write(emp.getName() + "," + emp1.getPayment());
					writer.newLine();

				} else {
					Sales emp2 = (Sales) emp;
					writer.write(emp.getName() + "," + emp2.getPayment());
					writer.newLine();
				}

			}

			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
