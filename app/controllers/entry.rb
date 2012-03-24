TwoThings.controllers :entry do

  get :list, :map => "/" do
    @entries = Entry.find

    render 'list'
  end

end
