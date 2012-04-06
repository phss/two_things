TwoThings.controllers :entry do

  get :list, :map => "/" do
    @entries = Entry.find

    render 'list'
  end 
 
  get :submit do
    render 'submit'
  end

  post :submit do
    entry = Entry.new(params[:entry]).insert
    redirect url(:entry, :list)
  end
end
