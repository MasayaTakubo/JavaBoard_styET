package DTO;

import java.io.Serializable;

public class TopThreadDTO implements Serializable {
    private static final long serialVersionUID = 1L;
    private int Thread_ID;
    private String Thread_Name;
    private String Creator_Name;

    public TopThreadDTO() {
    }

    public int getThread_ID() {
        return Thread_ID;
    }

    public void setThread_ID(int thread_ID) {
        Thread_ID = thread_ID;
    }

    public String getThread_Name() {
        return Thread_Name;
    }

    public void setThread_Name(String thread_Name) {
        Thread_Name = thread_Name;
    }

    public String getCreator_Name() {
        return Creator_Name;
    }

    public void setCreator_Name(String creator_Name) {
        Creator_Name = creator_Name;
    }
}
