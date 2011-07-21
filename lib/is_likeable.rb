require 'is_likeable/engine' if defined?(Rails) && Rails::VERSION::MAJOR == 3
require 'youtube_url'

module ActiveRecord
  module IsLikeable #:nodoc:
    module ClassMethods #:nodoc:
      
      # Takes a hash of instance methods to pre-populate fb_like attributes
      # is_likeable :redirect_url => :profile_link
      def is_likeable(options={})
        class_eval <<-EOV
          has_one :fb_like, :as => :owner, :dependent => :destroy
            accepts_nested_attributes_for :fb_like
        EOV
        
        # TODO -- initialize FbLike with 'default' values passed in from the Owner
        
        #default_attrs =  ''
        #default_attrs += "@title=           #{ self.send( options[:title].to_s            )   }"  if options[:title]
        #default_attrs += "@description=     #{ self.send( options[:description].to_s      )   }"  if options[:description]     
        #default_attrs += "@youtube_id=      #{ self.send( options[:youtube_id].to_s       )   }"  if options[:youtube_id]          
        #default_attrs += "@redirect_to_url= #{ self.send( options[:redirect_to_url].to_s  )   }"  if options[:redirect_to_url]     
        ##self.image=           #{options[:image]           ? owner.send( options[:image].to_s            )  : ''   }
        #
        #FbLike.class_eval <<-EOS
        #  def initialize(*params)
        #    super(*params)
        #    #{default_attrs}
        #  end
        #EOS
        
      end
    end

    module InstanceMethods
      
    end

    def self.included(receiver)
      receiver.extend         ClassMethods
      receiver.send :include, InstanceMethods
    end
  end
end

ActiveRecord::Base.class_eval { include ActiveRecord::IsLikeable }