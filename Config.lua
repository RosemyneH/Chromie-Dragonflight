local DF = LibStub('AceAddon-3.0'):GetAddon('legionDF')

local moduleOptions = {}
local options = {
    type = 'group',
    args = {
        general = {
            type = 'group',
            inline = true,
            name = 'General Options',
            args = {
                unlock = {
                    type = 'execute',
                    name = 'Do Nothing',
                    desc = 'Does nothing',
                    func = function()
                        DF:Print('Dont press me, i do nothing!')
                    end,
                    order = 69
                }
            }
        }
    }
}

function DF:SetupOptions()
    self.optFrames = {}
    LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable('legionDF', options)
    self.optFrames['legionDF'] =
        LibStub('AceConfigDialog-3.0'):AddToBlizOptions('legionDF', 'legionDF')

    local profiles = LibStub('AceDBOptions-3.0'):GetOptionsTable(self.db)
    profiles.order = 666
    LibStub('AceConfig-3.0'):RegisterOptionsTable('DragonflightUI_Profiles', profiles)
    LibStub('AceConfigDialog-3.0'):AddToBlizOptions('DragonflightUI_Profiles', 'Profiles', 'legionDF')
end

function DF:RegisterModuleOptions(name, options)
    --self:Print('RegisterModuleOptions()', name, options)
    moduleOptions[name] = options
    -- function AceConfigDialog:AddToBlizOptions(appName, name, parent, ...)
    LibStub('AceConfigRegistry-3.0'):RegisterOptionsTable('legionDF' .. name, options)

    self.optFrames[name] =
        LibStub('AceConfigDialog-3.0'):AddToBlizOptions('legionDF' .. name, name, 'legionDF')
end

function DF:RegisterSlashCommands()
    self:RegisterChatCommand('df', 'SlashCommand')
    self:RegisterChatCommand('dragonflight', 'SlashCommand')
end

function DF:SlashCommand(msg)
    --self:Print('Slash: ' .. msg)
    InterfaceOptionsFrame_OpenToCategory('legionDF')
    InterfaceOptionsFrame_OpenToCategory('legionDF')
end
