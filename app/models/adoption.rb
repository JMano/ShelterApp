class Adoption < ActiveRecord::Base
  belongs_to :animal
  belongs_to :user
  belongs_to :employee

  validates_presence_of :user_id, :animal_id, :adoption_date, :adoption_type, :employee_id
  validate :adoption_not_in_future
  validate :user_cc

  def user_cc
    if user_id == ""
      errors.add(:user_id, "cannot be blank")
    end
  end

  def adoption_not_in_future
    unless adoption_date.nil?
      now = DateTime.now.to_date
      if now < adoption_date
        errors.add(:adoption_date, "cannot be in the future")
      end
    end
  end

  scope :last_month_adoptions, -> {
    where("adoption_date >= ? AND adoption_date <= ?",
      Date.today.beginning_of_month.to_date,
      Date.today.end_of_month.to_date)
  }

  def self.amount_1_year_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      1.year.ago.beginning_of_month.to_date,
      1.year.ago.end_of_month.to_date).size
  end

  def self.amount_11_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      11.months.ago.beginning_of_month.to_date,
      11.months.ago.end_of_month.to_date).size
  end

  def self.amount_10_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      10.months.ago.beginning_of_month.to_date,
      10.months.ago.end_of_month.to_date).size
  end

  def self.amount_9_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      9.months.ago.beginning_of_month.to_date,
      9.months.ago.end_of_month.to_date).size
  end

  def self.amount_8_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      8.months.ago.beginning_of_month.to_date,
      8.months.ago.end_of_month.to_date).size
  end

  def self.amount_7_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      7.months.ago.beginning_of_month.to_date,
      7.months.ago.end_of_month.to_date).size
  end

  def self.amount_6_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      6.months.ago.beginning_of_month.to_date,
      6.months.ago.end_of_month.to_date).size
  end

  def self.amount_5_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      5.months.ago.beginning_of_month.to_date,
      5.months.ago.end_of_month.to_date).size
  end

  def self.amount_4_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      4.months.ago.beginning_of_month.to_date,
      4.months.ago.end_of_month.to_date).size
  end

  def self.amount_3_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      3.months.ago.beginning_of_month.to_date,
      3.months.ago.end_of_month.to_date).size
  end

  def self.amount_2_months_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      2.months.ago.beginning_of_month.to_date,
      2.months.ago.end_of_month.to_date).size
  end

  def self.amount_1_month_ago
    Adoption.where("adoption_date >= ? AND adoption_date <= ?",
      1.month.ago.beginning_of_month.to_date,
      1.month.ago.end_of_month.to_date).size
  end
end
