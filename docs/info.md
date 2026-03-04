<!---

This file is used to generate your project datasheet. Please fill in the information below and delete any unused
sections.

You can also include images in this folder and reference them in the markdown. Each image must be less than
512 kb in size, and the combined size of all images must be less than 1 MB.
-->

## How it works

Explain how your project works

The counter increments from zero, if player presses stop at the target value (10), the player wins.


## How to test

Explain how to use your project

The testbench has 4 tests. 
1. Test to see if it accurately fails. The STOP button is triggered when the count = 5, not 10. Successfully fails.
2. Test to see if it accurately wins. The STOP button is triggered when count = 10.
3. Test to see if STOP successfully prevented the count value from increasing. Count stays at 10.
4. Test the RESET functionality. Count == 0; win == 0;


## External hardware

List external hardware used in your project (e.g. PMOD, LED display, etc), if any

None. Tested all variables with simulator. Would have had STOP and RESET buttons. 

## AI Use
I had it help with my initial testbench and using github. Here's the conversation.
https://claude.ai/share/9f1d98b1-4a3e-4a47-bd5f-6cc5940e33fc
