local function do_keyboard_robot()
    local keyboard = {}
    keyboard.inline_keyboard = {
		{
    					{text = 'Share Admin Contact ℹ🏾', callback_data = '!share'},
    					},
    					{
    		    		{text = 'Support 👥', url = 'https://telegram.me/joinchat/BvytAD9KL7J2PE2u0ek3ZA'},
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
    		    		{text = 'Persian Support', url = 'http://salam.im/buy/ecgvlup3ld'},
    		    		{text = 'English Support', url = 'https://telegram.me/joinchat/BvytAD9KL7J2PE2u0ek3ZA'},
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
                {text = '🔥 Github Of Team', url = 'https://github.com/maximusteam'}
        }
    }
    return keyboard
end

local function do_keyboard_startme()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = '🙃👉 Click here ! 👈🙃', url = 'https://telegram.me/'..bot.username}
	    }
    }
    return keyboard
end
local function do_keyboard_channel()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Persian Channel 🇮🇷', url = 'https://telegram.me/BeatBot_team'},
        },
		{
	        {text = '🔗 Back To Menu', callback_data = '!home'},
        }
    }
    return keyboard
end

local function do_keyboard_game()
    local keyboard = {}
    keyboard.inline_keyboard = {
    	{
    		{text = 'Select One ⏬', url = 'https://telegram.me/BeatBot_team'},
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
            local message = [[📍 *Welcome* To _Maximus_  📍]]
            local keyboard = do_keyboard_private()
            api.sendKeyboard(msg.from.id, message, keyboard, true)
            end
			if msg.chat.type == 'group' or msg.chat.type == 'supergroup' then
          api.sendKeyboard(msg.chat.id, '🔗1-Top On The Inline Keyboard\n🔗2-Press Start' ,do_keyboard_startme(), true)
        end
        return
    end

    if msg.cb then
        local query = blocks[1]
        local msg_id = msg.message_id
        local text
        if query == 'channel' then
            local text = '📡 *BeatBotTeam Channels :*'
            local keyboard = do_keyboard_channel()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'robot' then
            local text = [[📍 *Welcome* To _Maximus_  📍]]
            local keyboard = do_keyboard_robot()
        api.editMessageText(msg.chat.id, msg_id, text, keyboard, true)
end
if query == 'home' then
            local text = [[📍Select One ⏬]]
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
		'^###cb:!(buygroup)',
	    '^###cb:!(channel)',
	    '^###cb:!(robot)',
	    '^###cb:!(share)',
            '^###cb:!(support)',

    }
}
