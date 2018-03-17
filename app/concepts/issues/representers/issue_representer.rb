module Issues
  class IssueRepresenter < Representable::Decorator
    include Representable::JSON

    property :id
    property :name
    property :slug
  end
end
