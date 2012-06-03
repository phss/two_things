TwoThings.controllers :entry do

  get :list, :map => "/" do
    @entries = Entry.all_ordered_by_creation

    render 'list'
  end 
 
  get :submit do
    @entry = Entry.new
    
    render 'submit'
  end

  post :submit do
    @entry = Entry.insert_from(params[:entry])

    if @entry.valid?
      redirect url(:entry, :list)
    else
      render 'submit'
    end
  end
end
