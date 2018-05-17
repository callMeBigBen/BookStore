package bookStore.domain;

import org.springframework.beans.factory.annotation.Autowired;

public class Book
{
    public String getBookId()
    {
        return bookId;
    }

    public void setBookId(String bookId)
    {
        this.bookId = bookId;
    }

    private String bookId;

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    private String name;

    public String getRemainNum()
    {
        return remainNum;
    }

    public void setRemainNum(String remainNum)
    {
        this.remainNum = remainNum;
    }

    private String remainNum;

    public String getPrice()
    {
        return price;
    }

    public void setPrice(String price)
    {
        this.price = price;
    }

    private String price;

    public String getCategory()
    {
        return category;
    }

    public void setCategory(String category)
    {
        this.category = category;
    }

    private String category;
}
