require 'eye'
require 'eye/notify/slack/version'

require 'slack-notifier'

module Eye
  class Notify

    class Slack < Eye::Notify::Custom

      # Eye.config do
      #   slack webhook_url: '1312312', icon: '', username: 'eye bot', color: '#f0f0f0'
      #   contact :info, :slack, 'channel name'
      # end

      param :webhook_url, String, true
      # icon, either emoji or URL
      param :icon, String, false, ''
      # not required, if not specified, we're using 'Eye Bot'
      param :username, String, false, 'Eye Bot'
      # not required, 'gray' as default color, you can use RGB or danger, good, warning
      param :color, String, false, '#f0f0f0'
      # available messages:
      #  time host message name full_name pid level
      param :message, String, false, '<strong>#name#</strong> on #host# #message# at #time#.'
      # whether to notify room or not
      param :title, String, false, ''

      def execute
        say(parse_message)
      end

      private

      def parse_message
        %w{time host message name full_name pid level}.each do |variable|
          message.gsub!("##{variable}#", send("msg_#{variable}").to_s) if message =~ /##{variable}#/
        end
        message
      end

      def msg_time
        Eye::Utils.human_time2(msg_at)
      end

      def client
        opts = {
          channel: channel,
          username: username
        }
        if icon
          opts[:icon_emoji] = icon if icon =~ /\A:[^:]:\Z/
          opts[:icon_url] = icon if icon =~ /\Ahttp[s]?:\/\//i
        end

        ::Slack::Notifier.new webhook_url, opts
      end

      def say(what)
        client.ping '', attachments: { title: '', text: what, color: color, mrkdwn_in: [text, title] }
      end
    end

  end
end
