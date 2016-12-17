require 'thor'

module Pivotalcli
  class CLI < Thor
    desc "list_projects", "list all projects"
    def list_projects
      client.projects.each do |project|
        puts "#{project.id}, #{project.name}"
      end
    end

  private
    def client
      TrackerApi::Client.new(token: ENV['PIVOTAL_TOKEN'])
    end
  end
end
