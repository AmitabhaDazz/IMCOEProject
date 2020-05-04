package com.imco.costoptimization.app;

public class SummaryTableDataSet {
	
	private String customerName;		//1
	private String subscription;		// 2 
	private String meterName;			// 3 
	private String meterRegion;			// 4
	private String resourceGroup;		// 9
	private String instanceId;			//10
	private Double UnitPrice_PAYG;		//16
	private Double PAYG_3Y;				//Z
	private Double RI_3Y_PAYGPrice;		//AC
	private Double RI_3Y_Savings_PAYG;	//AD
	private Double BreakEvenMonths_3YR;	//AH =ROUND(36*(AC42/Z42),0)
	
	public Double getUnitPrice_PAYG() {
		return UnitPrice_PAYG;
	}
	public void setUnitPrice_PAYG(Double unitPrice_PAYG) {
		UnitPrice_PAYG = unitPrice_PAYG;
	}
	public Double getPAYG_3Y() {
		return PAYG_3Y;
	}
	public void setPAYG_3Y(Double pAYG_3Y) {
		PAYG_3Y = pAYG_3Y;
	}
	public Double getRI_3Y_PAYGPrice() {
		return RI_3Y_PAYGPrice;
	}
	public void setRI_3Y_PAYGPrice(Double rI_3Y_PAYGPrice) {
		RI_3Y_PAYGPrice = rI_3Y_PAYGPrice;
	}
	public Double getRI_3Y_Savings_PAYG() {
		return RI_3Y_Savings_PAYG;
	}
	public void setRI_3Y_Savings_PAYG(Double rI_3Y_Savings_PAYG) {
		RI_3Y_Savings_PAYG = rI_3Y_Savings_PAYG;
	}
	public Double getBreakEvenMonths_3YR() {
		return BreakEvenMonths_3YR;
	}
	public void setBreakEvenMonths_3YR(Double breakEvenMonths_3YR) {
		BreakEvenMonths_3YR = breakEvenMonths_3YR;
	}
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
