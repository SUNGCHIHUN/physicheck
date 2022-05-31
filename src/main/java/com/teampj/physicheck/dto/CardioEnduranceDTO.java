package com.teampj.physicheck.dto;

// 심폐지구력
public class CardioEnduranceDTO {

	private int cardioEnduranceNo;
	private float run3km;
	private float balkeProtocol;
	private int run3kmResult;
	private int balkeProtocolResult;
	
	
	public CardioEnduranceDTO() {}



	public int getCardioEnduranceNo() {
		return cardioEnduranceNo;
	}

	public void setCardioEnduranceNo(int cardioEnduranceNo) {
		this.cardioEnduranceNo = cardioEnduranceNo;
	}

	public float getRun3km() {
		return run3km;
	}

	public void setRun3km(float run3km) {
		this.run3km = run3km;
	}

	public float getBalkeProtocol() {
		return balkeProtocol;
	}

	public void setBalkeProtocol(float balkeProtocol) {
		this.balkeProtocol = balkeProtocol;
	}

	public int getRun3kmResult() {
		return run3kmResult;
	}

	public void setRun3kmResult(int run3kmResult) {
		this.run3kmResult = run3kmResult;
	}

	public int getBalkeProtocolResult() {
		return balkeProtocolResult;
	}

	public void setBalkeProtocolResult(int balkeProtocolResult) {
		this.balkeProtocolResult = balkeProtocolResult;
	}

	@Override
	public String toString() {
		return "CardioEnduranceDTO [cardioEnduranceNo=" + cardioEnduranceNo + ", run3km=" + run3km + ", balkeProtocol="
				+ balkeProtocol + ", run3kmResult=" + run3kmResult + ", balkeProtocolResult=" + balkeProtocolResult
				+ "]";
	}
}