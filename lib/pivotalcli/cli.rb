require 'thor'
require 'tracker_api'
require 'pp'
require 'yaml'

module Pivotalcli
  class CLI < Thor
    desc "list_projects", "list all projects"
    def list_projects
      client.projects.each do |project|
        puts "#{project.id}, #{project.name}"
      end
    end

    desc "get_story_info story_id", "get_story_info"
    def get_story_info(_story_id)
      story_id = _story_id.delete('#')
      begin
        story = client.story(story_id)
        puts story.name
        puts story.url
      rescue => e
        STDERR.puts "#{story_id} is not found."
      end
    end

  private
    def client
      TrackerApi::Client.new(token: ENV['PIVOTAL_TOKEN'])
    end
  end
end
