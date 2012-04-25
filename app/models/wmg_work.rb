class WmgWork < ActiveRecord::Base
  belongs_to :contract, :class_name=>"WmgContract"
  belongs_to :talent, :class_name=>"WmgTalent"
  belongs_to :role, :class_name=>"WmgRole"
end
