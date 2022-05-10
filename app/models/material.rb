require 'csv'
class Material < ApplicationRecord
  belongs_to :user
  belongs_to :status
  before_update :set_sent_date

  include PublicActivity::Model
  tracked owner: Proc.new{ |controller, model| controller.current_user }

  has_many :activities, as: :trackable, class_name: 'PublicActivity::Activity',
           dependent: :destroy

  def self.to_csv
    # %w(foo bar) is a shortcut for ["foo", "bar"]
    attributes = %w{name explanation quantity reorder_quantity location}

    CSV.generate(headers: true ) do |csv|
      csv << attributes

      all.each do |material|
        csv << attributes.map do |attr|
          material.send(attr)
        end
      end
    end
  end


  def set_sent_date
    if self.status.name == 'In Stock' and self.reorder_quantity != 0 and self .reorder_quantity != nil
      self.quantity = self.quantity + self.reorder_quantity
      self.reorder_quantity = 0
    end
  end
end
