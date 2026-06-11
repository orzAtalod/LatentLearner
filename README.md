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

## Model interface

Every model — baseline or neural — implements one common API, so the evaluation harness and the auditing tools can treat them interchangeably (this mirrors the interface the challenge requires):

```python
from abc import ABC, abstractmethod
import numpy as np

class CognitiveModel(ABC):
    @abstractmethod
    def reset(self, n_actions: int, **ctx) -> None:
        """Start a fresh block/episode; clear internal state (Q-values, beliefs, hidden state)."""

    @abstractmethod
    def update(self, action: int, reward: float) -> None:
        """Observe the chosen action and its reward; update internal state."""

    @abstractmethod
    def predict(self) -> np.ndarray:
        """Return P(next action): shape (n_actions,), summing to 1."""

    def state(self) -> dict:
        """(Optional) expose internal variables for interpretation cards."""
        return {}
```

Evaluation is one-step-ahead: `NLL = -sum_t log P_t[a_t]` over held-out trials.

## Repository structure

```text
latent-learner/
├── README.md
├── docs/
│   ├── literature/          
│   │   ├── reading-list.md
│   │   └── notes/           # one .md per paper: claim, method, can-reuse, open question
│   ├── proposal/            
│   └── meetings/            # discussion logs & decisions (dated)
├── src/
│   └── latent_learner/
│       ├── models/          
│       ├── data/            # task & dataset loaders
│       └── eval/            # one-step-ahead NLL harness, parameter & model recovery
├── experiments/             # one folder per experiment: config + run script
├── results/                
├── reports/                 # experiment reports, open questions, error logs
├── notebooks/               # EDA & exploration
├── environment.yml
└── LICENSE
```

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

## Getting started

```bash
conda env create -f environment.yml
conda activate latent-learner
# run a baseline against the eval harness
python -m latent_learner.eval.run --model random_baseline
```

## License

TBD.
