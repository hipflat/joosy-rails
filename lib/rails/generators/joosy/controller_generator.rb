module Joosy
  module Generators
    class ControllerGenerator < ::Rails::Generators::Base
      argument :name, type: :string
      class_option :copy, :default => false, :type => :boolean, :desc => 'Indicates whether internal controller should be copied'

      source_root ::Rails.root

      def create_files
        if options["copy"]
          template File.expand_path('../../../../joosy/rails/controller.rb', __FILE__), "app/controller/joosy/rails/serve_controller.rb"
        else
          template File.expand_path('../templates/controller.rb', __FILE__), "app/controllers/#{name.underscore}_controller.rb"
        end
      end
    end
  end
end