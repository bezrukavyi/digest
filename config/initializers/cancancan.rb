module CanCan
  module ModelAdapters
    class AbstractAdapter
      def self.find(model_class, id)
        if model_class.respond_to?(:friendly)
          model_class.friendly.find(id)
        else
          model_class.find(id)
        end
      end
    end
  end
end
