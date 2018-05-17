package bookStore.domain;

public class Order
{
    public String getOrderId()
    {
        return orderId;
    }

    public void setOrderId(String orderId)
    {
        this.orderId = orderId;
    }

    private String orderId;

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }

    private String address;

    public String getUserId()
    {
        return userId;
    }

    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    private String userId;

    public String getTotalPrice()
    {
        return totalPrice;
    }

    public void setTotalPrice(String totalPrice)
    {
        this.totalPrice = totalPrice;
    }

    private String totalPrice;
}
