# IsLikeable
### Facebook 'like' any ActiveRecord object

Facebook's 'like' & 'share' system is based around sharing unique URLs that use metadata to describe the page.  However, sometimes we want to 'like' an Object, (or multiple Objects) instead of a single page.   
IsLikeable makes ActiveRecord objects likeable by serving-up metadata on your object's behalf.  

# Usage
### Model
  Add <code>is_likeable</code> to your model
  <pre>
  class Product < ActiveRecord::Base
    is_likeable
  
    ...
  </pre>

Optionally define likeable attributes using the class' instance methods.
  <pre>
  class Product < ActiveRecord::Base
    
    is_likeable :title =>       :name,                # attribute accessor
                :description => :description,         # attribute accessor
                :image =>       :product_image_url    # instance method
    
    
    def product_image_url
      self.image.url(:for_facebook_newsfeed)
    end
    ...
  </pre>


### Form Helper
This gem also provides a number of Helpers for quick integration.
  
TODO


### Button Helpers

TODO


Copyright (c) 2011 Chip Miller, released under the MIT license