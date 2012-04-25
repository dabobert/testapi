class WmgSocialMediaAccount < ActiveRecord::Base
  self.table_name = 'wmg_social_media'
  set_primary_key :social_media_id
end
