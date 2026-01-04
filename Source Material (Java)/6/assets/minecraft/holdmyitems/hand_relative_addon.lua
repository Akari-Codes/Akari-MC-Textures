global.inspectionSpin = 0.0;

if string.find(I:getActualName(item), "Plated") or string.find(I:getActualName(item), "plated") or string.find(I:getActualName(item), "Plate") or string.find(I:getActualName(item), "plate") then
    M:rotateY(matrices, 4 * M:sin(Easings:easeInOutBack(inspectionSpin) * 6.28))
end