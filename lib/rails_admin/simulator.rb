# lib/rails_admin/matches.rb

module RailsAdmin
  module Config
    module Actions
      class Simulator < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:abstract_model].param_key == "competition" && bindings[:object].double_rr?
        end

        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'fa fa-pencil-square-o'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
            @matches = @object.matches.order(id: :asc)
          end
        end
      end
    end
  end
end
