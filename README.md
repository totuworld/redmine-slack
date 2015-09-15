# 슬랙 채팅 지원 플러그인

redmine의 슬랙 채팅을 지원하기 위한 플러그인이다. 

[기존 레포지토리](https://github.com/sciyoshi/redmine-slack)에서 `fork`하여 생성하였다.

## 설치

Redmine 설치 폴더에서 아래와 같이 명령을 내린다.

    git clone https://github.com/totuworld/redmine-slack.git redmine_slack

플러그인 디렉토리로 이동하여 `httpclinet`가 설치되도록 명령을 실행한다. 

    bundle install
    
## 기본 설정

Slack의 `Incoming WebHooks`을 추가한 후 해당 URL을 플러그인 설정에 추가한다.
특정 채널로 푸쉬 메시지를 받으려면 채널 명을 `Slack Channel`란에 넣는다.

## 사용자 설정

### 프로젝트 별도 채널 푸쉬 설정
`Slack Channel` 필드를 project custom field (Administration > Custom fields > Project)에 추가한다.

### 일감(Issue)의 일감관리자(Watcher)에게 Direct Message 전송 설정 
1. 플러그인 설정에서 `Send private msg to Watchers`를 `Yes`로 선택
2. `SlackID` 필드를 user custom field (Administration > Custom fields > User)에 추가한다.
3. 각 유저별로 `SlackID` 필드에 [user.list](https://api.slack.com/methods/users.list)에 나오는 `members`의 각 `id` 값을 넣는다.



---



# Slack chat plugin for Redmine

This plugin posts updates to issues in your Redmine installation to a Slack
channel. Improvements are welcome! Just send a pull request.

## Screenshot

![screenshot](https://raw.github.com/totuworld/redmine-slack/gh-pages/screenshot.png)

## Installation

From your Redmine plugins directory, clone this repository as `redmine_slack` (note
the underscore!):

    git clone https://github.com/totuworld/redmine-slack.git redmine_slack

You will also need the `httpclient` dependency, which can be installed by running

    bundle install

from the plugin directory.

Restart Redmine, and you should see the plugin show up in the Plugins page.
Under the configuration options, set the Slack API URL to the URL for an
Incoming WebHook integration in your Slack account.

## Customized Routing

You can also route messages to different channels on a per-project basis. To
do this, create a project custom field (Administration > Custom fields > Project)
named `Slack Channel`. If no custom channel is defined for a project, the parent
project will be checked (or the default will be used). To prevent all notifications
from being sent for a project, set the custom channel to `-`.

For more information, see http://www.redmine.org/projects/redmine/wiki/Plugins.

## Direct Message

If you want Direct Message to `Issue Watcher's`, then create a user custom field(Administration > Custom fields > User) named `SlackID`.
`SlackID` is find in [user object](https://api.slack.com/types/user) `id` field on [users.info](https://api.slack.com/methods/users.info) or [users.list](https://api.slack.com/methods/users.list) Slack API.
