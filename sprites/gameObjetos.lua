--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:57943b154c256a58d37a29c7447a293f:97f620d62c03d1456d2f49fdbf8e256a:7b2990449a02e98095962ffdba88e157$
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
            -- balaLamp
            x=0,
            y=0,
            width=185,
            height=61,

        },
        {
            -- ilustraSeca
            x=0,
            y=61,
            width=200,
            height=356,

        },
    },
    
    sheetContentWidth = 200,
    sheetContentHeight = 417
}

SheetInfo.frameIndex =
{

    ["balaLamp"] = 1,
    ["ilustraSeca"] = 2,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
