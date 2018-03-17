module Issues
  class IssuesRepresenter < Representable::Decorator
    include Representable::JSON::Collection

    items class: Issue, decorator: IssueRepresenter
  end
end
