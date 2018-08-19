local function mk_fields(fields)
  local out = {}
  for i = 1, #fields do out[fields[i]] = {} end
  return { fields = out }
end

local std = {
  ignore = {
    "21/_.*"  -- Unused variables starting with _
  },
  globals = {
    "string.startsWith"
  },
  read_globals = {
    howlci = mk_fields { "log", "status", "close", "resize", "getEnv", "getConfig", "setDay", "setTime" },
    fs = mk_fields { "makeDir", "complete", "copy", "isDir", "list", "getSize",
      "delete", "isReadOnly", "getFreeSpace", "find", "getDrive", "exists",
      "move", "combine", "getName", "getDir", "open" },
    colours = mk_fields { "cyan", "purple", "brown", "lightGrey", "orange",
      "red", "magenta", "blue", "white", "grey", "rgb8", "pink", "test",
      "subtract", "black", "green", "combine", "yellow", "lime", "lightBlue" },
    tostring = {},
    _CC_DEFAULT_SETTINGS = {},
    getfenv = {},
    debug = mk_fields { "getupvalue", "debug", "getfenv", "getmetatable",
      "gethook", "setmetatable", "setfenv", "traceback", "getinfo", "setlocal",
      "setupvalue", "sethook", "getregistry", "getlocal" },
    disk = mk_fields { "getID", "isPresent", "eject", "getMountPath", "stopAudio",
      "getLabel", "hasAudio", "playAudio", "getAudioTitle", "setLabel", "hasData" },
    assert = {},
    tonumber = {},
    io = mk_fields { "lines", "write", "close", "flush", "open", "output", "read",
      "input", "type" },
    redstone = mk_fields { "setAnalogOutput", "getBundledOutput", "getBundledInput",
      "setOutput", "setAnalogueOutput", "getInput", "getOutput", "setBundledOutput",
      "getAnalogueOutput", "testBundledInput", "getSides", "getAnalogInput", "getAnalogOutput", "getAnalogueInput" },
    load = {},
    http = mk_fields { "checkURLAsync", "websocketAsync", "checkURL", "request",
      "websocket", "post", "get" },
    _G = {
      read_only = false,
      other_fields = true,
    },
    peripheral = mk_fields { "call", "isPresent", "getType", "getMethods",
      "wrap", "find", "getNames" },
    vector = mk_fields { "new" },
    term = mk_fields { "getCursorPos", "isColour", "getBackgroundColor",
      "getTextColour", "scroll", "redirect", "getPaletteColor", "setTextColor",
      "native", "setPaletteColour", "getTextColor", "clear", "write",
      "setPaletteColor", "setCursorPos", "getBackgroundColour", "isColor",
      "setTextColour", "blit", "current", "getSize", "getPaletteColour",
      "setCursorBlink", "setBackgroundColor", "setBackgroundColour", "clearLine" },
    coroutine = mk_fields { "running", "yield", "status", "wrap", "create", "resume" },
    textutils = mk_fields { "serialize", "unserialize", "empty_json_array",
      "serializeJSON", "urlEncode", "serialiseJSON", "complete", "serialise",
      "formatTime", "pagedTabulate", "slowWrite", "slowPrint", "pagedPrint",
      "tabulate", "unserialise" },
    loadstring = {},
    rednet = mk_fields { "CHANNEL_REPEAT", "isOpen", "unhost", "close", "send",
    "open", "host", "CHANNEL_BROADCAST", "broadcast", "run", "receive", "lookup" },
    _HOST = {},
    string = mk_fields { "sub", "find", "len", "gfind", "reverse", "rep", "match",
      "gmatch", "dump", "byte", "upper", "gsub", "format", "char", "lower" },
    xpcall = {},
    package = {
      fields = {
        preload = {},
        config = {},
        loaders = {},
        loaded = {
          read_only = false,
          other_fields = true,
        },
        path = {},
      },
    },
    parallel = mk_fields { "waitForAll", "waitForAny" },
    print = {},
    unpack = {},
    __inext = {},
    printError = {},
    require = {},
    _ENV = {
      read_only = false,
      other_fields = true,
    },
    write = {},
    next = {},
    ipairs = {},
    rawequal = {},
    getmetatable = {},
    sleep = {},
    loadfile = {},
    settings = mk_fields { "clear", "unset", "set", "getNames", "save", "load", "get" },
    rawset = {},
    dofile = {},
    bit32 = mk_fields { "band", "rshift", "bor", "bnot", "bxor", "arshift",
      "btest", "lrotate", "lshift", "replace", "rrotate", "extract" },
    pairs = {},
    rs = mk_fields { "setAnalogOutput", "getBundledOutput",
      "getBundledInput", "setOutput", "setAnalogueOutput", "getInput",
      "getOutput", "setBundledOutput", "getAnalogueOutput", "testBundledInput",
      "getSides", "getAnalogInput", "getAnalogOutput", "getAnalogueInput" },
    help = mk_fields { "path", "topics", "completeTopic", "setPath", "lookup" },
    window = mk_fields { "create" },
    math = mk_fields { "log", "ceil", "atan", "acos", "ldexp", "rad", "pow",
      "asin", "pi", "deg", "tan", "cos", "tanh", "random", "abs", "frexp",
      "log10", "floor", "sinh", "max", "sqrt", "modf", "huge", "min", "mod",
      "fmod", "randomseed", "atan2", "exp", "sin", "cosh" },
    _VERSION = {},
    pcall = {},
    keys = mk_fields { "a", "c", "b", "e", "pageUp", "g", "f", "i", "h", "k",
      "j", "space", "l", "o", "n", "q", "f1", "s", "insert", "u", "t", "eight",
      "numPadEnter", "six", "x", "numPad6", "z", "backslash", "rightBracket",
      "f9", "yen", "left", "numPadSubtract", "noconvert", "grave", "rightCtrl",
      "numPad2", "rightAlt", "delete", "f4", "home", "leftAlt", "numPad8",
      "getName", "numLock", "f8", "r", "pageDown", "y", "numPadEquals", "at",
      "pause", "w", "f11", "slash", "f5", "rightShift", "period", "multiply",
      "numPad0", "nine", "f13", "capsLock", "two", "leftBracket", "minus",
      "scollLock", "colon", "f14", "v", "equals", "three", "up", "d", "convert",
      "f7", "apostrophe", "f15", "f10", "stop", "f2", "numPad3", "comma",
      "numPad1", "numPadAdd", "tab", "f3", "numPad4", "kana", "four", "right",
      "numPadDecimal", "numPad7", "leftShift", "backspace", "numPad9", "end",
      "one", "kanji", "cimcumflex", "m", "semiColon", "underscore", "zero", "p",
      "return", "ax", "seven", "f6", "enter", "numPadDivide", "numPad5", "f12",
      "leftCtrl", "down", "five", "numPadComma" },
    gps = mk_fields { "CHANNEL_GPS", "locate" },
    bit = mk_fields { "band", "blogic_rshift", "bxor", "bor", "bnot", "blshift", "brshift" },
    select = {},
    paintutils = mk_fields { "drawPixel", "drawLine", "loadImage", "drawImage",
      "drawFilledBox", "parseImage", "drawBox" },
    os = mk_fields { "sleep", "unloadAPI", "getComputerID", "startTimer",
      "queueEvent", "cancelTimer", "time", "clock", "setAlarm", "computerID",
      "reboot", "getComputerLabel", "setComputerLabel", "run", "pullEventRaw",
      "cancelAlarm", "computerLabel", "version", "shutdown", "loadAPI",
      "pullEvent", "epoch", "day" },
    rawget = {},
    table = mk_fields { "pack", "insert", "getn", "foreachi", "maxn",
      "foreach", "sort", "unpack", "concat", "remove" },
    read = {},
    colors = mk_fields { "cyan", "purple", "brown", "orange", "red",
      "magenta", "lime", "white", "blue", "rgb8", "lightGray", "pink", "test",
      "subtract", "black", "green", "combine", "yellow", "lightBlue", "gray" },
    setfenv = {},
    setmetatable = {},
    type = {},
    error = {},
    shell = mk_fields { "exit", "path", "setDir", "clearAlias", "programs", "dir",
    "getCompletionInfo", "resolveProgram", "setPath", "getRunningProgram",
    "setCompletionFunction", "history", "run", "complete", "completeProgram",
    "resolve", "setAlias", "aliases" },
  }
}

return std
