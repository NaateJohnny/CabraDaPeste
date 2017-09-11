--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:ac5cda79a090622f4a7bc833d561ad7c:440f20386e3418e880d63d9ac9443c6a:22cd86d88046b35f9f05cfe4818876be$
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
        {
            -- n1
            x=1498,
            y=0,
            width=107,
            height=111,

        },
        {
            -- n2
            x=1605,
            y=0,
            width=107,
            height=111,

        },
        {
            -- n3
            x=1712,
            y=0,
            width=107,
            height=111,

        },
        {
            -- n4
            x=1819,
            y=0,
            width=107,
            height=111,

        },
        {
            -- n5
            x=1926,
            y=0,
            width=107,
            height=111,

        },
        {
            -- n6
            x=0,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n7
            x=107,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n8
            x=214,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n9
            x=321,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n10
            x=428,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n11
            x=535,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n12
            x=642,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n13
            x=749,
            y=111,
            width=107,
            height=111,

        },
        {
            -- n14
            x=856,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p1
            x=963,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p2
            x=1070,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p3
            x=1177,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p4
            x=1284,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p5
            x=1391,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p6
            x=1498,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p7
            x=1605,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p8
            x=1712,
            y=111,
            width=107,
            height=111,

        },
        {
            -- p9
            x=1819,
            y=111,
            width=107,
            height=111,

        },
    },
    
    sheetContentWidth = 2033,
    sheetContentHeight = 222
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
    ["n1"] = 15,
    ["n2"] = 16,
    ["n3"] = 17,
    ["n4"] = 18,
    ["n5"] = 19,
    ["n6"] = 20,
    ["n7"] = 21,
    ["n8"] = 22,
    ["n9"] = 23,
    ["n10"] = 24,
    ["n11"] = 25,
    ["n12"] = 26,
    ["n13"] = 27,
    ["n14"] = 28,
    ["p1"] = 29,
    ["p2"] = 30,
    ["p3"] = 31,
    ["p4"] = 32,
    ["p5"] = 33,
    ["p6"] = 34,
    ["p7"] = 35,
    ["p8"] = 36,
    ["p9"] = 37,
}

function SheetInfo:getSheet()
    return SheetInfo.sheet;
end

function SheetInfo:getFrameIndex(name)
    return SheetInfo.frameIndex[name];
end

return SheetInfo
