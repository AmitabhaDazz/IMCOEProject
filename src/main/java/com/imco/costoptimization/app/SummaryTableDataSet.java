package com.imco.costoptimization.app;

public class SummaryTableDataSet {
	
	private String customerName;		//1
	private String subscription;		// 2 
	private String meterName;			// 3 
	private String meterRegion;			// 4
	private String resourceGroup;		// 9
	private String instanceId;			//10
public String getResourceGroup() {
		return resourceGroup;
	}
	public void setResourceGroup(String resourceGroup) {
		this.resourceGroup = resourceGroup;
	}
	public String getInstanceId() {
		return instanceId;
	}
	public void setInstanceId(String instanceId) {
		this.instanceId = instanceId;
	}
	//	private int countOfMeterName;
	private double payG_1y;				//17
	private double ri_1Y_PAYGPrice;    	//20
	private double ri_1Y_Savings_PAYG; 	//payG_1y-ri_1Y_PAYGPrice
	private double breakEvenMOnths_1YR; 	// ROUND(12*(ri_1Y_PAYGPrice/ri_1Y_Savings_PAYG),2)
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getSubscription() {
		return subscription;
	}
	public void setSubscription(String subscription) {
		this.subscription = subscription;
	}
	public String getMeterName() {
		return meterName;
	}
	public void setMeterName(String meterName) {
		this.meterName = meterName;
	}
	public String getMeterRegion() {
		return meterRegion;
	}
	public void setMeterRegion(String meterRegion) {
		this.meterRegion = meterRegion;
	}

	/*
	 * public int getCountOfMeterName() { return countOfMeterName; } public void
	 * setCountOfMeterName(int countOfMeterName) { this.countOfMeterName =
	 * countOfMeterName; }
	 */
	
	public double getPayG_1y() {
		return payG_1y;
	}
	public void setPayG_1y(double payG_1y) {
		this.payG_1y = payG_1y;
	}
	public double getRi_1Y_PAYGPrice() {
		return ri_1Y_PAYGPrice;
	}
	public void setRi_1Y_PAYGPrice(double ri_1y_PAYGPrice) {
		ri_1Y_PAYGPrice = ri_1y_PAYGPrice;
	}
	public double getRi_1Y_Savings_PAYG() {
		return ri_1Y_Savings_PAYG;
	}
	public void setRi_1Y_Savings_PAYG(double ri_1y_Savings_PAYG) {
		ri_1Y_Savings_PAYG = ri_1y_Savings_PAYG;
	}
	public double getBreakEvenMOnths_1YR() {
		return breakEvenMOnths_1YR;
	}
	public void setBreakEvenMOnths_1YR(double breakEvenMOnths_1YR) {
		this.breakEvenMOnths_1YR = breakEvenMOnths_1YR;
	}	
}
