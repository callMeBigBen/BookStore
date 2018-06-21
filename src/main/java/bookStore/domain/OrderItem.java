package bookStore.domain;

public class OrderItem
{
    private int id;
    private int num;
    private int isAfterServiceOpened;
    private int bookId;
    private int orderId;
    private int userId;
    private boolean isAfterServiceExisted;

    public boolean getIsAfterServiceExisted() {
        return isAfterServiceExisted;
    }

    public void setAfterServiceExisted(boolean afterServiceExisted) {
        isAfterServiceExisted = afterServiceExisted;
    }

    //数据库中不存在的字段
    private Book book;

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public int getIsAfterServiceOpened() {
        return isAfterServiceOpened;
    }

    public void setIsAfterServiceOpened(int isAfterServiceOpened) {
        this.isAfterServiceOpened = isAfterServiceOpened;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
