package tag;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class CheckSessionHandler extends TagSupport {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private boolean test;
	
	public void setTest(boolean test){
		this.test = test;
	}
	
	@Override
	public int doStartTag() throws JspException {
		if(test){
			return EVAL_BODY_INCLUDE;
		}
		return SKIP_BODY;
	}
	
}
