class TwitterUsersController < ApplicationController
  before_action :set_twitter_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /twitter_users
  # GET /twitter_users.json
  def index
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "ZlKRQXJDicbNHXjqIr0dllZsc"
      config.consumer_secret     = "JOh0eAtpdHY0uSsaQbPDUFL8TUYygOtaEwCV6cRQ6y2KXFiK6U"
      config.access_token        = "197092649-CihsuA5dYOZDy86CRxLu9kwDDkvdHfhXQi8xQiIn"
      config.access_token_secret = "UCIHoGPegZn4Pwk2opnsJd22Mu7Aenpgm3fa8ylsJvnrc"
    end


    twitter_users = TwitterUser.where(user_id: current_user)

    @all_tweets = []

     twitter_users.each do |twitter_user|

      @client.user_timeline(twitter_user.twitter_id)[0..11].each  do |tweet|
        @all_tweets.push(id:twitter_user.twitter_id, tweet:tweet.full_text, fav_count:tweet.favorite_count, rt_count:tweet.retweet_count)
      end

     end
    @all_tweets.shuffle!
  end

  # GET /twitter_users/1
  # GET /twitter_users/1.json
  def show
  end

  # GET /twitter_users/new
  def new
    @twitter_user = TwitterUser.new
  end

  # GET /twitter_users/1/edit
  def edit
  end

  # POST /twitter_users
  # POST /twitter_users.json
  def create
    @twitter_user = TwitterUser.new(twitter_user_params)

    respond_to do |format|

      if @twitter_user.save
        format.html { redirect_to twitter_users_path, notice: 'Twitter user was successfully created.' }
        format.json { render :show, status: :created, location: @twitter_user }
      else
        format.html { render :new }
        format.json { render json: @twitter_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twitter_users/1
  # PATCH/PUT /twitter_users/1.json
  def update
    respond_to do |format|
      if @twitter_user.update(twitter_user_params)
        format.html { redirect_to @twitter_user, notice: 'Twitter user was successfully updated.' }
        format.json { render :show, status: :ok, location: @twitter_user }
      else
        format.html { render :edit }
        format.json { render json: @twitter_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twitter_users/1
  # DELETE /twitter_users/1.json
  def destroy
    @twitter_user.destroy
    respond_to do |format|
      format.html { redirect_to twitter_users_url, notice: 'Twitter user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twitter_user
      @twitter_user = TwitterUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twitter_user_params
      params.require(:twitter_user).permit(:user_id, :twitter_id)
    end
end
