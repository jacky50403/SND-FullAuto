--[[

      ***********************************************
      *              One Click Inviter              * 
      ***********************************************

      *************************
      *  Author: UcanPatates  *
      *************************

      **********************
      * Version  |  0.0.2  *
      **********************

      -> 0.0.2  : minor bug fix
      -> 0.0.1  : Just the Inviter

      ***************
      * Description *
      ***************

      This script Searchs you 4.chat if you have one and if there is someone that typed lfg in chat it invites the said person or more to your group(you need to be in target distance)
      You can make a macro with /snd run "Your_script_name_here"

      *********************
      *  Required Plugins *
      *********************


      Plugins that are used are:
      -> Something Need Doing [Expanded Edition] : https://puni.sh/api/repository/croizat
           
]]
--[[

  ************
  *  Script  *
  *   Start  *
  ************

]]
Chat_Log = GetNodeText("ChatLogPanel_3", 7, 2)
SearchString = "weeks"
-- Iterate through each line in the chat log
for line in Chat_Log:gmatch("[^\r\n]+") do
    local alphanumeric_text = line:gsub("[^%w%s]", " ")
    
    -- Remove any leading or trailing whitespace
    alphanumeric_text = alphanumeric_text:match("^%s*(.-)%s*$")
    
    -- Perform string pattern matching inside the loop
    local Name, Surname = string.match(alphanumeric_text, "(%a+)%s+(%a+)%s+(.-)%s*"..SearchString)
    --debug
    --yield("/echo "..alphanumeric_text)
    -- Check if Name and Surname are not nil before printing
    if Name and Surname then
        yield("/echo " .. Name .. " " .. Surname)
        --yield("/target " .. Name .. " " .. Surname)
        --yield("/invite ")
    end
end
