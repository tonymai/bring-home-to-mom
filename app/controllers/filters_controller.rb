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
    interests = params[:interests].split(',').map! { |id| Interest.find(id) }
    values = params[:values].split(',').map! { |id| Value.find(id) }

    potential_matches = apply_scopes(Child).all
    potential_matches = potential_matches.select { |child| child.parent != current_user }

    interests.each do |interest|
      potential_matches = potential_matches.select { |child| child.interests.include?(interest) }
    end

    values.each do |value|
      potential_matches = potential_matches.select { |child| child.values.include?(value) }
    end


    render json: potential_matches
  end

end
