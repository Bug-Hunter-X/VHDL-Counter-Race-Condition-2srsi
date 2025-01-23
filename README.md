# VHDL Counter Race Condition

This repository demonstrates a common race condition in VHDL that can occur when driving an output signal directly from a process.  The provided code implements a simple counter, but the output `count_out` may not accurately reflect the value of the internal counter due to timing inconsistencies. The solution uses a separate process to guarantee proper synchronization.

## Bug Description

The original `buggy_counter.vhdl` code directly assigns the internal counter's value to the output. This can lead to glitches or incorrect values in `count_out` if the output update doesn't perfectly align with the internal counter changes, particularly at higher clock frequencies or with complex logic.

## Solution

The `fixed_counter.vhdl` code addresses this problem by using a separate process to update the output. This isolates the output update from the internal counter logic, ensuring that `count_out` always reflects the correct value.