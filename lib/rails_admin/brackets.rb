# lib/rails_admin/matches.rb

module RailsAdmin
  module Config
    module Actions
      class Brackets < RailsAdmin::Config::Actions::Base
        # This ensures the action only shows up for Users
        register_instance_option :visible? do
          authorized? && bindings[:abstract_model].param_key == "competition"
        end

        # We want the action on members, not the Users collection
        register_instance_option :member do
          true
        end
        register_instance_option :link_icon do
          'fa fa-sitemap'
        end
        # You may or may not want pjax for your action
        register_instance_option :pjax? do
          false
        end

        register_instance_option :controller do
          Proc.new do
            @brackets = @object.brackets.order(created_at: :asc)
          end
        end
      end
    end
  end
end
