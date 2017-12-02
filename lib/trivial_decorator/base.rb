module TrivialDecorator
  class Base < SimpleDelegator
    def initialize(object, view_context)
      super(object)
      @view_context = view_context
    end

    def helpers
      view_context
    end

    def model
      __getobj__
    end

    alias h helpers

    private

    attr_reader :view_context
  end
end
