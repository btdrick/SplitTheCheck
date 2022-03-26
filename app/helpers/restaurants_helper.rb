module RestaurantsHelper

  def create_header
    header = 'Restaurant Listings'
    if @q.result.count == 0
      header = 'No Results'
    elsif @q.result.count < Restaurant.count
      header = @q.result.count.to_s
      if @q.result.count == 1
       header += ' Result Found'
     else
       header += ' Results Found'
     end
    end
    header
  end

  def create_return_link
    return_link = ''
    if @restaurants.count < Restaurant.count
      return_link = link_to 'Back', restaurants_path
    end
    return_link
  end
end
