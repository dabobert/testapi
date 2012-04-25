class WmgWebsite < ActiveRecord::Base
  include GcdmAssociations
  
  set_primary_key :talent_website_id
end
