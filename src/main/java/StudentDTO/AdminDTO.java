package StudentDTO;

public class AdminDTO {
	private int id;
	private String name;
	private String gmail;
	private long contact;
	private String password;
	
	// constructor
	public AdminDTO(int id, String name, String gmail, long contact, String password) {
		super();
		this.id = id;
		this.name = name;
		this.gmail = gmail;
		this.contact = contact;
		this.password = password;
	}
	// getter and setter methods
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
 
	
	
}
