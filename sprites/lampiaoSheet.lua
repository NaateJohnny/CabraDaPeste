--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:b89922efcdf91621a71002f5f11cb5bd:991b321b577933360a4d7242719c6368:efe612cfb8341ea9a711090a313aa31d$
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
            -- m1
            x=0,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m2
            x=107,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m3
            x=214,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m4
            x=321,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m5
            x=428,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m6
            x=535,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m7
            x=642,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m8
            x=749,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m9
            x=856,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m10
            x=963,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m11
            x=1070,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m12
            x=1177,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m13
            x=1284,
            y=0,
            width=107,
            height=111,

        },
        {
            -- m14
            x=1391,
            y=0,
            width=107,
            height=111,

        },
    },
    
    sheetContentWidth = 1498,
    sheetContentHeight = 111
}

SheetInfo.frameIndex =
{

    ["m1"] = 1,
    ["m2"] = 2,
    ["m3"] = 3,
    ["m4"] = 4,
    ["m5"] = 5,
    ["m6"] = 6,
    ["m7"] = 7,
    ["m8"] = 8,
    ["m9"] = 9,
    ["m10"] = 10,
    ["m11"] = 11,
    ["m12"] = 12,
    ["m13"] = 13,
    ["m14"] = 14,
}

function SheetInfo:getSheet()
    return SheetInfo.sheet;
end

function SheetInfo:getFrameIndex(name)
    return SheetInfo.frameIndex[name];
end

return SheetInfo
