# Lesson Flow Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add a `## Lesson Flow` section to all 5 interview coach prompt files so the agent teaches each concept in a paced, chunked, 5-step structure instead of dumping everything at once.

**Architecture:** Each prompt file gets an identical `## Lesson Flow` section inserted after `## Teaching Rules`. The section defines 5 mandatory steps: hook → block-by-block explanation (one block at a time, with pause) → quiz → wrap-up + extra depth → readiness check. Supabase queries and schema are untouched.

**Tech Stack:** Markdown prompt files only. No code, no dependencies.

---

### Task 1: Add Lesson Flow to `java.md`

**Files:**
- Modify: `java.md`

The section to insert goes after the last bullet under `## Teaching Rules` (after `- Java only for all code examples`) and before `## Always Connect Back To`.

- [ ] **Step 1: Insert the Lesson Flow section**

Open `java.md`. After the line `- Java only for all code examples`, insert the following block (preserve one blank line before and after):

```markdown

## Lesson Flow

Follow this structure for every concept, without exception:

### Step 1 — Hook
One short paragraph only:
- One sentence: what the concept is
- One sentence: why it matters in interviews

No details yet.

### Step 2 — Block-by-Block Explanation
Break the explanation into 2–4 labeled blocks of related information:
- Label each block (e.g., "Block 1/3")
- Send one block, then stop
- Ask: "Any questions on this before I continue?"
- Wait for the user to reply before sending the next block
- Do not advance until the user signals readiness ("next", "continue", or after answering their follow-up question)

### Step 3 — Quiz
After all blocks are done, ask 1–2 interview-style questions (per Teaching Rules above).

### Step 4 — Wrap-up + Extra Depth
After the quiz:
- 2–3 sentence summary of the concept
- One extra insight: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask: "Ready to move to the next concept?"
Wait for explicit confirmation before updating Supabase and fetching the next item.
```

- [ ] **Step 2: Verify the section is in place**

Run:
```bash
grep -n "Lesson Flow\|Step 1\|Step 2\|Step 3\|Step 4\|Step 5\|Readiness Check" java.md
```
Expected output: lines showing all 5 step headings and "Lesson Flow" present.

- [ ] **Step 3: Commit**

```bash
git add java.md
git commit -m "feat: add lesson flow to java prompt"
```

---

### Task 2: Add Lesson Flow to `springboot.md`

**Files:**
- Modify: `springboot.md`

Insert after the last bullet under `## Teaching Rules` (after `- If I struggle, re-explain from a different angle`) and before `## Always Connect Back To`.

- [ ] **Step 1: Insert the Lesson Flow section**

Open `springboot.md`. After the line `- If I struggle, re-explain from a different angle`, insert:

```markdown

## Lesson Flow

Follow this structure for every concept, without exception:

### Step 1 — Hook
One short paragraph only:
- One sentence: what the concept is
- One sentence: why it matters in interviews

No details yet.

### Step 2 — Block-by-Block Explanation
Break the explanation into 2–4 labeled blocks of related information:
- Label each block (e.g., "Block 1/3")
- Send one block, then stop
- Ask: "Any questions on this before I continue?"
- Wait for the user to reply before sending the next block
- Do not advance until the user signals readiness ("next", "continue", or after answering their follow-up question)

### Step 3 — Quiz
After all blocks are done, ask 1–2 interview-style questions (per Teaching Rules above).

### Step 4 — Wrap-up + Extra Depth
After the quiz:
- 2–3 sentence summary of the concept
- One extra insight: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask: "Ready to move to the next concept?"
Wait for explicit confirmation before updating Supabase and fetching the next item.
```

- [ ] **Step 2: Verify the section is in place**

Run:
```bash
grep -n "Lesson Flow\|Step 1\|Step 2\|Step 3\|Step 4\|Step 5\|Readiness Check" springboot.md
```
Expected output: lines showing all 5 step headings and "Lesson Flow" present.

- [ ] **Step 3: Commit**

```bash
git add springboot.md
git commit -m "feat: add lesson flow to springboot prompt"
```

---

### Task 3: Add Lesson Flow to `sql.md`

**Files:**
- Modify: `sql.md`

Insert after the last bullet under `## Teaching Rules` and before `## Always Connect Back To`.

- [ ] **Step 1: Insert the Lesson Flow section**

Open `sql.md`. After the last bullet in `## Teaching Rules`, insert:

```markdown

## Lesson Flow

Follow this structure for every concept, without exception:

### Step 1 — Hook
One short paragraph only:
- One sentence: what the concept is
- One sentence: why it matters in interviews

No details yet.

### Step 2 — Block-by-Block Explanation
Break the explanation into 2–4 labeled blocks of related information:
- Label each block (e.g., "Block 1/3")
- Send one block, then stop
- Ask: "Any questions on this before I continue?"
- Wait for the user to reply before sending the next block
- Do not advance until the user signals readiness ("next", "continue", or after answering their follow-up question)

### Step 3 — Quiz
After all blocks are done, ask 1–2 interview-style questions (per Teaching Rules above).

### Step 4 — Wrap-up + Extra Depth
After the quiz:
- 2–3 sentence summary of the concept
- One extra insight: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask: "Ready to move to the next concept?"
Wait for explicit confirmation before updating Supabase and fetching the next item.
```

- [ ] **Step 2: Verify the section is in place**

Run:
```bash
grep -n "Lesson Flow\|Step 1\|Step 2\|Step 3\|Step 4\|Step 5\|Readiness Check" sql.md
```
Expected output: lines showing all 5 step headings and "Lesson Flow" present.

- [ ] **Step 3: Commit**

```bash
git add sql.md
git commit -m "feat: add lesson flow to sql prompt"
```

---

### Task 4: Add Lesson Flow to `frontend.md`

**Files:**
- Modify: `frontend.md`

Insert after the last bullet under `## Teaching Rules` and before `## Always Connect Back To`.

- [ ] **Step 1: Insert the Lesson Flow section**

Open `frontend.md`. After the last bullet in `## Teaching Rules`, insert:

```markdown

## Lesson Flow

Follow this structure for every concept, without exception:

### Step 1 — Hook
One short paragraph only:
- One sentence: what the concept is
- One sentence: why it matters in interviews

No details yet.

### Step 2 — Block-by-Block Explanation
Break the explanation into 2–4 labeled blocks of related information:
- Label each block (e.g., "Block 1/3")
- Send one block, then stop
- Ask: "Any questions on this before I continue?"
- Wait for the user to reply before sending the next block
- Do not advance until the user signals readiness ("next", "continue", or after answering their follow-up question)

### Step 3 — Quiz
After all blocks are done, ask 1–2 interview-style questions (per Teaching Rules above).

### Step 4 — Wrap-up + Extra Depth
After the quiz:
- 2–3 sentence summary of the concept
- One extra insight: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask: "Ready to move to the next concept?"
Wait for explicit confirmation before updating Supabase and fetching the next item.
```

- [ ] **Step 2: Verify the section is in place**

Run:
```bash
grep -n "Lesson Flow\|Step 1\|Step 2\|Step 3\|Step 4\|Step 5\|Readiness Check" frontend.md
```
Expected output: lines showing all 5 step headings and "Lesson Flow" present.

- [ ] **Step 3: Commit**

```bash
git add frontend.md
git commit -m "feat: add lesson flow to frontend prompt"
```

---

### Task 5: Add Lesson Flow to `aws.md`

**Files:**
- Modify: `aws.md`

Insert after the last bullet under `## Teaching Rules` (after `- If I struggle, re-explain from a different angle`) and before `## Always Connect Back To`.

- [ ] **Step 1: Insert the Lesson Flow section**

Open `aws.md`. After the line `- If I struggle, re-explain from a different angle`, insert:

```markdown

## Lesson Flow

Follow this structure for every concept, without exception:

### Step 1 — Hook
One short paragraph only:
- One sentence: what the concept is
- One sentence: why it matters in interviews

No details yet.

### Step 2 — Block-by-Block Explanation
Break the explanation into 2–4 labeled blocks of related information:
- Label each block (e.g., "Block 1/3")
- Send one block, then stop
- Ask: "Any questions on this before I continue?"
- Wait for the user to reply before sending the next block
- Do not advance until the user signals readiness ("next", "continue", or after answering their follow-up question)

### Step 3 — Quiz
After all blocks are done, ask 1–2 interview-style questions (per Teaching Rules above).

### Step 4 — Wrap-up + Extra Depth
After the quiz:
- 2–3 sentence summary of the concept
- One extra insight: a common interview trap, a production gotcha, or a subtle edge case

### Step 5 — Readiness Check
Ask: "Ready to move to the next concept?"
Wait for explicit confirmation before updating Supabase and fetching the next item.
```

- [ ] **Step 2: Verify the section is in place**

Run:
```bash
grep -n "Lesson Flow\|Step 1\|Step 2\|Step 3\|Step 4\|Step 5\|Readiness Check" aws.md
```
Expected output: lines showing all 5 step headings and "Lesson Flow" present.

- [ ] **Step 3: Commit**

```bash
git add aws.md
git commit -m "feat: add lesson flow to aws prompt"
```
