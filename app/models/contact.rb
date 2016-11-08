class Contact < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :tel, presence: true
  validates :email, uniqueness: true
  validates :tel, uniqueness: true



  def as_json(options = {} )
    super(options.merge(except: [:created_at, :updated_at]))
  end
end
