class ClassSerializer
    include FastJsonapi::ObjectSerializer
    attributes :name
    has_many :services
  end
  