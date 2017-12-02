module TrivialDecorator
  class CollectionProxy
    delegate :current_page, :total_pages, :limit_value, :model_name, :total_count,
             :total_entries, :per_page, :offset, to: :original_collection

    def initialize(original_collection, decorated_collection)
      @original_collection = original_collection
      @decorated_collection = decorated_collection
    end

    def method_missing(method, *args, &block)
      decorated_collection.send(method, *args, &block)
    end

    def respond_to_missing?(method_name, include_private = false)
      decorated_collection.respond_to_missing?(method_name, include_private) ||
        original_collection.respond_to_missing?(method_name, include_private)
    end

    private

    attr_reader :original_collection, :decorated_collection
  end
end
