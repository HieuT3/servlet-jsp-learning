package com.bookstore.entity;
// Generated Oct 9, 2023, 10:30:26 PM by Hibernate Tools 4.3.6.Final

import java.util.Base64;
import java.util.Date;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.persistence.Transient;

/**
 * Book generated by hbm2java
 */
@Entity
@Table(name = "book", catalog = "bookstoredb", uniqueConstraints = @UniqueConstraint(columnNames = "title"))
@NamedQueries({
	@NamedQuery(name = "Book.findAll", query = "select b from Book b"),
	@NamedQuery(name = "Book.findByTitle", query = "select b from Book b where b.title = :title"),
	@NamedQuery(name = "Book.countAll", query = "select count(*) from Book b"),
	@NamedQuery(name = "Book.listByCategory", query = "select b from Book b join Category c on b.category.categoryId = c.categoryId and c.categoryId = :categoryId"),
	@NamedQuery(name = "Book.listNew", query = "select b from Book b order by b.publishDate desc"),
	@NamedQuery(name = "Book.search", query = "select b from Book b where b.title like '%' || :keyword || '%' "
			+ "or b.author like '%' || :keyword || '%'")
})
public class Book implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer bookId;
	private Category category;
	private String title;
	private String author;
	private String description;
	private String isbn;
	private byte[] image;
	private String base64Image;
	private float price;
	private Date publishDate;
	private Date lastUpdateTime;
	private Set<Review> reviews = new HashSet<Review>(0);
	private Set<OrderDetail> orderDetails = new HashSet<OrderDetail>(0);

	public Book() {
	}
	
	public Book(Integer bookId) {
		this.bookId = bookId;
	}

	public Book(Category category, String title, String author, String description, String isbn, byte[] image,
			float price, Date publishDate, Date lastUpdateTime) {
		this.category = category;
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
	}

	public Book(Category category, String title, String author, String description, String isbn, byte[] image,
			float price, Date publishDate, Date lastUpdateTime, Set<Review> reviews, Set<OrderDetail> orderDetails) {
		this.category = category;
		this.title = title;
		this.author = author;
		this.description = description;
		this.isbn = isbn;
		this.image = image;
		this.price = price;
		this.publishDate = publishDate;
		this.lastUpdateTime = lastUpdateTime;
		this.reviews = reviews;
		this.orderDetails = orderDetails;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "book_id", unique = true, nullable = false)
	public Integer getBookId() {
		return this.bookId;
	}

	public void setBookId(Integer bookId) {
		this.bookId = bookId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id", nullable = false)
	public Category getCategory() {
		return this.category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Column(name = "title", unique = true, nullable = false, length = 128)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "author", nullable = false, length = 64)
	public String getAuthor() {
		return this.author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	@Column(name = "description", nullable = false, length = 16777215)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "isbn", nullable = false, length = 15)
	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	@Column(name = "image", nullable = false)
	public byte[] getImage() {
		return this.image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Column(name = "price", nullable = false, precision = 12, scale = 0)
	public float getPrice() {
		return this.price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "publish_date", nullable = false, length = 10)
	public Date getPublishDate() {
		return this.publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "last_update_time", nullable = false, length = 19)
	public Date getLastUpdateTime() {
		return this.lastUpdateTime;
	}

	public void setLastUpdateTime(Date lastUpdateTime) {
		this.lastUpdateTime = lastUpdateTime;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book")
	public Set<Review> getReviews() {
		return this.reviews;
	}

	public void setReviews(Set<Review> reviews) {
		this.reviews = reviews;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "book")
	public Set<OrderDetail> getOrderDetails() {
		return this.orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}
	
	@Transient
	public String getBase64Image() {
		this.base64Image = Base64.getEncoder().encodeToString(this.image);
		return this.base64Image;
	}
	
	@Transient
	public void setBase64Image(String base64Image) {
		this.base64Image = base64Image;
	}
	
	@Transient
	public float getRatingAverage() {
		float ratingAverage = 0.0f;
		if(this.reviews.isEmpty()) return 0.0f;
		for(Review review : this.reviews) {
			ratingAverage += review.getRating();
		}
		return ratingAverage / this.reviews.size();
	} 
	
	@Transient
	public String getStar() {
		float ratingAverage = this.getRatingAverage();
		
		return this.getRatingStar(ratingAverage);
	}
	
	@Transient
	public String getRatingStar(float rating) {
		float ratingAverage = rating;
		String ans = "";
		int numStartOn = (int) ratingAverage;
		int numStar = numStartOn;
		for(int i = 1; i <= numStartOn; i++) {
			ans += "on,";
		}
		if(ratingAverage > numStartOn) {
			ans += "half,";
			numStar++;
		}
		for(int i = numStar; i < 5; i++) {
			ans += "off,";
		}
		return ans.substring(0, ans.length() - 1);
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Book other = (Book) obj;
		return Objects.equals(bookId, other.bookId);
	}
	
	

}