class Company < ActiveRecord::Base
  scope :by_name, -> name { where('name like ?', "#{name}%") if name.present? }
end
