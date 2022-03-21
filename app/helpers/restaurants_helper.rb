module RestaurantsHelper

  def create_header
    header = 'Restaurant Listings'
    if @q.result.count < Restaurant.count
      header = 'Search Results'
    end
    header
  end
end
