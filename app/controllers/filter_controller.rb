class FilterController < ApplicationController
  has_scope :by_gender
  has_scope :by_sexual_preference
  has_scope :by_religion
  has_scope :by_city
  has_scope :by_age, using: [:min, :max], type: :hash
  has_scope :smoke, type: :boolean
  # include FilterConcern

  def filter_matches

    children_interested_in_your_gender = apply_scopes(Child).all

    params[:by_sexual_preference] = 'both'
    children_interested_in_both_genders = apply_scopes(Child).all
    potential_matches = children_interested_in_your_gender + children_interested_in_both_genders
    nonincestual_matches = potential_matches.select{|child| child.parent != current_user}
    render json: nonincestual_matches
  end

end
