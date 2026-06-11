# Latent Learner

> Team repository for the [**MindRL Cognitive Modeling Challenge 2026**](https://rldmjc.github.io/posts/modelingchallenge/)— predicting *and* explaining human sequential decision-making.

## Team

| Member | Primary focus |
| --- | --- |
| Wanyang Yu | Engineering / infrastructure, coordination |
| Chuqiao Song | Neural / RNN modeling, mechanistic interpretation, theory |
| Jinghang Lin | Bayesian / symbolic cognitive modeling, model comparison, Cognitive Science background |

## Roadmap

We plan to build a set of exploratory models to evaluate different learning hypotheses and inform the design of the final submission model.

1. **Baseline models**: We will begin with classic reinforcement-learning models, such as Q-learning or Rescorla-Wagner models with softmax choice rules, to establish strong and interpretable baselines.

2. **Bayesian model**: We will develop a symbolic Bayesian belief-updating model that explicitly represents uncertainty over reward values or latent task structure. This model will serve as an interpretable cognitive account and may inspire uncertainty-aware extensions of RL-style models.

3. **RNN model**: We will explore small recurrent models, such as TinyRNN-style architectures, to predict decision sequences from choice–reward histories. This stage will mainly adapt existing RNN modeling approaches to the challenge dataset.

4. **Model evaluation and refinement**: We will analyze failure cases, deviations from human behavior, and generalization to held-out tasks. Based on these analyses, we may explore variants of the RL, Bayesian, or RNN models, rather than increasing model complexity by default.

Additionally, we plan to prepare interpretation cards throughout the modeling process, so that each model is evaluated not only by predictive accuracy but also by the plausibility and robustness of its cognitive interpretation.

## Workflow conventions

- **Literature:** every paper we read and discussed gets a one-page note in `docs/literature/notes/`.
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
