package DTO;

import java.sql.Timestamp;
import java.util.List;

public class ThreadInfoDTO {
    private int postId;
    private int threadId;
    private String content;
    private String postUserName;
    private Timestamp createTime;
    private int likes;
    private int postReplyId;

    private String threadName;
    private List<ThreadInfoDTO> childPosts; // 子投稿のリストを追加

    // getterとsetterも追加
    public List<ThreadInfoDTO> getChildPosts() {
        return childPosts;
    }

    public void setChildPosts(List<ThreadInfoDTO> childPosts) {
        this.childPosts = childPosts;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getThreadId() {
        return threadId;
    }

    public void setThreadId(int threadId) {
        this.threadId = threadId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPostUserName() {
        return postUserName;
    }

    public void setPostUserName(String postUserName) {
        this.postUserName = postUserName;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getLikes() {
        return likes;
    }

    public void setLikes(int likes) {
        this.likes = likes;
    }

    public int getPostReplyId() {
        return postReplyId;
    }

    public void setPostReplyId(int postReplyId) {
        this.postReplyId = postReplyId;
    }

    public String getThreadName() {
        return threadName;
    }

    public void setThreadName(String threadName) {
        this.threadName = threadName;
    }

    // 他のgetterとsetterは省略
}
