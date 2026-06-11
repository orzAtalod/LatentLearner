# Application Sheet Backup

## Basic Information

**Primary Contact**: Cecelia Yu, [](ceceliayu0822@gmail.com)
**Team members**:

| name | affliation | email | position | github |
| -- | -- | -- | -- |
| Chuqiao Song | Basque Center on Cognition, Brain and Language | [](songchuqiao23@gmail.com) | Master's Student | ()[https://github.com/ss-sebastian] |
| Cecelia Yu | University of Science and Technology of China | [](ceceliayu0822@gmail.com) | Undergrauate | ()[https://github.com/Cecelia-Yu] |
| Jinghang Lin | Zhejiang University | [](1759978497@qq.com) | Undergraduate | ()[https://github.com/orzAtalod] |

## Experience

**Jinghang Lin** has relevant training in computational cognitive modeling. As part of research training in Professor Junyi Dai’s group, he worked with behavioral data from intertemporal choice tasks, reproduced and modified an existing cognitive model, and learned to conduct model estimation and comparison using methods and criteria such as MLE, AIC, and BIC. He also gained experience with Bayesian analysis in Stan and developed a Rust–CmdStan interface. In addition, he has a solid foundation in statistics and cognitive science, with a minor in statistics and coursework in cognitive psychology and philosophy of cognitive science.

## Motivation

**Jinghang Lin** is pursuing a path in computational cognition, with a particular interest in Bayesian modeling and other symbolic approaches to high-level cognitive processes. Through this competition, he hopes to gain first-hand modeling experience and become more actively involved in the broader computational modeling community. He plans to dedicate most of his summer to this challenge.

## Current Direction

Our current direction is to model the reward-learning task as a sequential decision-making problem. We plan to start with classic reinforcement-learning baselines, such as Q-learning with a softmax choice rule, and then compare these baselines with more interpretable cognitive models, especially Bayesian belief-updating models that explicitly represent uncertainty over reward values or latent task structure.

In parallel, we are also interested in exploring an RNN-based sequence model that learns latent representations from choice–reward histories. One possible version is a predictive recurrent model: the RNN maintains an online belief state that is updated as new events unfold. This belief state is trained not only to predict human actions, but also to predict upcoming observations. The prediction error from this auxiliary observation-prediction process can then guide how strongly the recurrent state is updated. To account for sensory or observation noise, prediction errors may be precision-weighted, so that reliable observations lead to stronger updates while noisier observations have less influence. Feedback or reward may also modulate the update, either directly or through a reward-prediction-error signal.

Our central hypothesis is based on a predictive-coding view of sequential behavior. People do not simply react to the current event; they continuously form expectations about what is likely to happen next, update these expectations when prediction errors are informative and reliable, and use the updated belief state to guide future responses.

Given the private held-out tasks, we are especially interested in whether different models can generalize beyond a single task structure rather than merely fit observed behavior. Model evaluation would therefore focus not only on one-step-ahead action prediction accuracy, but also on failure cases, deviations from human behavior, and whether the model’s internal variables support a plausible cognitive interpretation.
