class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include PublicActivity::Model
  tracked
end
