class Donation < ActiveRecord::Base
  belongs_to :user
  belongs_to :employee

  validates_presence_of :user_id, :donation_date, :donation_type, :employee_id, :quantity
  validate :donation_not_in_future
  validate :user_cc
  validates_numericality_of :quantity, greater_than_or_equal_to: 0

  def user_cc
    if user_id == ""
      errors.add(:user_id, "cannot be blank")
    end
  end

  def donation_not_in_future
    unless donation_date.nil?
      now = DateTime.now.to_date
      if now < donation_date
        errors.add(:donation_date, "cannot be in the future")
      end
    end
  end

  def self.amount_1_year_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      1.year.ago.beginning_of_month.to_date,
      1.year.ago.end_of_month.to_date).size
  end

  def self.amount_11_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      11.months.ago.beginning_of_month.to_date,
      11.months.ago.end_of_month.to_date).size
  end

  def self.amount_10_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      10.months.ago.beginning_of_month.to_date,
      10.months.ago.end_of_month.to_date).size
  end

  def self.amount_9_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      9.months.ago.beginning_of_month.to_date,
      9.months.ago.end_of_month.to_date).size
  end

  def self.amount_8_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      8.months.ago.beginning_of_month.to_date,
      8.months.ago.end_of_month.to_date).size
  end

  def self.amount_7_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      7.months.ago.beginning_of_month.to_date,
      7.months.ago.end_of_month.to_date).size
  end

  def self.amount_6_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      6.months.ago.beginning_of_month.to_date,
      6.months.ago.end_of_month.to_date).size
  end

  def self.amount_5_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      5.months.ago.beginning_of_month.to_date,
      5.months.ago.end_of_month.to_date).size
  end

  def self.amount_4_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      4.months.ago.beginning_of_month.to_date,
      4.months.ago.end_of_month.to_date).size
  end

  def self.amount_3_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      3.months.ago.beginning_of_month.to_date,
      3.months.ago.end_of_month.to_date).size
  end

  def self.amount_2_months_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      2.months.ago.beginning_of_month.to_date,
      2.months.ago.end_of_month.to_date).size
  end

  def self.amount_1_month_ago
    Donation.where("donation_date >= ? AND donation_date <= ?",
      1.month.ago.beginning_of_month.to_date,
      1.month.ago.end_of_month.to_date).size
  end
end
