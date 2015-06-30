class SetAttributes
  module Attribute
    def self.set(receiver, attribute, value, log_black_list_regex=nil)
      logger = Telemetry::Logger.get self

      log_black_list_regex ||= Defaults.log_black_list_regex

      setter = :"#{attribute}="

      if log_black_list_regex && !(attribute =~ log_black_list_regex).nil?
        log_value = '(value cannot be logged)'
      else
        log_value = value
      end

      if receiver.respond_to? setter
        logger.trace "Setting #{attribute}"

        receiver.send setter, value

        logger.debug "Set #{attribute}"
        logger.data "#{attribute}: #{log_value}"
      else
        logger.debug "#{receiver} has no setter for #{attribute}"
      end

      value
    end

    module Defaults
      def self.log_black_list_regex
        logger = Telemetry::Logger.get self
        logger.trace "Getting default attribute black list regex"
        /\A(password|api_key|data|metadata)\z|token\z/.tap do |instance|
          logger.debug "Got default attribute black list regex (#{instance})"
        end
      end
    end
  end
end