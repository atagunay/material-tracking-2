require 'csv'
class Material < ApplicationRecord
  belongs_to :user

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
end
