local ffi = require 'ffi'
local kernel32 = ffi.load('Kernel32.dll')

ffi.cdef[[
   typedef short WORD;        

   typedef struct _SYSTEMTIME {
      WORD wYear;
      WORD wMonth;
      WORD wDayOfWeek;
      WORD wDay;
      WORD wHour;
      WORD wMinute;
      WORD wSecond;
      WORD wMilliseconds;
   } SYSTEMTIME;

   int __stdcall SetLocalTime(const SYSTEMTIME*);
   void __stdcall GetLocalTime(SYSTEMTIME*);
]]

function setOnlyDate(year, month, day)
   local date = ffi.new('SYSTEMTIME')
   kernel32.GetLocalTime(date)
   date.wYear = year
   date.wMonth = month
   date.wDay = day
   kernel32.SetLocalTime(date)
end

function main()
   while not isSampAvailable() do wait(100) end
   lua_thread.create(function()
      local date = ffi.new('SYSTEMTIME')
      kernel32.GetLocalTime(date)
      printStringNow('Fix moonloader ~g~by yorenov ', 11000)
      setOnlyDate(2020, 02, 02)
      wait(1000)
      setOnlyDate(date.wYear, date.wMonth, date.wDay)
      setOnlyDate(2023, 01, 01)
      wait(10000)
      setOnlyDate(date.wYear, date.wMonth, date.wDay)
      printStringNow('Moonloader fixed ~by yorenov~', 2500)
   end)

   wait(-1)
end