package com.cathaybk.practice.nt50349.b;

public class Supervisor extends Employee {
	private int payment;

	public Supervisor(String name, String department, int salary) {
		super(name, department, salary);
		this.payment = salary;
	}

	@Override
	public void printInfo() {
		super.printInfo();
		System.out.println("總計: " + payment);

	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

}
