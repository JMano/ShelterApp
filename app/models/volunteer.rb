class Volunteer < ActiveRecord::Base
  belongs_to :employee
  belongs_to :user
  validates_presence_of :employee_id, :user_id
  validate :user_cc

  def user_cc
    if user_id == ""
      errors.add(:user_id, "cannot be blank")
    end
    ids = Volunteer.all.collect(&:user_id)
    if user_id.in?(ids)
      errors.add(:user_id, "- cc already register as volunteer")
    end
  end

  def self.amount_1_year_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      1.year.ago.beginning_of_month,
      1.year.ago.end_of_month).size
  end

  def self.amount_11_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      11.months.ago.beginning_of_month,
      11.months.ago.end_of_month).size
  end

  def self.amount_10_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      10.months.ago.beginning_of_month,
      10.months.ago.end_of_month).size
  end

  def self.amount_9_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      9.months.ago.beginning_of_month,
      9.months.ago.end_of_month).size
  end

  def self.amount_8_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      8.months.ago.beginning_of_month,
      8.months.ago.end_of_month).size
  end

  def self.amount_7_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      7.months.ago.beginning_of_month,
      7.months.ago.end_of_month).size
  end

  def self.amount_6_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      6.months.ago.beginning_of_month,
      6.months.ago.end_of_month).size
  end

  def self.amount_5_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      5.months.ago.beginning_of_month,
      5.months.ago.end_of_month).size
  end

  def self.amount_4_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      4.months.ago.beginning_of_month,
      4.months.ago.end_of_month).size
  end

  def self.amount_3_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      3.months.ago.beginning_of_month,
      3.months.ago.end_of_month).size
  end

  def self.amount_2_months_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      2.months.ago.beginning_of_month,
      2.months.ago.end_of_month).size
  end

  def self.amount_1_month_ago
    Volunteer.where("created_at >= ? AND created_at <= ?",
      1.month.ago.beginning_of_month,
      1.month.ago.end_of_month).size
  end
end
