local action = function(msg, matches)
  local text = "🔗 *List Of All Plugins*\n1- _start_\n2- _plugins_\n3- _stats_\n4- _about_"
  api.sendReply(msg,text,true)
  end
local triggers = {
  "^/plugins",
  }
return {
  action = action,
  triggers = triggers
}
