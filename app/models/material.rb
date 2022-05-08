require 'csv'
class Material < ApplicationRecord
  belongs_to :user

  def self.to_csv
    attributes = %w{name explanation quantity reorder_quantity location}

    CSV.generate(headers: true ) do |csv|
      csv << attributes

      all.each do |material|
        csv << attributes.map { |attr| material.send(attr) }
      end
    end
  end
end
