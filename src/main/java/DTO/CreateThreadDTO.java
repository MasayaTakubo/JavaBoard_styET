package DTO;


public class CreateThreadDTO {
    private int thread_ID;
    private String thread_Name;
    private String user_Name;


    public int getThread_ID() {
        return thread_ID;
    }

    public void setThread_ID(int thread_ID) {
        this.thread_ID = thread_ID;
    }

    public String getThread_Name() {
        return thread_Name;
    }

    public void setThread_Name(String thread_Name) {
        this.thread_Name = thread_Name;
    }

    public String getUser_Name() {
        return user_Name;
    }

    public void setUser_Name(String user_Name) {
        this.user_Name = user_Name;
    }
}
