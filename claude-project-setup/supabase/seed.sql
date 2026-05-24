-- ============================================================
-- Supabase Seed Data
-- Project : ebpzaybiotrtgycmmheu.supabase.co
-- Exported : 2026-05-24
-- Tables   : topics + curriculum_items
-- Scope    : SQL (id 3) · AWS (id 4) · React/Frontend (id 5)
-- Notes    : Run AFTER schema.sql on a fresh project.
--            Java and Spring Boot rows are intentionally excluded.
-- ============================================================


-- ============================================================
-- TOPICS
-- ============================================================

INSERT INTO public.topics (id, name, created_at) VALUES
  (3, 'SQL',                    '2026-04-25 10:04:58.132185+00'),
  (4, 'AWS',                    '2026-04-25 10:04:58.132185+00'),
  (5, 'React + JS + HTML + CSS','2026-04-25 10:04:58.132185+00');

-- Keep the sequence in sync so the next INSERT doesn't collide
SELECT setval('public.topics_id_seq', (SELECT MAX(id) FROM public.topics));


-- ============================================================
-- CURRICULUM ITEMS — SQL (topic_id = 3)
-- ============================================================

INSERT INTO public.curriculum_items (id, topic_id, item_order, section, concept, status) VALUES
  (40, 3, 1,  'Foundations',       'Relational Model, Keys, Normalization',              'not_started'),
  (41, 3, 2,  'Joins Deep Dive',   'INNER, LEFT, RIGHT, FULL, CROSS, Self Joins',        'not_started'),
  (42, 3, 3,  'Aggregations',      'GROUP BY, HAVING, Common Traps',                     'not_started'),
  (43, 3, 4,  'Window Functions',  'ROW_NUMBER, RANK, LEAD, LAG, PARTITION BY',          'not_started'),
  (44, 3, 5,  'Indexing Internals','B-tree, Composite, Covering Indexes',                'not_started'),
  (45, 3, 6,  'Query Optimization','Execution Plans, EXPLAIN, Avoiding Full Scans',      'not_started'),
  (46, 3, 7,  'Transactions',      'ACID, Isolation Levels, Deadlocks',                  'not_started'),
  (47, 3, 8,  'Schema Design',     'Normalization vs Denormalization',                   'not_started'),
  (48, 3, 9,  'Advanced Topics',   'CTEs, Recursive Queries, Materialized Views',        'not_started');


-- ============================================================
-- CURRICULUM ITEMS — AWS (topic_id = 4)
-- ============================================================

INSERT INTO public.curriculum_items (id, topic_id, item_order, section, concept, status) VALUES
  (49, 4, 1,  'Core Compute',        'EC2, Lambda, ECS/EKS Trade-offs',                   'not_started'),
  (50, 4, 2,  'Storage',             'S3, EBS, EFS, Glacier Trade-offs',                  'not_started'),
  (51, 4, 3,  'Databases',           'RDS, Aurora, DynamoDB, ElastiCache',                'not_started'),
  (52, 4, 4,  'Networking',          'VPC, Subnets, Security Groups, Route53',            'not_started'),
  (53, 4, 5,  'IAM & Security',      'Roles, Policies, Least Privilege, Secrets',         'not_started'),
  (54, 4, 6,  'Messaging & Events',  'SQS, SNS, EventBridge, Kinesis',                   'not_started'),
  (55, 4, 7,  'Serverless',          'Lambda, API Gateway, Step Functions',               'not_started'),
  (56, 4, 8,  'CI/CD & DevOps',      'CodePipeline, CodeBuild, CloudFormation, CDK',     'not_started'),
  (57, 4, 9,  'Architecture Patterns','Multi-tier, Microservices, Well-Architected',      'not_started'),
  (58, 4, 10, 'Cost & Performance',  'Auto-scaling, Reserved vs Spot, Optimization',     'not_started');


-- ============================================================
-- CURRICULUM ITEMS — React + JS + HTML + CSS (topic_id = 5)
-- ============================================================

INSERT INTO public.curriculum_items (id, topic_id, item_order, section, concept, status) VALUES
  (59, 5, 1,  'JS Internals',    'Call Stack, Event Loop, Microtasks vs Macrotasks',          'not_started'),
  (60, 5, 2,  'JS Core',         'Closures, Scope, Hoisting, Prototype Chain, this',          'not_started'),
  (61, 5, 3,  'Async JS',        'Callbacks, Promises, async/await, Error Handling',          'not_started'),
  (62, 5, 4,  'Modern JS',       'ES6-ES2024: Destructuring, Spread, Modules, Optional Chaining', 'not_started'),
  (63, 5, 5,  'HTML',            'Semantic Tags, Accessibility, ARIA, Forms',                 'not_started'),
  (64, 5, 6,  'CSS Deep Dive',   'Box Model, Flexbox, Grid, Specificity, Responsive',         'not_started'),
  (65, 5, 7,  'React Internals', 'Virtual DOM, Reconciliation, Fiber, Render Cycle',          'not_started'),
  (66, 5, 8,  'React Hooks',     'useState, useEffect, useRef, useMemo, useCallback',         'not_started'),
  (67, 5, 9,  'React Patterns',  'Composition, HOCs, Compound Components, Portals',           'not_started'),
  (68, 5, 10, 'State Management','Context API, Redux, Zustand Trade-offs',                    'not_started'),
  (69, 5, 11, 'Performance',     'Code Splitting, Lazy Loading, Memoization, Web Vitals',     'not_started'),
  (70, 5, 12, 'Testing',         'Jest, React Testing Library, What to Test',                 'not_started');


-- Keep the sequence in sync
SELECT setval('public.curriculum_items_id_seq', (SELECT MAX(id) FROM public.curriculum_items));
