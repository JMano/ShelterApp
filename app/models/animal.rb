include AnimalsHelper

class Animal < ActiveRecord::Base
  include ActionView::Helpers::AssetUrlHelper
  before_validation :set_status

  has_many :adoptions
  has_many :users, through: :adoptions
  belongs_to :breed

  has_many :animal_images
  accepts_nested_attributes_for :animal_images

  serialize :images, JSON

  scope :last_month_arrivals, -> {
    where("entry_date >= ? AND entry_date <= ?",
      Date.today.last_month.beginning_of_month.to_date,
      Date.today.last_month.end_of_month.to_date)
  }
  validates_presence_of :name, :date_of_birth, :size, :entry_date, :animal_type, :gender, :breed
  validate :entry_date_after_birth
  validate :entry_date_and_date_of_birth

  def endangered?
    endangered
  end

  def first_image_url
    if !animal_images.empty?
      animal_images.first.image.standard.url
    else
      asset_path("animal_placeholder.png")
    end
  end

  def self.amount_1_year_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      1.year.ago.beginning_of_month.to_date,
      1.year.ago.end_of_month.to_date).size
  end

  def self.amount_11_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      11.months.ago.beginning_of_month.to_date,
      11.months.ago.end_of_month.to_date).size
  end

  def self.amount_10_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      10.months.ago.beginning_of_month.to_date,
      10.months.ago.end_of_month.to_date).size
  end

  def self.amount_9_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      9.months.ago.beginning_of_month.to_date,
      9.months.ago.end_of_month.to_date).size
  end

  def self.amount_8_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      8.months.ago.beginning_of_month.to_date,
      8.months.ago.end_of_month.to_date).size
  end

  def self.amount_7_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      7.months.ago.beginning_of_month.to_date,
      7.months.ago.end_of_month.to_date).size
  end

  def self.amount_6_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      6.months.ago.beginning_of_month.to_date,
      6.months.ago.end_of_month.to_date).size
  end

  def self.amount_5_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      5.months.ago.beginning_of_month.to_date,
      5.months.ago.end_of_month.to_date).size
  end

  def self.amount_4_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      4.months.ago.beginning_of_month.to_date,
      4.months.ago.end_of_month.to_date).size
  end

  def self.amount_3_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      3.months.ago.beginning_of_month.to_date,
      3.months.ago.end_of_month.to_date).size
  end

  def self.amount_2_months_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      2.months.ago.beginning_of_month.to_date,
      2.months.ago.end_of_month.to_date).size
  end

  def self.amount_1_month_ago
    Animal.where("entry_date >= ? AND entry_date <= ?",
      1.month.ago.beginning_of_month.to_date,
      1.month.ago.end_of_month.to_date).size
  end

  def self.all_animals_filter
    Animal.where(status: [0, 1])
  end

  def self.filter_animal_by_type(type)
    if type == 0
      Animal.where(status: [0, 1])
    else
      Animal.where(animal_type: type, status: [0, 1])
    end
  end

  def self.filter_animals_by_size(size)
    Animal.where(size: size, status: [0, 1])
  end

  def self.filter_animals_by_breed(breed)
    Animal.where(breed: breed, status: [0, 1])
  end

  def self.filter_animals_by_age(age)
    case age
    when 0
      Animal.where("date_part('year', age(date_of_birth)) < 1").where(status: [0, 1])
    when 1
      Animal.where("date_part('year', age(date_of_birth)) >= 1 AND date_part('year', age(date_of_birth)) < 3").where(status: [0, 1])
    else
      Animal.where("date_part('year', age(date_of_birth)) >= 3").where(status: [0, 1])
    end
  end

  def self.prepare_response(animals)
    response = []
    animals.each do |animal|
      has_image = !animal.animal_images.empty?
      img_url = animal.first_image_url
      age = ""
      age_in_years = AnimalsHelper.age_in_years(animal.date_of_birth)
      if age_in_years == 0
        age_in_months = age_in_months(animal.date_of_birth)
        age = if age_in_months == 0
                "<= 1 Month"
              else
                age_in_months.to_s + " (Month)"
              end
      else
        age = age_in_years.to_s + " (Years)"
      end
      gender = if animal.gender == 0
                 "fa fa-venus girl-color"
               else
                 "fa fa-mars boy-color"
               end
      response.push('id': animal.id, 'name': animal.name, 'description': animal.description, 'has_image': has_image, 'img_url': img_url, 'age': age, 'gender': gender, 'danger': animal.endangered?)
    end
    response
  end

  private

  def set_status
    self.status ||= 0
  end

  def entry_date_after_birth
    if !entry_date.nil? && !date_of_birth.nil?
      if entry_date <= date_of_birth
        errors.add(:entry_date, "must be after animal's birth")
      end
    end
  end

  def entry_date_and_date_of_birth
    if !entry_date.nil? && !date_of_birth.nil?
      now = DateTime.now.to_date
      if now < date_of_birth
        errors.add(:date_of_birth, "cannot be in the future")
      elsif now < entry_date
        errors.add(:entry_date, "cannot be in the future")
      end
    end
  end
end
