# ASSIGNMENT REFLECTION
# PART A: GOTO
My observations on GOTO were that on tasks A1 & A2,it allowed for rapid branching and made the code harder to read and debug.
In task A3, an illegal GOTO branching execution occurs when attempting to jump directly from an outer block structure into an inner conditional IF-THEN block, compilation failed because PL/SQL structural rules strictly forbid branching from a wider scope directly into a deeply nested scope because internal variables or structures within that conditional boundary have not yet been evaluated or initialized by the runtime architecture. 
To solve this structural issue, I completely removed the tag for jump and placed the conditions inside standard IF-THEN-ELSE blocks. This ensures that the execution path remains inside the compiler's expected boundaries.
Refactoring the salary review program in task A4 to use a clean IF-ELSIF-ELSE path provided significant benefits
like removing track errors, making code maintenance easier and improve processing transparency making test scripts much easier.
# PART B: FUNCTIONS
While developing functions in tasks B1 to B4, the modular code can be reused numerous times & can be run seamlessly inside a standalone PL/SQL procedural block or directly inside standard SQL SELECT queries across custom schema tables. Also if calculation rules or tax parameters change, the underlying code only needs to be updated once inside the function body, rather than editing multiple application query files.
In Task C1, handling errors properly proved vital for preventing script crashes. Utilizing custom NO_DATA_FOUND exception blocks and system assertions allows the application to well handle empty query spaces or extreme numeric inputs without halting database session operations.
And in terms of running tests, it was carried out smoothly without any complications.
