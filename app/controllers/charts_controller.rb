class ChartsController < ApplicationController
  before_filter :custom_user_auth

  def global_stats
    labels = months_labels
    adoptions_data = adoptions_amount
    donations_data = donations_amount
    animals_data = arrivals_amount
    volunteers_data = volunteers_amount
    render json: {
      labels: labels,
      adoptions: adoptions_data,
      donations: donations_data,
      arrivals: animals_data,
      volunteers: volunteers_data,
    }.to_json
  end

  private

  def months_labels
    labels = []
    labels.push(1.year.ago.strftime("%b") + 1.year.ago.strftime("%y"))
    labels.push(11.months.ago.strftime("%b") + 11.months.ago.strftime("%y"))
    labels.push(10.months.ago.strftime("%b") + 10.months.ago.strftime("%y"))
    labels.push(9.months.ago.strftime("%b") + 9.months.ago.strftime("%y"))
    labels.push(8.months.ago.strftime("%b") + 8.months.ago.strftime("%y"))
    labels.push(7.months.ago.strftime("%b") + 7.months.ago.strftime("%y"))
    labels.push(6.months.ago.strftime("%b") + 6.months.ago.strftime("%y"))
    labels.push(5.months.ago.strftime("%b") + 5.months.ago.strftime("%y"))
    labels.push(4.months.ago.strftime("%b") + 4.months.ago.strftime("%y"))
    labels.push(3.months.ago.strftime("%b") + 3.months.ago.strftime("%y"))
    labels.push(2.months.ago.strftime("%b") + 2.months.ago.strftime("%y"))
    labels.push(1.month.ago.strftime("%b") + 1.month.ago.strftime("%y"))
    labels
  end

  def adoptions_amount
    adoptions = []
    adoptions.push(Adoption.amount_1_year_ago)
    adoptions.push(Adoption.amount_11_months_ago)
    adoptions.push(Adoption.amount_10_months_ago)
    adoptions.push(Adoption.amount_9_months_ago)
    adoptions.push(Adoption.amount_8_months_ago)
    adoptions.push(Adoption.amount_7_months_ago)
    adoptions.push(Adoption.amount_6_months_ago)
    adoptions.push(Adoption.amount_5_months_ago)
    adoptions.push(Adoption.amount_4_months_ago)
    adoptions.push(Adoption.amount_3_months_ago)
    adoptions.push(Adoption.amount_2_months_ago)
    adoptions.push(Adoption.amount_1_month_ago)
    adoptions
  end

  def donations_amount
    donations = []
    donations.push(Donation.amount_1_year_ago)
    donations.push(Donation.amount_11_months_ago)
    donations.push(Donation.amount_10_months_ago)
    donations.push(Donation.amount_9_months_ago)
    donations.push(Donation.amount_8_months_ago)
    donations.push(Donation.amount_7_months_ago)
    donations.push(Donation.amount_6_months_ago)
    donations.push(Donation.amount_5_months_ago)
    donations.push(Donation.amount_4_months_ago)
    donations.push(Donation.amount_3_months_ago)
    donations.push(Donation.amount_2_months_ago)
    donations.push(Donation.amount_1_month_ago)
    donations
  end

  def arrivals_amount
    animals = []
    animals.push(Animal.amount_1_year_ago)
    animals.push(Animal.amount_11_months_ago)
    animals.push(Animal.amount_10_months_ago)
    animals.push(Animal.amount_9_months_ago)
    animals.push(Animal.amount_8_months_ago)
    animals.push(Animal.amount_7_months_ago)
    animals.push(Animal.amount_6_months_ago)
    animals.push(Animal.amount_5_months_ago)
    animals.push(Animal.amount_4_months_ago)
    animals.push(Animal.amount_3_months_ago)
    animals.push(Animal.amount_2_months_ago)
    animals.push(Animal.amount_1_month_ago)
    animals
  end

  def volunteers_amount
    volunteers = []
    volunteers.push(Volunteer.amount_1_year_ago)
    volunteers.push(Volunteer.amount_11_months_ago)
    volunteers.push(Volunteer.amount_10_months_ago)
    volunteers.push(Volunteer.amount_9_months_ago)
    volunteers.push(Volunteer.amount_8_months_ago)
    volunteers.push(Volunteer.amount_7_months_ago)
    volunteers.push(Volunteer.amount_6_months_ago)
    volunteers.push(Volunteer.amount_5_months_ago)
    volunteers.push(Volunteer.amount_4_months_ago)
    volunteers.push(Volunteer.amount_3_months_ago)
    volunteers.push(Volunteer.amount_2_months_ago)
    volunteers.push(Volunteer.amount_1_month_ago)
    volunteers
  end
end
