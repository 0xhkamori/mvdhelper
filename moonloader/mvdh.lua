local encoding = require 'encoding'
local imgui = require 'imgui'
local key = require 'vkeys'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local plrName = imgui.ImBuffer(256)
local plrRank = imgui.ImBuffer(256)
local plrUnit = imgui.ImBuffer(256)
local plrLetter = imgui.ImBuffer(256)
local fam = imgui.ImBuffer(256)
local post = imgui.ImBuffer(256)
local wtd = 'Занял/Стою/Покинул'
local sost = 'Стабильное / Критичное'
local test_text_buffer3 = imgui.ImBuffer(256)

local combo_select = imgui.ImInt(0)
local combo_select2 = imgui.ImInt(0)

function mdoc1(arg)
    lua_thread.create(function()
        sampSendChat(u8:decode('Здравия желаю. ' .. plrRank.v .. ' полиции по Нижегородской Области, ' .. plrName.v .. '.'))
        wait(2000)
        sampSendChat(u8:decode('/anim 1 7'))
        wait(1000)
        sampSendChat(u8:decode('/do Удостоверение в нагрудном кармане.'))
        wait(1000)
        sampSendChat(u8:decode('/me правой рукой придерживает кобуру, левой достаёт удостоверение'))
        wait(1000)
        sampSendChat(u8:decode('/todo Показав открытое удостоверение*Ознакамливайтесь.'))
        wait(1000)
        sampSendChat(u8:decode('/doc ' .. arg .. ''))
        wait(1000)
        sampSendChat(u8:decode('/me продемонстрировав удостоверение, убрал его обратно в карман'))
    end)
end

function mdoc2()
    lua_thread.create(function()
        sampSendChat(u8:decode('Пожалуйста предъявите ваш паспорт и лицензии.'))
        wait(250)
        sampSendChat(u8:decode('/n /pass [id] | /lic [id]'))
        wait(800)
        sampSendChat(u8:decode('За отказ от требований сотрудника МВД на Вас будет заведено уголовное дело.'))
    end)
end

function mdoc3()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/anim 6 3'))
        wait(200)
        sampSendChat(u8:decode('/me взял документы у гражданина напротив'))
        wait(750)
        sampSendChat(u8:decode('/me достал полицейский планшет из кармана, затем ввёл при запросах пароль "******"'))
        wait(750)
        sampSendChat(u8:decode('/me вводит данные гражданина в компьютерную систему'))
        wait(800)
        sampSendChat(u8:decode('/me проверяет документы на предмет подлинности и подлинность фотографии'))
        wait(800)
        sampSendChat(u8:decode('/me выключает полицейский планшет, затем убирает в карман'))
        wait(800)
        sampSendChat(u8:decode('/me возвращает документы человеку напротив'))
    end)
end

function mdoc4()
    lua_thread.create(function ()
        sampSendChat(u8:decode('Хорошо, можете быть свободны.'))
    end)
end

sampRegisterChatCommand('mdoc1', mdoc1)
sampRegisterChatCommand('mdoc2', mdoc2)
sampRegisterChatCommand('mdoc3', mdoc3)
sampRegisterChatCommand('mdoc4', mdoc4)

function mcardoc1()
    lua_thread.create(function ()
        sampSendChat(u8:decode('Пожалуйста предъявите документы на ваше т/с.'))
        wait(250)
        sampSendChat(u8:decode('/n /carpass [id]'))
        wait(800)
        sampSendChat(u8:decode('За отказ от требований сотрудника МВД на Вас будет заведено уголовное дело.'))
    end)
end

function mcardoc2()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/anim 6 3'))
        wait(200)
        sampSendChat(u8:decode('/me взял документы на т/с у гражданина напротив'))
        wait(750)
        sampSendChat(u8:decode('/me достал полицейский планшет из кармана, затем ввёл при запросах пароль "******"'))
        wait(750)
        sampSendChat(u8:decode('/me вводит данные о т/с в компьютерную систему'))
        wait(800)
        sampSendChat(u8:decode('/me проверяет документы на предмет подлинности'))
        wait(800)
        sampSendChat(u8:decode('/me выключает полицейский планшет, затем убирает в карман'))
        wait(800)
        sampSendChat(u8:decode('/me возвращает документы на т/с человеку напротив'))
    end)
end

sampRegisterChatCommand('mcardoc1', mcardoc1)
sampRegisterChatCommand('mcardoc2', mcardoc2)

function mcuff(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/todo Сев на человека сверху*Руки за спину.'))
        wait(600)
        sampSendChat(u8:decode('/me правой рукой снял наручники с пояса, левой придерживает руки человека'))
        wait(600)
        sampSendChat(u8:decode('/do Идёт процесс надевания наручников.'))
        wait(600)
        sampSendChat(u8:decode('/me туго застегнул манжеты на руках человека'))
        wait(900)
        sampSendChat(u8:decode('/cuff ' .. arg .. ''))
        wait(900)
        sampSendChat(u8:decode('/escort ' .. arg .. ''))
        wait(600)
        sampSendChat(u8:decode('/todo Поднимая человека с земли*Ноги под себя!'))
        wait(600)
        sampSendChat(u8:decode('/todo Говоря в рацию*Провожу задержание.'))
        wait(900)
        sampSendChat(u8:decode('/r [ ' .. plrLetter.v .. ' | ' .. plrUnit.v .. ' ] Произвожу задержание.'))
    end)
end

function muncuff(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/do Человек в наручниках.'))
        wait(700)
        sampSendChat(u8:decode('/me снял ключи с пояса, после чего подобрав нужный вставил его в скважину'))
        wait(700)
        sampSendChat(u8:decode('/do Идёт процесс открывания наручников.'))
        wait(700)
        sampSendChat(u8:decode('/me повесил наручники на пояс'))
        wait(500)
        sampSendChat(u8:decode('Стоять на месте.'))
        wait(700)
        sampSendChat(u8:decode('/uncuff ' .. arg .. ''))
        wait(700)
        sampSendChat(u8:decode('/escort ' .. arg .. ''))
        wait(500)
        sampSendChat(u8:decode('/todo Говоря в рацию*С задержанного сняты наручники.'))
        wait(700)
        sampSendChat(u8:decode('/r [ ' .. plrLetter.v .. ' | ' .. plrUnit.v .. ' ] С задержанного сняты наручники.'))
    end)
end

sampRegisterChatCommand('mcuff', mcuff)
sampRegisterChatCommand('muncuff', muncuff)

function mpgcmd(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял рацию с нагрудного кармашка и вышел с Диспетчером на связь'))
        wait(500)
        sampSendChat(u8:decode('/do Диспетчер на связи.'))
        wait(600)
        sampSendChat(u8:decode('/me сообщил диспетчеру о начале погони за нарушителем'))
        wait(200)
        sampSendChat(u8:decode('/r [ ' .. plrLetter.v .. ' | ' .. plrUnit.v .. ' ] Веду погоню за нарушителем.'))
        wait(200)
        sampSendChat(u8:decode('/pg ' .. arg .. ''))
    end)
end

function mputpl(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me открыл заднюю дверь патрульного автомобиля'))
        wait(500)
        sampSendChat(u8:decode('/todo Пригнув голову преступника*Не рыпаемся!'))
        wait(500)
        sampSendChat(u8:decode('/do Задержанный находится в патрульной машине.'))
        wait(500)
        sampSendChat(u8:decode('/me закрыл заднюю дверь автомобиля'))
        wait(300)
        sampSendChat(u8:decode('/putpl ' .. arg .. ''))
    end)
end

function msu(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял КПК с поясной сумки'))
        wait(2000)
        sampSendChat(u8:decode('/me выбрал приложение "База Данных МВД | Уголовный кодекс"'))
        wait(2000)
        sampSendChat(u8:decode('/me ввёл пароли при запросе "******" и подтвердил отпечатком пальца свою личность'))
        wait(2000)
        sampSendChat(u8:decode('/su ' .. arg .. ''))
        wait(500)
        sampSendChat(u8:decode('/me внес данные преступника в базу данных МВД'))
        wait(2000)
        sampSendChat(u8:decode('/do Преступник объявлен в розыск.'))
        wait(6000)
        sampSendChat(u8:decode('/me выключил и убрал КПК в поясную сумку'))
    end)
end

function mcarsu(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял КПК с поясной сумки'))
        wait(2000)
        sampSendChat(u8:decode('/me выбрал приложение "База Данных МВД | Уголовный кодекс"'))
        wait(2000)
        sampSendChat(u8:decode('/me ввёл пароли при запросе "******" и подтвердил отпечатком пальца свою личность'))
        wait(2000)
        sampSendChat(u8:decode('/me внес регистрационный номер т/с преступника в базу данных МВД'))
        wait(2000)
        sampSendChat(u8:decode('/do Преступник объявлен в розыск.'))
        wait(6000)
        sampSendChat(u8:decode('/me выключил и убрал КПК в поясную сумку'))
        wait(600)
        sampSendChat(u8:decode('/su ' .. arg .. ''))
    end)
end

function mticket()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял КПК с поясной сумки'))
        wait(2000)
        sampSendChat(u8:decode('/me выбрал приложение "База Данных МВД | Кодекс об Административных Правонарушениях"'))
        wait(2000)
        sampSendChat(u8:decode('/me ввёл пароли при запросе "******" и подтвердил отпечатком пальца свою личность'))
        wait(2000)
        sampSendChat(u8:decode('/me внес данные гражданина/гражданки в базу данных МВД'))
        wait(2000)
        sampSendChat(u8:decode('/me записал данные Инспектора, составлявшего протокол'))
        wait(2000)
        sampSendChat(u8:decode('/me записал причину выписывания протокола'))
        wait(2000)
        sampSendChat(u8:decode('/me записал место, дату и время совершения правонарушения'))
        wait(2000)
        sampSendChat(u8:decode('/me заполнив все поля, поставил подпись и опубликовал запись, выключил и убрал КПК в поясную сумку'))
        wait(2500)
        sampSendChat(u8:decode('Штраф был выдан в электронном виде. Оплатить его можно с помощью Банкомата или же в Банке.'))
        wait(3000)
        sampSendChat(u8:decode('Больше не нарушайте!'))
    end)
end

sampRegisterChatCommand('mpg', mpgcmd)
sampRegisterChatCommand('mputpl', mputpl)
sampRegisterChatCommand('msu', msu)
sampRegisterChatCommand('mcarsu', mcarsu)
sampRegisterChatCommand('mticket', mticket)

function mg1()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял с плеча Громкоговоритель в руки и зажал кнопку разговора'))
        wait(100)
        sampSendChat(u8:decode('/m [МВД] Водитель транспортного средвства прижмитесь к обочине!'))
    end)
end

function mg2()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял с плеча Громкоговоритель в руки и зажал кнопку разговора'))
        wait(100)
        sampSendChat(u8:decode('/m [МВД] Остановите транспортное средство без дальнейшего сопротивления!'))
    end)
end

function mg3()
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял с плеча Громкоговоритель в руки и зажал кнопку разговора'))
        wait(100)
        sampSendChat(u8:decode('/m [МВД] Делаю принудительный выстрел. Это последнее предупреждение{!}'))
    end)
end

sampRegisterChatCommand('mg1', mg1)
sampRegisterChatCommand('mg2', mg2)
sampRegisterChatCommand('mg3', mg3)

function meject(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me снял дубинку с поясного крепления'))
        wait(600)
        sampSendChat(u8:decode('/me размахнулся и ударил дубинкой по окну'))
        wait(700)
        sampSendChat(u8:decode('/todo Убрав осколки стекла*За сопротивление может последовать статья!'))
        wait(600)
        sampSendChat(u8:decode('/me дернул ручку ТС, затем вытащил преступника'))
        wait(800)
        sampSendChat(u8:decode('/ejectout ' .. arg .. ''))
    end)
end

function marrest(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me схватил задержанного за руки'))
        wait(700)
        sampSendChat(u8:decode('/me взял КПК из поясной сумки и включил его, выбрал приложение "База Данных МВД"'))
        wait(750)
        sampSendChat(u8:decode('/me ввёл пароли при запросе "******" и подтвердил отпечатком пальца свою личность'))
        wait(800)
        sampSendChat(u8:decode('/do Заключённому выдан номер, а так же введено поле: дата,время,причина задержания.'))
        wait(800)
        sampSendChat(u8:decode('/me записал в базе данных личную информацию заключённого'))
        wait(900)
        sampSendChat(u8:decode('/do Положительное поле заключённого: "Имеет право на Адвоката".'))
        wait(800)
        sampSendChat(u8:decode('/do Задержанный введён в Базу Данных и сохранён.'))
        wait(700)
        sampSendChat(u8:decode('/r [' .. plrLetter.v .. ' | ' .. plrUnit.v .. '] Подозреваемый заключен под стражу и оформлен в изолятор.'))
        wait(800)
        sampSendChat(u8:decode('/me передал преступника в КПЗ министерства внутренних дел'))
        wait(800)
        sampSendChat(u8:decode('/arrest ' .. arg .. ''))
    end)
end

function marrest1()
    lua_thread.create(function ()
        sampSendChat(u8:decode('Вы имеете право хранить молчание, право на отказ от дачи показаний против себя.'))
        wait(1000)
        sampSendChat(u8:decode('Всё, что вы скажите, может использовано против вас в суде.'))
        wait(1000)
        sampSendChat(u8:decode('Ваш адвокат может присутствовать при допросе. Или же будет предоставлен государством.'))
        wait(1000)
        sampSendChat(u8:decode('Все действия сотрудников полиции, Вы имеете право обжаловать в судебном порядке.'))
    end)
end

sampRegisterChatCommand('meject', meject)
sampRegisterChatCommand('marrest', marrest)
sampRegisterChatCommand('marrest1', marrest1)

function mtakelic(arg)
    lua_thread.create(function ()
        sampSendChat(u8:decode('/me взял КПК из поясной сумки и включил его, выбрал приложение "База Данных МВД"'))
        wait(800)
        sampSendChat(u8:decode('/me ввёл пароли при запросе "******" и подтвердил отпечатком пальца свою личность'))
        wait(800)
        sampSendChat(u8:decode('/me ввёл данные правонарушителя и записал данные о нарушении'))
        wait(700)
        sampSendChat(u8:decode('/me изъял нужный тип лицензии'))
        wait(500)
        sampSendChat(u8:decode('/do Лицензия отобрана.'))
        wait(800)
        sampSendChat(u8:decode('/takelic ' .. arg .. ''))
    end)
end

sampRegisterChatCommand('mtakelic', mtakelic)

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    style.WindowRounding = 2
    style.WindowTitleAlign = imgui.ImVec2(0.5, 0.5)
    style.ChildWindowRounding = 2.0
    style.FrameRounding = 3
    style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
    style.ScrollbarSize = 13.0
    style.ScrollbarRounding = 0
    style.GrabMinSize = 8.0
    style.GrabRounding = 1.0
    style.WindowPadding = imgui.ImVec2(4.0, 4.0)
    style.FramePadding = imgui.ImVec2(3.5, 3.5)
    style.ButtonTextAlign = imgui.ImVec2(0.0, 0.5)
    colors[clr.WindowBg]              = ImVec4(0.14, 0.12, 0.16, 1.00);
    colors[clr.ChildWindowBg]         = ImVec4(0.30, 0.20, 0.39, 0.00);
    colors[clr.PopupBg]               = ImVec4(0.05, 0.05, 0.10, 0.90);
    colors[clr.Border]                = ImVec4(0.89, 0.85, 0.92, 0.30);
    colors[clr.BorderShadow]          = ImVec4(0.00, 0.00, 0.00, 0.00);
    colors[clr.FrameBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.FrameBgHovered]        = ImVec4(0.41, 0.19, 0.63, 0.68);
    colors[clr.FrameBgActive]         = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TitleBg]               = ImVec4(0.41, 0.19, 0.63, 0.45);
    colors[clr.TitleBgCollapsed]      = ImVec4(0.41, 0.19, 0.63, 0.35);
    colors[clr.TitleBgActive]         = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.MenuBarBg]             = ImVec4(0.30, 0.20, 0.39, 0.57);
    colors[clr.ScrollbarBg]           = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.ScrollbarGrab]         = ImVec4(0.41, 0.19, 0.63, 0.31);
    colors[clr.ScrollbarGrabHovered]  = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ScrollbarGrabActive]   = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ComboBg]               = ImVec4(0.30, 0.20, 0.39, 1.00);
    colors[clr.CheckMark]             = ImVec4(0.56, 0.61, 1.00, 1.00);
    colors[clr.SliderGrab]            = ImVec4(0.41, 0.19, 0.63, 0.24);
    colors[clr.SliderGrabActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.Button]                = ImVec4(0.41, 0.19, 0.63, 0.44);
    colors[clr.ButtonHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.ButtonActive]          = ImVec4(0.64, 0.33, 0.94, 1.00);
    colors[clr.Header]                = ImVec4(0.41, 0.19, 0.63, 0.76);
    colors[clr.HeaderHovered]         = ImVec4(0.41, 0.19, 0.63, 0.86);
    colors[clr.HeaderActive]          = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.ResizeGrip]            = ImVec4(0.41, 0.19, 0.63, 0.20);
    colors[clr.ResizeGripHovered]     = ImVec4(0.41, 0.19, 0.63, 0.78);
    colors[clr.ResizeGripActive]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.CloseButton]           = ImVec4(1.00, 1.00, 1.00, 0.75);
    colors[clr.CloseButtonHovered]    = ImVec4(0.88, 0.74, 1.00, 0.59);
    colors[clr.CloseButtonActive]     = ImVec4(0.88, 0.85, 0.92, 1.00);
    colors[clr.PlotLines]             = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotLinesHovered]      = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.PlotHistogram]         = ImVec4(0.89, 0.85, 0.92, 0.63);
    colors[clr.PlotHistogramHovered]  = ImVec4(0.41, 0.19, 0.63, 1.00);
    colors[clr.TextSelectedBg]        = ImVec4(0.41, 0.19, 0.63, 0.43);
    colors[clr.ModalWindowDarkening]  = ImVec4(0.20, 0.20, 0.20, 0.35);
end
apply_custom_style()

local menu = {true, -- первая вкладка будет активная, когда откроешь окно
    false,
    false,
    false,}

local main_window_state = imgui.ImBool(false)
function imgui.OnDrawFrame()
  if main_window_state.v then
    imgui.SetNextWindowSize(imgui.ImVec2(550, 300), imgui.Cond.FirstUseEver)
    imgui.Begin('MVDHelper by Line_Hearter', main_window_state)
    imgui.BeginGroup()
    if imgui.Button('Биндер') then
        uu() menu[1] = true
    end
    imgui.SameLine()
    if imgui.Button('Доклады в рацию') then
        uu() menu[2] = true
    end
    imgui.SameLine()
    if imgui.Button('Настройки') then
        uu() menu[3] = true
    end
    imgui.SameLine()
    imgui.EndGroup()
    imgui.Separator()
    if menu[1] then
        if imgui.Button('Приветствие') then
            mdoc1(39210)
        end
        imgui.SameLine()
        if imgui.Button('Запросить документы') then
            mdoc2()
        end
        imgui.SameLine()
        if imgui.Button('Проверка документов') then
            mdoc3()
        end
        imgui.SameLine()
        if imgui.Button('Освободить') then
            mdoc4()
        end
        imgui.SameLine()
        if imgui.Button('Запросить птс') then
            mcardoc1()
        end
        if imgui.Button('Проверить птс') then
            mcardoc2()
        end
        imgui.SameLine()
        if imgui.Button('Просьба остановиться 1') then
            mg1()
        end
        imgui.SameLine()
        if imgui.Button('Просьба остановиться 2') then
            mg2()
        end
        imgui.SameLine()
        if imgui.Button('Просьба остановиться 3') then
            mg3()
        end
        if imgui.Button('Зачитать миранду') then
            marrest1()
        end
    end
    if menu[2] then
        arr_str = {'Выбрать', 'Занял пост', 'Продолжаю стоять', 'Покинул пост'}
        imgui.Combo("Доклад", combo_select, arr_str, #arr_str)
        if combo_select.v == 0 then
            wtd = 'Занял/Стою/Покинул'
        end
        if combo_select.v == 1 then
            wtd = 'занял пост'
        end
        if combo_select.v == 2 then
            wtd = 'продолжаю стоять на посту'
        end
        if combo_select.v == 3 then
            wtd = 'покинул пост'
        end
        arr_str2 = {'Выбрать', 'Стабильное', 'Критичное'}
        imgui.Combo("Состояние", combo_select2, arr_str2, #arr_str2)
        if combo_select2.v == 0 then
            sost = 'стабильное/критичное'
        end
        if combo_select2.v == 1 then
            sost = 'стабильное'
        end
        if combo_select2.v == 2 then
            sost = 'критичное'
        end
        imgui.PushItemWidth(120)
        imgui.InputText('Название поста', test_text_buffer3)
        imgui.Separator()
        imgui.Text('Результат:')
        imgui.Text(' [' .. plrLetter.v .. '] Докладывает ' .. fam.v .. ', ' .. wtd .. ' '  .. test_text_buffer3.v .. '. Состояние ' .. sost .. '.')
        if imgui.Button('Отправить') then
            sampSendChat('/n [' .. plrLetter.v .. '] Докладывает ' .. fam.v .. ', ' .. wtd .. ' '  .. post.v .. '. Состояние ' .. sost .. '.')
        end
    end
    if menu [3] then
        imgui.PushItemWidth(150)
        imgui.InputText('Имя Фамилия', plrName)
        imgui.InputText('Звание', plrRank)
        imgui.InputText('Подразделение', plrUnit)
        imgui.InputText('Тег', plrLetter)
        imgui.InputText('Фамилия', fam)
    end
    imgui.End()
  end
end

function uu()
    for i = 0,3 do
        menu[i] = false
    end
end

function main()
    while true do
      wait(0)
      if wasKeyPressed(key.VK_X) then -- активация по нажатию клавиши X
          main_window_state.v = not main_window_state.v -- переключаем статус активности окна, не забываем про .v
      end
      imgui.Process = main_window_state.v -- теперь значение imgui.Process всегда будет задаваться в зависимости от активности основного окна
    end
  end
