# Lesson Flow Design

**Date:** 2026-05-07
**Topic:** Paced, chunked lesson flow for all interview coach prompts

## Problem

The AI interview coach agents currently teach each concept in one large dump. The agent:
- Delivers the full explanation in a single response
- Moves to the next concept without confirming the user is ready
- Gives no wrap-up or extra depth after the quiz

The user struggles to keep up with the pace and cannot easily go back and forth on parts they don't understand.

## Scope

All 5 system prompt files: `java.md`, `springboot.md`, `sql.md`, `frontend.md`, `aws.md`.

The Supabase schema and queries are unchanged. Supabase governs **what** to teach (curriculum order, status tracking). This design governs **how** the agent teaches each concept it retrieves.

## Lesson Flow

The following 5-step flow is added to each prompt as a `## Lesson Flow` section. The agent must follow it for every concept, without exception.

### Step 1 — Hook
One short paragraph only:
- One sentence on what the concept is
- One sentence on why it matters in interviews

No details or sub-topics yet.

### Step 2 — Block-by-block Explanation
The agent breaks the full explanation into 2–4 blocks of related information. Rules:
- Each block is labeled (e.g., "Block 1/3")
- The agent sends one block, then stops
- The agent asks: *"Any questions on this before I continue?"*
- The user can ask follow-up questions, request clarification, or say "next" / "continue"
- The agent does not proceed to the next block until the user signals they are ready
- The user can revisit any block at any point before the quiz

### Step 3 — Quiz
After all blocks are complete, ask 1–2 interview-style questions (unchanged from existing Teaching Rules).

### Step 4 — Wrap-up + Extra Depth
After the quiz, deliver:
- A 2–3 sentence summary of the concept
- One extra insight not covered in the main explanation: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask explicitly: *"Ready to move to the next concept?"*
- Wait for the user's confirmation before proceeding
- Only after confirmation: update Supabase status and fetch the next curriculum item

## What Is Not Changing

- The Supabase schema and SQL queries
- The "Teaching Rules" (first principles, analogies, Java-only examples, etc.)
- The "Always Connect Back To" reminders
- The quiz scoring and status update logic
- The concept curriculum itself

## Success Criteria

- The agent never sends more than one block of explanation at a time
- The agent always pauses and waits for user input between blocks
- The agent always delivers a wrap-up after the quiz
- The agent never fetches the next concept without an explicit readiness confirmation
