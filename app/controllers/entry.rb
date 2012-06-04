TwoThings.controllers :entry do

  get :list, :map => "/" do
    @entries = Entry.all_ordered_by_creation

    render 'list'
  end 
 
  get :submit do
    @entry = Entry.new
    
    render 'submit', :layout => !request.xhr?
  end

  post :submit do
    puts params[:entry]
    @entry = Entry.insert_from(params[:entry])

    if @entry.valid?
      redirect url(:entry, :list)
    else
      render 'submit', :layout => !request.xhr?
    end
  end
end
