class UsersController < ApplicationController

  #declarative_authorization
  #filter_resource_access
  
  def index
    @users = User.all
    @page_title = "All Users"
  end
  
  def new
    @user = User.new
    @page_title = "Create Account"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Account registered!"
      redirect_back_or_default account_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = current_user
    @page_title = "#{@user.login} details"
  end

  def edit
    @user = User.find(params[:id])
    @page_title = "Edit #{@user.login}"
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def destroy
    @user.destroy
    flash[:notice] = 'User was deleted.'
    redirect_to(users_url)  
  end

  def request_token
    @client = Zoolah::Client.new ZOOLAH_OAUTH_KEY,ZOOLAH_OAUTH_SECRET, {:site=>ZOOLAH_OAUTH_SITE}
    @request_token = @client.get_request_token
    
    # Store the token in a model in your applications mapping it to your user
    session[:oauth_secret] = @request_token.secret
    #ZoolahToken.create :user=>current_user,:token=>@request_token.token,:secret=>@request_token.secret
    redirect_to @request_token.authorize_url
  end

  def authorize
    @client = Zoolah::Client.new ZOOLAH_OAUTH_KEY,ZOOLAH_OAUTH_SECRET, {:site=>ZOOLAH_OAUTH_SITE}
    
    # Load the request token from your ZoolahRequestToken through your user model
    begin
      @request_token = OAuth::RequestToken.new(@client.consumer, params[:oauth_token], session[:oauth_secret])
      @access_token = @request_token.get_access_token
      # Exchange the authorized request token for a more permanent User token on the Zoolah site
      ZoolahToken.create :user=>current_user,:token=>@access_token.token,:secret=>@access_token.secret
    rescue Exception => e
      flash[:error] = "Unauthorized!"
    end

    redirect_to root_path
 end  
end
