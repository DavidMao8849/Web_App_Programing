package dao;

public class FeedObj {
    private String id, content, ts, images,video;
	
    public FeedObj(String id, String content, String ts, String images, String video) {
        this.id = id;
        this.content = content;
        this.ts = ts;
        this.images = images;
        this.video = video;
    }

    public String getId() { return this.id; }
    public String getContent() { return this.content; }
    public String getTs() { return this.ts; }
    public String getImages() { return this.images; }
    public String getVideo() { return video; }
}
