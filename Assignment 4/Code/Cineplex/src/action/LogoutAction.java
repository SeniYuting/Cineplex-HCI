package action;

public class LogoutAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public String execute() throws Exception {
		session().invalidate();
		return SUCCESS;
	}

}
