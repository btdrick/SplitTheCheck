module RestaurantsHelper

  def newest_restaurants_link
    newest_link = ''
    if @page > 0
      newest_link = link_to 'Newest', restaurants_path, class:"nav-link"
    end
    newest_link
  end

  def previous_restaurants_link
    previous_10_link = ''
    if @page > 1
      previous_10_link = link_to 'Previous 10 Listings',
        restaurants_path(page: @page - 1), class:"nav-link"
    elsif @page == 1
      previous_10_link = link_to 'Previous 10 Listings',
        restaurants_path, class:"nav-link"
    end
    previous_10_link
  end

  def next_restaurants_link
    next_10_link = ''
    if @page >= 0 && !more_restaurants?
      next_10_link = link_to 'Next 10 Listings',
        restaurants_path(page: @page + 1), class:"nav-link"
    end
    next_10_link
  end

  def oldest_restaurants_link
    oldest_link = ''
    if !more_restaurants?
      oldest_link = link_to 'Oldest', restaurants_path(page: get_last_page),
        class:"nav-link"
    end
    oldest_link
  end

  private
    def more_restaurants?
      (@page + 1) * 10 >= Restaurant.count
    end

    def get_last_page
      page_number = Restaurant.count / 10
      if Restaurant.count % 10 == 0
        page_number -= 1
      end
      page_number
    end


end
