class VotesController < ApplicationController
  def vote_up
    if current_user.votes.empty?
      Vote.create(user: current_user, image_id: params[:image_id], value: 1)
      notice = 'Zagłosowałeś pomyslnie!'
    else
      notice = 'Glosowales juz na ten obrazek!'
    end
    redirect_to top_path, notice: notice
  end

  def vote_down
    if current_user.votes.empty?
      Vote.create(user: current_user, image_id: params[:image_id], value: -1)
      notice = 'Zagłosowałeś pomyslnie!'
    else
      notice = 'Glosowales juz na ten obrazek!'
    end
    redirect_to top_path, notice: notice
  end
end
