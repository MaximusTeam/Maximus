local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Share Admin Contact ℹ🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Support 👥', callback_data = '!support'},
 },
	    {
	    {text = 'Back To Menu 🔗', callback_data = '!home'}
        }
    }
    return keyboard
end
local function do_keyboard_support()
    local keyboard = {}
    keyboard.inline_keyboard = {
{
    		    		{text = 'Persian Support', url = 'https://telegram.me/joinchat/ChhotD-RLOr9FoeysgQ9hw'},
    		    		{text = 'English Support', url = 'https://telegram.me/joinchat/ChhotD-RLOr9FoeysgQ9hw'},
	    },
	    {
	    {text = 'Back To Menu 🔗', callback_data = '!robot'}
        }
    }
    return keyboard
end
local function do_keyboard_private()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '📲 Game', callback_data = '!game'},
	    },
	    {
	        {text = 'ℹ More Information', callback_data = '!robot'},
        },
                {
                {text = '🔥 Github Of Team', url = 'https://github.com/maximusteam'},
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃👉Start! 👈🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end

local function do_keyboard_game()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Select One ⏬', url = 'https://telegram.me/Arian721'},
	    },
	{
	        		{text = '1', url = 'https://telegram.me/HeIsAlireza'},

    },
		{
					{text = '2', url = 'https://telegram.me/Arian721'},
		},
	        {
	    {text = 'Back To Menu 🔗', callback_data = '!home'},
        },
    
    }
    return keyboard
end

local action = function(msg, blocks, ln)
    if blocks[1] == 'start' or blocks[1] == 'help' then
        db:hset('bot:users', msg.from.id, 'xx')
        db:hincrby('bot:general', 'users', 1)
        if msg.chat.type == 'private' then
            local message = [[☘ *Hello*
✅  Im *Maximus* Bot
🌷 Select one of keyboards
❎ send _/plugins_ for give my *plugins list*
🗣 send _/ping_ for check my *onlining*
⚗ you can send your *feedback* by _/feedback [your message]_]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, '🔗1-Top On The Inline Keyboard\n🔗2-Press Start' ,do_keyboard_startme(), true)
        end
        return keyboard
    end
    
        if query == 'game' then
            local text = [[📍یکی از ادمینا رو انتخاب کنوهر کدوم که اومد ازش پول بگیر!]]
            local keyboard = do_keyboard_game()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'support' then
            local text = [[📍Select One Of Supports]]
            local keyboard = do_keyboard_support()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'home' then
            local text = [[📍Select One ⏬ | ℹیکی رو انتخاب کنℹ]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+12818539367', 'Arian')
end
      if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
if query == 'robot' then
            local text = [[📍Select One📍 | 🔗یکی رو انتخاب کن🔗]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍Select One ⏬ | ℹیکی رو انتخاب کنℹ]]
            local keyboard = do_keyboard_private()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
        if query == 'share' then
     api.sendContact(msg.from.id, '+12818539367', 'Arian')
end
    end

end

return {
	action = action,
	triggers = {
	    '^/(start)@MaximumRobot$',
	    '^/(start)$',
	    '^/(help)$',
	    '^###cb:!(home)',
	    '^###cb:!(game)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',
            '^###cb:!(support)',

    }
}
