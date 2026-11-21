---
name: python-backend
description: Implements and reviews Python web backends, FastAPI endpoints, persistence, asynchronous operations and error handling.
---

# Python backend workflow
1. Read the actual routes, schemas, configuration, persistence layer and test strategy.
2. Do not run migrations or destructive scripts without a backup and authorization.
3. Validate input, authentication and path access. Use resolved paths with directory containment checks.
4. Respect API contracts, threading and async boundaries, streaming semantics and timeout handling.
5. Create targeted offline tests and document external-service test limitations.
