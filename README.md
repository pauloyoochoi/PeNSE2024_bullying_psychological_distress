# PeNSE 2024 — Bullying & Psychological Distress

## Overview
This project investigates the relationship between **bullying victimization** and **psychological distress** among Brazilian adolescents using data from PeNSE 2024 (Pesquisa Nacional de Saúde do Escolar), and examines four moderating factors of this relationship.

## Conceptual Model
**X (Predictor):** Bullying victimization (verbal, relational, physical)  
**Y (Outcome):** Psychological distress (worry, sadness, uncared, irritability, worthlessness)  
**Moderators:** School support · Parental understanding · Peer kindness · N friends

## Repository Structure
| File | Description |
|------|-------------|
| `00 · Data Preparation & Exploratory Analysis.ipynb` | Data cleaning, recoding and exploratory analysis (Databricks/PySpark) |
| `01 · Moderation Analysis (script).R` | Moderation analysis script |
| `02 · Moderation Analysis (report).Rmd` | RMarkdown report with full results |

## Methods
- **Software:** Python (Databricks/PySpark) + R (lavaan, semTools)
- **Estimator:** WLSMV (ordinal data)
- **Moderation approach:** Multigroup SEM with measurement invariance testing

## Data Source
PeNSE 2024 — Pesquisa Nacional de Saúde do Escolar Instituto Brasileiro de Geografia e Estatística (IBGE) https://www.ibge.gov.br/estatisticas/sociais/populacao/9134-pesquisa-nacional-de-saude-do-escolar.html

## Base SEM Model
The base model confirmed a significant positive relationship between bullying and psychological distress (β = 0.525, p < .001), with good global fit (CFI = 0.952; RMSEA = 0.080; SRMR = 0.041). Bullying explained 27.6% of the variance in psychological distress.

## Moderation Results

### 1. School Psychological Support
- **Invariance:** Metric | Scalar (borderline)
- **Moderation:** Δχ²(1) = 22.867, p < .001
- **Coefficients:**
  - With support: β = 0.520
  - Without support: β = 0.551
**Interpretation:** Although statistically significant, the difference between groups is negligible (Δβ = 0.031). School psychological support showed no clinically relevant protective effect, possibly reflecting limitations in the reach or quality of support services available in schools.

---

### 2. Parental Understanding
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(2) = 3,077.9, p < .001
- **Coefficients:**
  - Never understands: β = 0.804
  - Rarely/Sometimes: β = 0.443
  - Most times/Always: β = 0.521
- **Interpretation:** Adolescents whose parents never understand their concerns show the strongest bullying–distress effect (β = 0.804), suggesting that the absence of parental support significantly amplifies the impact of bullying. Even partial parental support already demonstrates a relevant protective effect (β = 0.443).

---

### 3. Peer Kindness
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(2) = 2,551.9, p < .001
- **Coefficients:**
  - Never: β = 0.870
  - Rarely/Sometimes: β = 0.506
  - Most times/Always: β = 0.478
- **Interpretation:** Three of four moderators demonstrated meaningful protective effects against the bullying–psychological distress relationship. Peer kindness showed the largest differential (Δβ = 0.392), followed by parental understanding (Δβ = 0.361) and number of close friends (Δβ = 0.302).

---

### 4. Number of Close Friends
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(1) = 689.5, p < .001
- **Coefficients:**
  - No friends: β = 0.822
  - Has friends (1+): β = 0.520
- **Interpretation:** Having at least one close friend substantially reduces the impact of bullying on psychological distress (Δβ = 0.302). Adolescents without close friends are considerably more vulnerable to the harmful effects of bullying, reinforcing the role of social support as a protective factor for mental health.

---

## Results Summary
| Moderator | Δχ² | df | p | β protected | β unprotected | Δβ | Protection |
|-----------|-----|----|----|------------|---------------|-----|------------|
| School support | 22.9 | 1 | <.001 | 0.520 | 0.551 | 0.031 | Minimal |
| Parental understanding | 3,077.9 | 2 | <.001 | 0.443 | 0.804 | 0.361 | Strong |
| Peer kindness | 2,551.9 | 2 | <.001 | 0.478 | 0.870 | 0.392 | Strong |
| N close friends | 689.5 | 1 | <.001 | 0.520 | 0.822 | 0.302 | Strong |

## Conclusion
Three of four moderators demonstrated meaningful protective effects against the bullying–psychological distress relationship. Peer kindness showed the largest differential (Δβ = 0.392), followed by parental understanding (Δβ = 0.361) and number of close friends (Δβ = 0.302). School psychological support, while statistically significant, showed negligible practical effect (Δβ = 0.031), possibly reflecting limitations in the reach or quality of support services available in Brazilian schools.
