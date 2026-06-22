# PeNSE 2024 — Bullying & Psychological Distress

## Overview
Este estudo investiga a associação entre experiências de bullying e sofrimento psicológico em adolescentes brasileiros, utilizando dados da PeNSE 2024 (Pesquisa Nacional de Saúde do Escolar). Além disso, avalia o papel moderador de fatores de apoio social nos contextos familiar, escolar e interpessoal, investigando em que medida esses recursos podem atenuar os impactos do bullying sobre a saúde mental dos adolescentes.

## Conceptual Model
- **X (Predictor):** Experiências de bullying (verbal, relacional e físico)
- **Y (Outcome):** Sofrimento psicológico (preocupação frequente, tristeza, sensação de desamparo, irritabilidade e sentimento de inutilidade)
- **Moderators:** Apoio escolar · Compreensão parental · Gentileza dos pares · Número de amigos próximos

## Repository Structure
| File | Description |
|------|-------------|
| `00 · Data Preparation & Exploratory Analysis.ipynb` | Limpeza de dados, recodificação e análise exploratória (Databricks/PySpark) |
| `01 · Moderation Analysis (script).R` | Script de análise de moderação |
| `02 · Moderation Analysis (report).Rmd` | Relatório em RMarkdown com resultados completos |
[📊 report.html](https://pauloyoochoi.github.io/PeNSE2024_bullying_psychological_distress/report.html) | Relatório HTML interativo (renderizado) |

## Methods
- **Software:** Python (Databricks/PySpark) + R (lavaan, semTools)
- **Estimator:** WLSMV (ordinal data)
- **Moderation approach:** MEE Multigrupo com teste de invariância de medida

## Data Source
PeNSE 2024 — Pesquisa Nacional de Saúde do Escolar Instituto Brasileiro de Geografia e Estatística (IBGE) https://www.ibge.gov.br/estatisticas/sociais/populacao/9134-pesquisa-nacional-de-saude-do-escolar.html

## Base SEM Model
O modelo base confirmou uma relação positiva significativa entre bullying e sofrimento psicológico (β = 0,525, p < ,001), com bom ajuste global (CFI = 0,952; RMSEA = 0,080; SRMR = 0,041). O bullying explicou 27,6% da variância no sofrimento psicológico.

## Moderation Results

### 1. School Psychological Support
- **Invariance:** Metric | Scalar (borderline)
- **Moderation:** Δχ²(1) = 22.867, p < .001
- **Coefficients:**
  - With support: β = 0.520
  - Without support: β = 0.551
- **Interpretation:** Embora estatisticamente significativa, a diferença entre os grupos é mínima (Δβ = 0,031), sugerindo que o apoio psicológico escolar não atenua de forma expressiva a relação entre vitimização por bullying e sofrimento psicológico. A equivalência dos coeficientes indica que adolescentes com e sem acesso a esse suporte apresentam níveis similares de sofrimento associado ao bullying.

---

### 2. Parental Understanding
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(2) = 3,077.9, p < .001
- **Coefficients:**
  - Never understands: β = 0.804
  - Rarely/Sometimes: β = 0.443
  - Most times/Always: β = 0.521
- **Interpretation:** Adolescentes cujos pais nunca compreendem suas preocupações apresentam o efeito mais forte entre bullying e sofrimento psicológico (β = 0,804), sugerindo que a ausência de compreensão parental amplifica significativamente o impacto do bullying. Mesmo uma compreensão parental parcial já demonstra um efeito protetor relevante (β = 0,443).

---

### 3. Peer Kindness
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(2) = 2,551.9, p < .001
- **Coefficients:**
  - Never: β = 0.870
  - Rarely/Sometimes: β = 0.506
  - Most times/Always: β = 0.478
- **Interpretation:** A gentileza dos pares foi o moderador com maior diferença entre grupos (Δβ = 0,392). Adolescentes que nunca percebem gentileza dos colegas apresentaram o coeficiente mais elevado (β = 0,870), enquanto aqueles que a percebem com maior frequência apresentaram coeficientes consideravelmente menores (β = 0,506 e β = 0,478), indicando que relações interpessoais positivas no contexto de pares atenuam de forma expressiva o impacto do bullying sobre o sofrimento psicológico.

---

### 4. Number of Close Friends
- **Invariance:** Metric | Scalar (borderline) | Variances not established
- **Moderation:** Δχ²(1) = 689.5, p < .001
- **Coefficients:**
  - No friends: β = 0.822
  - Has friends (1+): β = 0.520
- **Interpretation:** Ter ao menos um amigo próximo reduz substancialmente o impacto do bullying sobre o sofrimento psicológico (Δβ = 0,302). Adolescentes sem amigos próximos são consideravelmente mais vulneráveis aos efeitos nocivos do bullying.

---

## Results Summary
| Moderator | Δχ² | df | p | β protected | β unprotected | Δβ | Protection |
|-----------|-----|----|----|------------|---------------|-----|------------|
| School support | 22.9 | 1 | <.001 | 0.520 | 0.551 | 0.031 | Minimal |
| Parental understanding | 3,077.9 | 2 | <.001 | 0.443 | 0.804 | 0.361 | Strong |
| Peer kindness | 2,551.9 | 2 | <.001 | 0.478 | 0.870 | 0.392 | Strong |
| N close friends | 689.5 | 1 | <.001 | 0.520 | 0.822 | 0.302 | Strong |

## Conclusion
Três dos quatro moderadores demonstraram efeitos protetores relevantes sobre a relação entre bullying e sofrimento psicológico. A gentileza dos pares apresentou a maior diferença entre grupos (Δβ = 0,392), seguida pela compreensão parental (Δβ = 0,361) e pelo número de amigos próximos (Δβ = 0,302). O apoio psicológico escolar, embora estatisticamente significativo, apresentou efeito prático negligenciável (Δβ = 0,031), possivelmente refletindo limitações no alcance ou na qualidade dos serviços de apoio disponíveis nas escolas brasileiras.
