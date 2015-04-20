class FiltersController < ApplicationController
  autocomplete :interest, :name, limit: 10
  autocomplete :value, :name, limit: 10

  has_scope :by_gender
  has_scope :by_sexual_preference
  has_scope :by_religion
  has_scope :by_city
  has_scope :by_age, using: [:min, :max], type: :hash
  has_scope :smoke, type: :boolean
  # include FilterConcern

  def filter_matches
    potential_matches = apply_scopes(Child).all
    potential_matches = potential_matches.select {|child| child.parent != current_user}

    # empty_arr = []
    # selected_interests = params[:selected_interest]
    # selected_interests.each do |interest|
      # empty_arr << potential_matches.select! {|child| child.interests.include?(interest) }
    # end


    render json: potential_matches
  end

  # def autocomplete_interests


  # end

  # def autocomplete_values

  # end

end
