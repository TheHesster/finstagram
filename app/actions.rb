helpers do
    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
end

get '/' do
    @finstagram_posts = FinstagramPost.order(created_at: :desc)
    erb(:index)
end

get '/signup' do
    @user = User.new
    erb(:signup)
end

post '/signup' do
    # grab user input values from params
    email = params[:email]
    avatar_url = params[:avatar_url]
    username = params[:username]
    password = params[:password]

    # instantiate a User
    @user = User.new({ email: email, avatar_url: avatar_url, username: username, password: password })

    # if user validations pass and user is saved
    if @user.save
        redirect to('/login')
    else
        erb(:signup)
    end
end

get '/login' do
    erb(:login)
end

post '/login' do
    username = params[:username]
    password = params[:password]

    @user = User.find_by(username: username)

    if @user && @user.password == password
        session[:user_id] = @user.id
        redirect to('/')
    else
        @error_message = "Login Failed"
        erb(:login)
    end
end

get '/logout' do
    session[:user_id] = nil
    redirect to('/')
end

before '/finstagram_posts/new' do
    redirect to('/login') unless logged_in?
end

get '/finstagram_posts/new' do
    @finstagram_post = FinstagramPost.new
    erb(:"finstagram_posts/new")
end

post '/finstagram_posts' do
    photo_url = params[:photo_url]
    @finstagram_post = FinstagramPost.new({ photo_url: photo_url, user_id: current_user.id })

    if @finstagram_post.save
        redirect(to('/'))
    else
        erb(:"finstagram_posts/new")
    end
end

get '/finstagram_posts/:id' do
    @finstagram_post = FinstagramPost.find_by(id: params[:id])

    if @finstagram_post
        erb(:"/finstagram_posts/show")
    else
        halt(404, erb(:'errors/404'))
    end
end

post '/comments' do
    text = params[:text]
    finstagram_post_id = params[:finstagram_post_id]

    comment = Comment.new({ text: text, finstagram_post_id: finstagram_post_id, user_id: current_user.id })
    comment.save

    redirect(back)
end

post '/likes' do
    finstagram_post_id = params[:finstagram_post_id]

    like = Like.new({ finstagram_post_id: finstagram_post_id, user_id: current_user.id })
    like.save

    redirect(back)
end

delete '/likes/:id' do
    like = Like.find(params[:id])
    like.destroy
    redirect(back)
end

get '/account' do
    erb(:account)
end

get '/users/:id' do
    erb(:"/users/show")
end

put '/users/:id' do
    avatar_url = params[:avatar_url]
    user = User.find_by(id: current_user.id)
    user.avatar_url = avatar_url
    user.save
    redirect(to('/'))
end
