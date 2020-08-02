json.user_name @chat.user.name
json.created_at @chat.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.comment @chat.comment
json.id @chat.id