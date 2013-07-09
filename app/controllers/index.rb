get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/user/new' do
    
  @person = TwitterUser.find_or_create_by_username(params[:username])
  
  @person.fetch_tweets!
  @tweets = @person.tweets.limit(10)
  
  erb :list
end


post '/tweet/new' do
  @person = TwitterUser.find_or_create_by_username(params[:username])
  Twitter.update(params[:new_tweet])
  @person.fetch_tweets!
  @tweets = @person.tweets.limit(10)
  erb :list
end
