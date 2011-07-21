module IsLikeable
  module FbLikeHelper
    # Paperclip Preview Mixin  
    module PaperclipHelper
      def paperclip_field(method, options = {})
        pic = self.object.send(method).exists? && self.object.send(method).url(:thumbnail)
        options.merge!({:style=>"vertical-align:top\; display:inline-block\;"}) if pic
      
        field = (pic ? "<img src='#{pic}' alt='#{method.to_s.humanize}' />" : '') + self.file_field(method, options)
        field.html_safe
      rescue
        self.file_field(method, options).html_safe
      end
    end
    ActionView::Helpers::FormBuilder.send( :include, PaperclipHelper )


    def fb_meta_form_fields(form_builder_object)
      render 'is_likeable/admin/form_fields', :f => form_builder_object
    end
    
    def like_button_for(target_object)
      raise 'This object is not associated with "FbLikeData"' unless target_object.respond_to? 'fb_like'
      return '' unless target_object.fb_like

      like_button(AppConfig[:application_domain]+(fb_like_path(target_object.fb_like)))
    end
    
    def share_button_for(target_object)
      raise 'This object is not associated with "FbLikeData"' unless target_object.respond_to? 'fb_like'
      return '' unless target_object.fb_like

      share_button(AppConfig[:application_domain]+(fb_like_path(target_object.fb_like)))
    end
    
    def like_button(path)
      width = 80
      raw "<fb:like href='#{path}' layout='button_count' width='#{width}'></fb:like>"
    end

    def share_button(path)
      raw "<fb:share-button href='#{path}' type='button' id='fb-share'></fb:share-button>"
    end
    
  end
end