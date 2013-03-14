class TweetsController < ApplicationController
  before_filter :get_zombie
  
  def get_zombie
    @zombie = Zombie.find(params[:zombie_id])
  end
  
  def index
    @tweets = @zombie.tweets
  end
  
  def show
    @tweet = @zombie.tweets.find(params[:id])
  end
  
  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = @zombie.tweets.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully created.' }
        format.json { render json: [@zombie, @tweet], status: :created, location: [@zombie, @tweet] }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @tweet = @zombie.tweets.find(params[:id])
  end

  def update
    @tweet = @zombie.tweets.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to [@zombie, @tweet], notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet = @zombie.tweets.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to zombie_tweets_url }
      format.json { head :no_content }
    end
  end
end
