require "trivial_decorator/version"
require "trivial_decorator/base"
require "trivial_decorator/collection_proxy"

module TrivialDecorator
  def decorate(object, decorator_class = nil)
    decorator_class ||= "#{object.model.name}Decorator".constantize

    if object.respond_to? :each
      TrivialDecorator::CollectionProxy.new(object, object.map { |o| decorator_class.new(o, view_context) })
    else
      decorator_class.new(object, view_context)
    end
  end
end

ActionController::Base.send :include, TrivialDecorator
ActionController::Base.send :helper_method, :decorate