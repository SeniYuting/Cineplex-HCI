package service.impl;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import service.MemberService;

public class Auto extends QuartzJobBean {
	private boolean isRunning = false;
	
	private MemberService memberService;
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	@Override
	protected void executeInternal(JobExecutionContext arg0)
			throws JobExecutionException {
		if(!isRunning){
			isRunning = true;
			memberService.autoMember();
			isRunning = false;
		}
	}

}
