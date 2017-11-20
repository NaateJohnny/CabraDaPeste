--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:0e50cef8f7b4bb92771aa5b27cd5bcfe:110c3cd67c132a600bf54a87d5698e62:22cd86d88046b35f9f05cfe4818876be$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- andando1
            x=0,
            y=0,
            width=108,
            height=135,

        },
        {
            -- andando2
            x=108,
            y=0,
            width=117,
            height=135,

        },
        {
            -- andando3
            x=0,
            y=135,
            width=120,
            height=135,

        },
        {
            -- andando4
            x=120,
            y=135,
            width=103,
            height=135,

        },
        {
            -- andando5
            x=0,
            y=270,
            width=117,
            height=135,

        },
        {
            -- andando6
            x=117,
            y=270,
            width=122,
            height=135,

        },
        {
            -- andando7
            x=0,
            y=405,
            width=107,
            height=135,

        },
        {
            -- andando8
            x=107,
            y=405,
            width=117,
            height=135,

        },
        {
            -- andando9
            x=0,
            y=540,
            width=120,
            height=135,

        },
        {
            -- andando10
            x=120,
            y=540,
            width=104,
            height=135,

        },
        {
            -- andando11
            x=0,
            y=675,
            width=118,
            height=135,

        },
        {
            -- andando12
            x=118,
            y=675,
            width=124,
            height=135,

        },
        {
            -- parado1
            x=0,
            y=810,
            width=105,
            height=135,

        },
        {
            -- parado2
            x=105,
            y=810,
            width=105,
            height=135,

        },
    },
    
    sheetContentWidth = 242,
    sheetContentHeight = 945
}

SheetInfo.frameIndex =
{

    ["andando1"] = 1,
    ["andando2"] = 2,
    ["andando3"] = 3,
    ["andando4"] = 4,
    ["andando5"] = 5,
    ["andando6"] = 6,
    ["andando7"] = 7,
    ["andando8"] = 8,
    ["andando9"] = 9,
    ["andando10"] = 10,
    ["andando11"] = 11,
    ["andando12"] = 12,
    ["parado1"] = 13,
    ["parado2"] = 14,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
