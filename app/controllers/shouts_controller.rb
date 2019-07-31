class ShoutsController < ApplicationController
  def show
    @shout = Shout.find(params[:id])
  end

  def create
    shout = current_user.shouts.create(shout_params)
    redirect_to root_path, redirect_options_for(shout)
  end

  private

  def shout_params
    # He broke this apart into like 4 methods but I personally do not
    # see the advantage to that
    content_params = params.require(:shout).require(:content).permit(:body)
    text_shout = TextShout.new(content_params)
    params = { :content => text_shout }
    return params
  end

  def redirect_options_for(shout)
    if shout.persisted?
      { notice: "Shouted succesfully" }
    else
      { alert: "Shout was invalid." }
    end
  end
end
