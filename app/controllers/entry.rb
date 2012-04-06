TwoThings.controllers :entry do

  get :list, :map => "/" do
    @entries = Entry.find

    render 'list'
  end 
 
  get :submit do
    @entry = Entry.new
    render 'submit'
  end

  post :submit do
    @entry = Entry.new(params[:entry])

    if @entry.valid? && @entry.insert
      redirect url(:entry, :list)
    else
      render 'submit'
    end
  end
end
