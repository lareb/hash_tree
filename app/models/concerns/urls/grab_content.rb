require 'nokogiri'
require 'open-uri'

module Urls
  module GrabContent
    extend ActiveSupport::Concern

    included do
      after_commit :extract_tags, :on => :create
    end

    # extract content from url
    # TODO: error handling
    # timeout error
    def extract_content
      resp = ""
      begin
        resp = Nokogiri::HTML(open(url))
      # do not raise Exception => e
      # https://robots.thoughtbot.com/rescue-standarderror-not-exception
      rescue SocketError, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
        raise e.message
      end
      resp
    end

    def extract_tags
      body = extract_content
      tags = {}
      tags[:h1_tags] = body.css(:h1).map(&:text)
      tags[:h2_tags] = body.css(:h2).map(&:text)
      tags[:h3_tags] = body.css(:h3).map(&:text)
      tags[:links] = body.css(:a).map{ |link| link['href'] }
      save_tags(tags)
    end

    def save_tags(tags)
      # use update_columns instead of update because of following reasons
      # https://github.com/rails/rails/issues/16286
      # https://github.com/rails/rails/issues/14493
      update_columns(tags: tags)
    end

  end
end
