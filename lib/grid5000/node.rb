require 'socket'
require 'restclient'
require 'json'

module Grid5000
  class Node
    attr_reader :hostname
    attr_reader :node_uid, :cluster_uid, :site_uid, :grid_uid
    
    def initialize(phostname)
      @hostname = phostname || Socket.gethostname
      Grid5000.logger.debug "Instantiating a new node with hostname=#{hostname.inspect}"
      @node_uid, @site_uid, @grid_uid, @ltd = hostname.split(".")
      @cluster_uid = @node_uid.split("-")[0]
    end
    
    def description
      node_uri = [
        Grid5000.configuration["api_uri"],
        grid_uid, 
        "sites", site_uid, 
        "clusters", cluster_uid, 
        "nodes", node_uid
      ].join("/")
      @description ||= JSON.parse RestClient.get(node_uri, :accept => :json)
    end
    
  end
end
