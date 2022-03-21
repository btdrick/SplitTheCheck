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
end
