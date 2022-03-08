package bean;

public class BreedBean {
	private int breed_id;
	private String breed_name;
	private String breed_Description;
	private int category_id;
	public int getBreed_id() {
		return breed_id;
	}
	public void setBreed_id(int breed_id) {
		this.breed_id = breed_id;
	}
	public String getBreed_name() {
		return breed_name;
	}
	public void setBreed_name(String breed_name) {
		this.breed_name = breed_name;
	}
	public String getBreed_Description() {
		return breed_Description;
	}
	public void setBreed_Description(String breed_Description) {
		this.breed_Description = breed_Description;
	}
	public int getCategory_id() {
		return category_id;
	}
	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}
}
