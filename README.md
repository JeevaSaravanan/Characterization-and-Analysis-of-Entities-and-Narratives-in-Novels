# Characterization-and-Analysis-of-Entities-and-Narratives-in-Novels
This project develops a natural language processing (NLP) pipeline to analyze novels, focusing on named entities, their roles, and dominant narratives.

## Narrative Explanation Generation
Narrative explanation generation extracts meaning-
ful narratives from datasets and provides contextual
explanations, critical for tasks like literary analysis
and thematic exploration. It combines semantic
understanding with structured relationships.
This work introduces a hybrid retrieval system
using semantic embeddings and knowledge graphs
to enhance narrative retrieval. The objectives are:
1. Develop a vector-based semantic search sys-
tem.
2. Build a knowledge graph to encode narrative
relationships.
3. Combine both methods into a hybrid re-
trieval system with reranking.
This approach addresses challenges such as cap-
turing thematic connections, structuring relational
data, and aligning semantic and structural methods.


### Knowledge Graph Construction

![img](narrative_explaination\assets\flowchart-kgconstruct.drawio.png)

The knowledge graph encodes relationships between narratives, explanations, authors, and books for structured and context-rich retrieval.

    
### Vector-Based Retrieval

![img](narrative_explaination\assets\flowchart-vectoringestion.png)

Vector-based retrieval and reranking were used to enhance semantic search capabilities. Narratives were encoded into high-dimensional vectors using the pre-trained all-MiniLM-L6-v2 model from SentenceTransformers, which maps texts into a semantic space. These embeddings were indexed using FAISS with an IndexFlatL2 configuration optimized for L2 distance similarity. Queries were encoded into
embeddings and matched with the top-k closest narratives from the FAISS index.

### Reranking
Reranking refined the results retrieved via FAISS. A cross-encoder model (cross-encoder/ms-marco-MiniLM-L-6-v2) evaluated query-narrative pairs, capturing fine-grained relationships and generating relevance scores. Unlike FAISS, which
relies solely on vector proximity, the cross-encoder ensures precise ranking by directly modeling
query-narrative interactions. This two-stage system combines the efficiency of FAISS with the precision of the cross-encoder, delivering contextually relevant results across diverse queries and large datasets.

### Hybrid Retrieval with Graph and Vector Store

![img](narrative_explaination\assets\flowchart-hybridrag.png)


The hybrid retrieval system combines the strengths of graph-based and vector-based methods for enhanced performance. Graphs, using Neo4j, excel at structured queries involving entity relationships,such as retrieving narratives by a specific author or explanations linked to keywords. However, they lack the ability to capture semantic similarity, which is addressed by vector-based methods like FAISS, enabling thematic and nuanced similarity searches in high-dimensional spaces.


## Result

Evaluating language models for explanation generation requires assessing readability, contextual relevance, and diversity. Key metrics include: 
- **Readability**: The **Flesch Reading Ease** measures sentence simplicity, while the **Gunning Fog Index** evaluates complexity, balancing accessibility and informativeness.
- **Linguistic Diversity**: **Entropy** captures textual variety, promoting engaging and coherent explanations.
- **Contextual Relevance**: **Semantic Similarity** ensures alignment with source contexts, avoiding hallucinations. **Topic Coherence**, using LDA, evaluates consistency with dominant topics in the input.

These metrics provide an objective framework for evaluating explanations across readability, complexity, diversity, and alignment, ensuring accessibility and coherence across domains.

![img](narrative_explaination\assets\Performance.png)

The evaluation highlights strengths and weaknesses
across metrics:
- **GPT-4**: Achieves highest Semantic Similarity (0.70) and lowest Topic Coherence Difference (0.41) but produces complex outputs (Flesch:14.33, Fog: 22.75).
- **LLaMA 3.1 8B Instruct**: Balances readability (Flesch: 35.43, Fog: 17.01) with moderate Semantic Similarity (0.678).
- **Mistral 8×7B**: Offers moderate coherence (0.39) and readability (Flesch: 28.94, Fog:18.13) but lower Semantic Similarity (0.670).
- **Titan-text-express v1**: Simplest (Entropy:5.69) but lags in Semantic Similarity (0.43) and Topic Coherence Difference (1.02). 

| Model                   | Mean Semantic Similarity | Mean Topic Coherence Difference | Flesch Reading Ease | Gunning Fog Index | Entropy |
|-------------------------|--------------------------|----------------------------------|---------------------|-------------------|---------|
| GPT-4                  | **0.70**                     | 0.**41**                             | 14.33               | 22.75            | 5.91    |
| LlaMA 3.1 8B instruct  | 0.678                    | 0.40                             | **35.43**               | 17.01            | 5.97    |
| Mistral 8 7B× instruct | 0.670                    | 0.39                             | 28.94               | 18.13            | **6.15**    |
| Titan-text-express v1  | 0.43                     | 1.02                             | 34.23               | **16.51**            | 5.69    |


While readability and complexity metrics assess surface-level quality, embedding-based similarity and topic coherence depend on the robustness of underlying models, highlighting the importance of combining quantitative and qualitative evaluations.

The comprehensive evaluation framework balances readability, diversity, and contextual alignment. Despite limitations in individual metrics, it supports objective insights and fosters trust across diverse applications.


