package sign;

import javax.servlet.http.*;

public interface Command {
	public String execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
