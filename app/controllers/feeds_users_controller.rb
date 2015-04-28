class FeedsUsersController < ApplicationController
  before_action :set_feeds_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /feeds_users
  # GET /feeds_users.json
  def index
    @feeds_users = FeedsUser.where(user_id: current_user)

    Title.delete_all

    if params[:search]
      @feeds_users.each do |feeds_user|
        current_feed = Feedjira::Feed.fetch_and_parse(Feed.find_by_feed_id(feeds_user.feed_id).url)
        current_article = current_feed.entries
        current_article[1..5].each do |item|
            @t = Title.new(:title => item.title, :link => item.url, :summary => item.summary)
            @t.save
        end end
      @feeds_users = Title.search(params[:search])
    end

  end

  # GET /feeds_users/1
  # GET /feeds_users/1.json
  def show
  end

  # GET /feeds_users/new
  def new
    @feeds_user = FeedsUser.new
  end

  # GET /feeds_users/1/edit
  def edit
  end

  # POST /feeds_users
  # POST /feeds_users.json
  def create
    @feeds_user = FeedsUser.new(feeds_user_params)

    respond_to do |format|
      if @feeds_user.save
        format.html { redirect_to @feeds_user, notice: 'Feeds user was successfully created.' }
        format.json { render :show, status: :created, location: @feeds_user }
      else
        format.html { render :new }
        format.json { render json: @feeds_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feeds_users/1
  # PATCH/PUT /feeds_users/1.json
  def update
    respond_to do |format|
      if @feeds_user.update(feeds_user_params)
        format.html { redirect_to @feeds_user, notice: 'Feeds user was successfully updated.' }
        format.json { render :show, status: :ok, location: @feeds_user }
      else
        format.html { render :edit }
        format.json { render json: @feeds_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feeds_users/1
  # DELETE /feeds_users/1.json
  def destroy
    @feeds_user.destroy
    respond_to do |format|
      format.html { redirect_to feeds_users_url, notice: 'Feeds user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feeds_user
      @feeds_user = FeedsUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feeds_user_params
      params[:feeds_user]
    end
end
