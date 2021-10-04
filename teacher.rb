require_relative 'main'

class Teacher < Person
  def initialize(params)
    super
    @specialization = params[:specialization]
  end

  def can_use_services?
    true
  end
end