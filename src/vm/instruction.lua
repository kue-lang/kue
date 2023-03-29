--++===================================
--+ Kue
--+ Programming Language
--+ (c) 2023 UrNightmaree
--+
--+ @file: vm/instruction.lua
--++===================================

--+ This file contains code for:
--+ - Stack system
--+ - Instruction struct
--+ - Instruction table struct

local Stack = {}
local Stack_mt = {
    __index = Stack,
}

function Stack.new()
    return setmetatable({
        _stack = {}
    }, Stack_mt)
end

function Stack:is_empty()
    return #self._stack == 0
end

function Stack:push(v)
    self._stack[#self._stack+1] = v
end

function Stack:pop()
    if self:is_empty() then
        error "Unable to pop from empty stack"
    end

    return table.remove(self._stack)
end

local Instruction = {}
local Instruction_mt = {
    __index = Instruction,
}

function Instruction.new(op_code, name, arity, fun)
    return setmetatable({
        op_code = op_code,
        name = name,
        arity = arity,
        fun = fun
    }, Instruction_mt)
end

local InstructionTable = {}
local InstructionTable_mt = {
    __index = InstructionTable,
}

function InstructionTable.new()
    return setmetatable({
        _struct = {}
    }, InstructionTable_mt)
end

function InstructionTable:by_op_code(op_code)
    return self._struct[op_code]
end

function InstructionTable:by_name(name)
    local instr
    for _,v in pairs(self._struct) do
        if v.name == name then
            instr = v; break
        end
    end
    return instr
end

function InstructionTable:insert(instr)
    self._struct[instr.op_code] = instr
end

function InstructionTable:is_empty()
    return not next(self._struct)
end

return {
    Stack = Stack,
    Instruction = Instruction,
    InstructionTable = InstructionTable
}
