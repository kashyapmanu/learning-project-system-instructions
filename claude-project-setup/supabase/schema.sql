-- ============================================================
-- Supabase Schema Export
-- Project : ebpzaybiotrtgycmmheu.supabase.co
-- Exported : 2026-05-24
-- Notes    : Schema only — no row data included.
--            Run this on a fresh Supabase project to recreate
--            the full public-schema structure.
-- ============================================================

-- ============================================================
-- SEQUENCES
-- ============================================================

CREATE SEQUENCE IF NOT EXISTS public._keepalive_id_seq
  AS integer
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  NO CYCLE;

CREATE SEQUENCE IF NOT EXISTS public.topics_id_seq
  AS integer
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  NO CYCLE;

CREATE SEQUENCE IF NOT EXISTS public.curriculum_items_id_seq
  AS integer
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  NO CYCLE;

CREATE SEQUENCE IF NOT EXISTS public.quiz_attempts_id_seq
  AS integer
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  NO CYCLE;


-- ============================================================
-- TABLES  (in dependency order: parents before children)
-- ============================================================

-- Internal keepalive table (prevents Supabase free-tier pauses)
CREATE TABLE IF NOT EXISTS public._keepalive (
  id        integer                   NOT NULL DEFAULT nextval('_keepalive_id_seq'::regclass),
  pinged_at timestamp with time zone           DEFAULT now()
);

-- Learning topics (e.g. Java, SQL, Spring Boot …)
CREATE TABLE IF NOT EXISTS public.topics (
  id         integer                   NOT NULL DEFAULT nextval('topics_id_seq'::regclass),
  name       text                      NOT NULL,
  created_at timestamp with time zone           DEFAULT now()
);

-- Ordered curriculum items within a topic
CREATE TABLE IF NOT EXISTS public.curriculum_items (
  id           integer                   NOT NULL DEFAULT nextval('curriculum_items_id_seq'::regclass),
  topic_id     integer                   NOT NULL,              -- FK -> topics.id
  item_order   integer                   NOT NULL,
  section      text                      NOT NULL,
  concept      text                      NOT NULL,
  status       text                      NOT NULL DEFAULT 'not_started'::text,  -- CHECK below
  last_updated timestamp with time zone           DEFAULT now()
);

-- Individual quiz attempt records
CREATE TABLE IF NOT EXISTS public.quiz_attempts (
  id                 integer                   NOT NULL DEFAULT nextval('quiz_attempts_id_seq'::regclass),
  curriculum_item_id integer                   NOT NULL,        -- FK -> curriculum_items.id
  question           text                      NOT NULL,
  result             smallint                  NOT NULL,        -- 0–3, CHECK below
  notes              text,
  attempted_at       timestamp with time zone            DEFAULT now()
);


-- ============================================================
-- PRIMARY KEYS
-- ============================================================

ALTER TABLE public._keepalive
  ADD CONSTRAINT _keepalive_pkey PRIMARY KEY (id);

ALTER TABLE public.topics
  ADD CONSTRAINT topics_pkey PRIMARY KEY (id);

ALTER TABLE public.curriculum_items
  ADD CONSTRAINT curriculum_items_pkey PRIMARY KEY (id);

ALTER TABLE public.quiz_attempts
  ADD CONSTRAINT quiz_attempts_pkey PRIMARY KEY (id);


-- ============================================================
-- UNIQUE CONSTRAINTS
-- ============================================================

ALTER TABLE public.topics
  ADD CONSTRAINT topics_name_key UNIQUE (name);


-- ============================================================
-- CHECK CONSTRAINTS
-- ============================================================

ALTER TABLE public.curriculum_items
  ADD CONSTRAINT curriculum_items_status_check
    CHECK (status = ANY (ARRAY['not_started'::text, 'in_progress'::text, 'mastered'::text, 'weak'::text]));

ALTER TABLE public.quiz_attempts
  ADD CONSTRAINT quiz_attempts_result_check
    CHECK (result >= 0 AND result <= 3);


-- ============================================================
-- FOREIGN KEYS  (ON DELETE CASCADE)
-- ============================================================

ALTER TABLE public.curriculum_items
  ADD CONSTRAINT curriculum_items_topic_id_fkey
    FOREIGN KEY (topic_id) REFERENCES public.topics (id)
    ON DELETE CASCADE;

ALTER TABLE public.quiz_attempts
  ADD CONSTRAINT quiz_attempts_curriculum_item_id_fkey
    FOREIGN KEY (curriculum_item_id) REFERENCES public.curriculum_items (id)
    ON DELETE CASCADE;


-- ============================================================
-- ROW-LEVEL SECURITY
-- ============================================================
-- RLS is ENABLED on all tables.
-- No policies were defined at export time — add them as needed
-- for your auth strategy (e.g. auth.uid() checks).

ALTER TABLE public._keepalive       ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.topics           ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.curriculum_items ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_attempts    ENABLE ROW LEVEL SECURITY;


-- ============================================================
-- MIGRATION HISTORY  (informational — do not re-run)
-- Applied via supabase_migrations.schema_migrations:
--
--   20260425100458  create_interview_prep_schema
--   20260514122005  create_keepalive_table
--   20260517155220  create_interview_questions_table
--
-- NOTE: Migration #4 (create_interview_questions_table) is
-- recorded in migration history but the corresponding table
-- does not exist in the public schema at export time.
-- It may have been dropped or never fully applied.
-- ============================================================
