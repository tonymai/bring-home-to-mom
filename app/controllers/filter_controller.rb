class FilterController < ApplicationController
  has_scope :by_gender
  has_scope :by_sexual_preference
  has_scope :by_religion
  has_scope :by_city
  has_scope :by_age, using: [:min, :max], type: :hash
  has_scope :smoke, type: :boolean
  # include FilterConcern

  def filter_matches
    # params[:filterData].delete('gender') if params[:filterData]['gender'] == "both"
    # child_gender = params[:filterData]['childGender']
    # params[:filterData].delete('childGender')
    # matches = Child.where(process_filters(params))

    # nonincestual_matches = matches.select{|child| child.parent != current_user}

    # same_orientation = nonincestual_matches.select{|child| child.sexual_preference = child_gender}

    # render json: {matches: nonincestual_matches}

    @children_interested_in_your_gender = apply_scopes(Child).all

    params[:by_sexual_preference] = 'both'
    @children_interested_in_both_genders = apply_scopes(Child).all

    render json: @children_interested_in_your_gender + @children_interested_in_both_genders
  end

  def test
    @children_interested_in_your_gender = apply_scopes(Child).all

    params[:by_sexual_preference] = 'both'
    @children_interested_in_both_genders = apply_scopes(Child).all

    render json: @children_interested_in_your_gender + @children_interested_in_both_genders
  end
end
