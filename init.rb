require 'redmine'

require_dependency 'redmine_slack/listener'

Redmine::Plugin.register :redmine_slack do
	name 'Redmine Slack'
	author 'Yochang Song'
	url 'https://github.com/totuworld/redmine-slack'
	author_url 'http://totuworld.github.io'
	description 'Slack chat integration'
	version '0.2'

	requires_redmine :version_or_higher => '2.1'

	settings \
		:default => {
			'callback_url' => 'http://slack.com/callback/',
			'channel' => nil,
			'icon' => 'https://raw.github.com/totuworld/redmine-slack/gh-pages/icon.png',
			'username' => 'redmine',
			'display_watchers' => 'no',
			'send_private' => 'no'
		},
		:partial => 'settings/slack_settings'
end
