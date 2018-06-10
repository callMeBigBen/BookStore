package bookStore.util;

public class textAreaHandler
{
    public static String convertReason(String reason)
    {
        String convertedReason = reason.replace("\n", "\\n");

        return convertedReason;
    }
}
