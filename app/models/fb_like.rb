class FbLike < ActiveRecord::Base
  has_attached_file :image, 
                    :styles => { :for_status => "130x110>", :thumbnail => "100x100>" }
  
  belongs_to :owner,    :polymorphic => true
  validates_presence_of [:redirect_to_url, :title] # the only attributes *required* to keep the system running
  
  
  before_save :standardize_video_to_youtube_id
private
  def standardize_video_to_youtube_id
    if youtube_id =~ /youtube.com/
      self.youtube_id = YoutubeApi.extract_youtube_id(youtube_id)
    end
  end
  

end
