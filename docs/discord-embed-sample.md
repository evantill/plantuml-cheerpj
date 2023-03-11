const lib = require('lib')({token: process.env.STDLIB_SECRET_TOKEN});

await lib.discord.channels['@0.3.2'].messages.create({
  "channel_id": "${context.params.event.channel_id}",
  "content": "",
  "tts": false,
  "components": [
    {
      "type": 1,
      "components": [
        {
          "style": 5,
          "label": "Release Note",
          "url": "https://github.com/evantill/plantuml-cheerpj/blob/v1.2.0-alpha/CHANGELOG.md",
          "disabled": false,
          "type": 2
        }
      ]
    }
  ],
  "embeds": [
    {
      "type": "rich",
      "title": "plantuml-chieddkdkd Release 1.2.3",
      "description": "",
      "color": "0xF6BC55",
      "fields": [
        {
          "name": "Repository",
          "value": "evantill/plantuml-chieddkdkd",
          "inline": true
        },
        {
          "name": "Version",
          "value": "1.2.3.4",
          "inline": true
        }
      ],
      "thumbnail": {
        "url": "https://avatars.githubusercontent.com/evantill",
        "height": 0,
        "width": 0
      },
      "author": {
        "name": "evantill",
        "url": "https://github.com/evantill",
        "icon_url": "https://avatars.githubusercontent.com/evantill"
      },
      "footer": {
        "text": "21/07/2023"
      },
      "url": "https://github.com/evantill/plantuml-cheerpj/releases/tag/untagged-213445f7e7a8e3b5f93d"
    }
  ]
});