package StudentDTO;

import java.io.InputStream;

public class StudentDTO {
	private int id;
	private String name;
	private double chemistry;
	private double physics;
	private double maths;
	private InputStream photo;
	private String gmail;
	
	// constructor
	public StudentDTO(int id, String name, double chemistry, double physics, double maths,InputStream photo,String gmail) {
		super();
		this.id = id;
		this.name = name;
		this.chemistry = chemistry;
		this.physics = physics;
		this.maths = maths;
		this.photo=photo;
		this.gmail=gmail;
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

	public double getChemistry() {
		return chemistry;
	}
	public void setChemistry(double chemistry) {
		this.chemistry = chemistry;
	}

	public double getPhysics() {
		return physics;
	}
	public void setPhysics(double physics) {
		this.physics = physics;
	}

	public double getMaths() {
		return maths;
	}
	public void setMaths(double maths) {
		this.maths = maths;
	}
	
	public InputStream getPhoto() {
		return photo;
	}
	public void setPhoto(InputStream photo) {
		this.photo = photo;
	}
	
	public String getGmail() {
		return gmail;
	}
	public void setGmail(String gmail) {
		this.gmail = gmail;
	}

}
