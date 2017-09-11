--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:647ff9205cb7d7870ce5512483ee5186:be9e9b39ebabb41d2601c1455e6ba6df:ea5b20a357678e216f8f103ceaea49b3$
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
            -- sertao
            x=0,
            y=0,
            width=1920,
            height=1080,

        },
    },
    
    sheetContentWidth = 1920,
    sheetContentHeight = 1080
}

SheetInfo.frameIndex =
{

    ["sertao"] = 1,
}

function SheetInfo:getSheet()
    return SheetInfo.sheet;
end

function SheetInfo:getFrameIndex(name)
    return SheetInfo.frameIndex[name];
end

return SheetInfo
