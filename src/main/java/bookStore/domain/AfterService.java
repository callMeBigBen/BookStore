package bookStore.domain;

import org.springframework.stereotype.Repository;


public class AfterService
{
    private int id;
    private int num;
    private String type;
    private String reason;
    private String state = HANDLING;
    private int orderItemId;
    private OrderItem orderItem;

    public static String HANDLING = "待处理";
    public static String SUCCESS = "成功";
    public static String FAILED = "失败";

    public static String REFUND = "退款退货";
    public static String EXCHANGE = "换货";

    public OrderItem getOrderItem() {
        return orderItem;
    }

    public void setOrderItem(OrderItem orderItem) {
        this.orderItem = orderItem;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getOrderItemId() {
        return orderItemId;
    }

    public void setOrderItemId(int orderItemId) {
        this.orderItemId = orderItemId;
    }
}
