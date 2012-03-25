# This is a major hack on both Rack::Test and Sinatra to allow rails like assigns method
class Rack::Response
  attr_accessor :variables, :template
end

class Rack::MockResponse
  attr_accessor :variables, :template
  
  def initialize_with_variables(status, headers, body, errors=StringIO.new(""))
    self.variables = body.variables if body.respond_to?(:variables=)
    self.template = body.template if body.respond_to?(:template=)
    initialize_without_variables(status, headers, body, errors)
  end
  alias_method :initialize_without_variables, :initialize
  alias_method :initialize, :initialize_with_variables

  def assigns(name)
    variables["@#{name}"]
  end
end

class Sinatra::Response
  def finish
    super # Hack away code that assings the response.body to the result
  end
end

class Sinatra::Base
  def render(engine, data, options={}, locals={}, &block)
    variables = {}
    instance_variables.each do |var|
      variables[var.to_s] = instance_variable_get(var)
    end
    @response.variables = variables
    @response.template = data.to_s
  end
end