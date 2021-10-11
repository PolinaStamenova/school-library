require_relative 'person'

class Teacher < Person
  def initialize(params)
    super(params)
    @specialization = params[:specialization]
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'id' => @id,
      'age' => @age,
      'specialization' => @specialization,
      'parent_permission' => @parent_permission
    }.to_json(*args)
  end
end
