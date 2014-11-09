require 'tilt'
require 'ostruct'
require 'rake/file_list'

module JBoss
  module Developer
    class DockerFileGenerator

      def initialize(options)
        @dockerfile = Tilt.new('Dockerfile.str')
        @dockerignore = Tilt.new('.dockerignore.str')
        @options = options
      end

      def scan(dir)
        Dir.chdir(dir) do
          files = Rake::FileList['*']
          if File.exists? '.dockergenignore'
            files = files .exclude(*File.read('.gitignore').split)
          end
          files.each do |f|
            if Dir.exists? f
              File.write("#{f}/Dockerfile", generate(@dockerfile, f))
              File.write("#{f}/.dockerignore", generate(@dockerignore, f))
            end
          end
        end
      end

      def generate(template, quickstart_name)
        context = OpenStruct.new({
          :base_image_name => "jboss#{@options[:product_code]}quickstarts",
          :quickstarts_repo_name => "jboss-#{@options[:product_code]}-quickstarts",
          :product_dir_name => "jboss-#{@options[:product_code]}",
          :quickstart_name => quickstart_name
        }.merge(@options))
        template.render(context)
      end

    end
  end
end

