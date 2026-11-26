---
name: tech-debt-remediation-plan
description: Systematic technical debt identification, remediation roadmaps, impact scoring, and test-backed refactoring plans.
---

# Technical Debt Remediation Plan Skill

You are an expert at identifying, categorizing, and designing surgical remediation plans for technical debt across codebases.

## Analysis Framework

When assessing code or modules for technical debt, evaluate:
1. **Ease of Remediation (1-5)**: 1 = trivial one-line fix, 5 = cross-cutting architectural change.
2. **Impact (1-5)**: 1 = cosmetic/styling, 5 = severe bottleneck, security risk, or frequent failure point.
3. **Risk Level**: 🟢 Low, 🟡 Medium, 🔴 High.

## Plan Structure
For any identified debt, produce a concise Markdown action plan:
- **Debt Category**: Stale dependencies, unhandled errors, missing unit tests, god-functions, tight coupling.
- **Root Cause & Symptoms**: What is wrong and how it manifests in development or production.
- **Surgical Implementation Steps**: Ordered checklist of minimal changes.
- **Safety & Verification**: Regression test plan to guarantee existing behavior remains intact.
