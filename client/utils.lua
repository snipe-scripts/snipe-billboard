AddEventHandler("playerDropped", function()
    ResetAll()
end)

function ResetAll()
    RemoveReplaceTexture("rojo_trinity_billboard", "rojo_trinity_billboard")
    if duiObjbillboard then
        DestroyDui(duiObjbillboard)
    end
end

AddEventHandler('onResourceStop', function(resName)
    if resName == "snipe-billboard" then
        RemoveReplaceTexture("rojo_trinity_billboard", "rojo_trinity_billboard")
        if duiObjbillboard then
            DestroyDui(duiObjbillboard)
        end
    end
end)