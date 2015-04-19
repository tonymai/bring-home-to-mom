class FilterController < ApplicationController
  include FilterConcern

  def filter_matches
    #refactor this by initializing hash with smoke = false and religion = nil
    params[:filterData].delete('gender') if params[:filterData]['gender'] == "both"
    matches = Child.where(process_filters(params))
    # match_ids = matches.map{|child| child.id}
    render json: {matches: matches}
  end
end
