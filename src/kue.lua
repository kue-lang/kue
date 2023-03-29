--++===================================
--+ Kue
--+ Programming Language
--+ (c) 2023 UrNightmaree
--+
--+ @file: kue.lua
--++===================================

--+ Main entries for running Kue code, this
--+ where the magic starts ✨

local vm_instruction = require "vm.instruction"

local Stack, Instruction, InstructionTable = vm_instruction.Stack, vm_instruction.Instruction, vm_instruction.InstructionTable


local stack = Stack.new()
local instr_tbl = InstructionTable.new()

instr_tbl:insert(Instruction.new(0, "NOOP", 0, function() end))
instr_tbl:insert(Instruction.new(1, "ADD", 0, function()
    if stack:is_empty() or #stack._stack <= 1 then
        error "Trying to add an empty or 1 index stack"
    end

    local val1 = stack:pop()
    local val2 = stack:pop()
    return stack:push(val1 + val2)
end))

do
    stack:push(1)
    stack:push(2)
    instr_tbl:by_name "ADD".fun()
    print(stack:pop())
end
