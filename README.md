# Latent Learner

> Team repository for the [**MindRL Cognitive Modeling Challenge 2026**](https://rldmjc.github.io/posts/modelingchallenge/)— predicting *and* explaining human sequential decision-making.

## Team

| Member | Primary focus |
| --- | --- |
| Wanyang Yu | Engineering / infrastructure, coordination |
| Chuqiao Song | Neural / RNN modeling, mechanistic interpretation, theory |
| Jinghang Lin | Bayesian / symbolic cognitive modeling, model comparison, Cognitive Science background |

## Modeling philosophy — a ladder of models

We build from interpretable to flexible, and diagnose what each added degree of freedom actually buys:

1. **Cognitive baselines** — classic RL (Rescorla–Wagner / Q-learning with a perseveration term), a Bayesian-inference account, and an RL + working-memory model. Fit hierarchically; establish solid parameter recovery and model comparison.
2. **Tiny / distilled RNNs** — small recurrent models (à la TinyRNN, DisRNN, Dezfouli) that raise predictive accuracy while staying interpretable via dynamical-systems analysis.
3. **Flexible models** — larger RNNs / hybrids, used mainly to upper-bound predictability and reveal what the baselines miss.

Each rung produces a falsifiable claim for the interpretation card; the adversarial phase then stress-tests those claims.

## Workflow conventions

- **Literature:** every paper we read gets a one-page note in `docs/literature/notes/` (claim · method · what we can reuse · open question). Paper-share sessions live here too.
- **Experiments:** each experiment is a folder under `experiments/` with a config. Write the *question/hypothesis first* at the top of its report in `reports/`, the result after, and the discussion below.
- **Code:** new models subclass `CognitiveModel`; nothing bypasses the eval harness.
- **Meetings:** dated notes in `docs/meetings/`, each ending with explicit decisions and owners.

## Timeline

| Date | Phase |
| --- | --- |
| Jun 15 | Enrollment deadline |
| Jun 22 | Acceptance · Discord · warm-up |
| Jun 29 | Phase 1 — task & data release (Generative track) |
| Jul 27 | Phase 2 — Adversarial track |
| Sep 4 | Presentation & awards |
