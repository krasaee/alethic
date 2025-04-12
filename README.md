# Alethic Instruction-Based State Machine (Alethic ISM) [EXPERIMENTAL]

**Note:** Although every component in this project is `mostly` operational, the entire system is EXPERIMENTAL and lacks public documentation. Use with caution in production environments.

**Alethic ISM** (Instruction-Based State Machine) is a versatile, modular framework for processing instructions as immutable state transitions. Originally inspired by research into animal-friendly language models, the system has evolved into a robust platform for executing a wide range of tasks—from natural language processing to complex graph-based state orchestration in distributed environments.

---

## Overview

Alethic ISM uses a state machine approach to:
- **Encapsulate Data and Instructions:** Each _state_ represents a snapshot of data and processing at a given point.
- **Execute Immutable Transitions:** Every instruction applied to a state generates a new, immutable state, ensuring auditability and traceability.
- **Support Distributed Processing:** Built on a consumer/producer model, the system scales through a network of specialized processors and APIs.
- **Foster Extensibility:** Easily integrate custom processors and components for various applications (e.g., language models, Python code execution, data stream aggregation).

---

## Core Concepts

- **State:** Represents the data at a specific processing stage.
- **Instruction:** Commands that transform states.
- **Processor:** Modules that execute instructions to produce new state transitions.
- **Immutable State History:** Each execution produces a new state version, preserving the evolution of data over time.
- **Extensible & Scalable Architecture:** Designed to integrate with various processors and support distributed, real-time data flows.

---

## Architecture & Components

Alethic ISM is composed of several interrelated components. Below is an overview of the major modules:

### ISM UI STUDIO
- **[alethic-ism-ui](https://github.com/quantumwake/alethic-ism-ui.git) (v2.0.experimental):**

![ISM Studio UI Screenshot](ism-studio-v2.png)

### Core Libraries
- **[alethic-ism-core](https://github.com/quantumwake/alethic-ism-core.git) (Python):**  
  Provides the core state machine logic and interfaces for instruction execution.

- **[alethic-ism-db](https://github.com/quantumwake/alethic-ism-db.git):**  
  Manages state storage, versioning, and database interactions.

- **[alethic-ism-core-go](https://github.com/quantumwake/alethic-ism-core-go.git):**
  A Go implementation of the core library to facilitate integration in Go-based environments.

### API Services
- **[alethic-ism-api](https://github.com/quantumwake/alethic-ism-api.git): (V1 Python):**  
  Exposes core and database functionalities via a RESTful API using Pedantic models.

- **[alethic-ism-query-api](https://github.com/quantumwake/alethic-ism-query-api.git) (Go):**  
  Enables rapid retrieval of state data across the ISM network.

- **[alethic-ism-streams-api](https://github.com/quantumwake/alethic-ism-streams-api.git) (Go):**
  Handles boundary proxying and bidirectional streaming of state data. This API also allows consumers to subscribe to the ISM network and supports cluster-wide state routing.

### Instruction Processors
The framework supports a variety of processors to execute instructions using different backends or programming environments:
- **[alethic-ism-processor-openai](https://github.com/quantumwake/alethic-ism-processor-openai.git) (Python):**  
  Processes instructions using OpenAI models.

- **[alethic-ism-processor-anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git) (Python):**  
  Executes state transitions with Anthropic’s language models.

- **[alethic-ism-processor-gemini](https://github.com/quantumwake/alethic-ism-processor-gemini.git) (Python):**
  Executes state transitions with Gemini language models.

- **[alethic-ism-processor-python](https://github.com/quantumwake/alethic-ism-processor-python.git) (Python):**
  Executes restricted Python code against a state input to generate an output state.

- **[alethic-ism-online-cross-join](https://github.com/quantumwake/alethic-ism-online-cross-join.git) (Python):**
  Performed a product of two states in a distributed manner, allowing for efficient cross-joins of large datasets.

- **[alethic-ism-online-merge](https://github.com/quantumwake/alethic-ism-online-merge.git) (Go):**
  Combines multiple data state events to produce a composite stat output event, given a shared composite key as part of the inputs.

- **[alethic-ism-online-join](https://github.com/quantumwake/alethic-ism-online-join.git) (Go):**
  Performs a windowing online inner join between two or more states, as data arrives, on a log2 timescale, provided join keys are specified and data arrives within a reasonable but configurable window.
- 
- **[alethic-ism-processor-llama](https://github.com/quantumwake/alethic-ism-processor-llama.git) (Go):**
  Similar to other processor modules but tailored for Llama models.

- **[alethic-ism-ds](https://github.com/quantumwake/alethic-ism-ds.git) (Go):**
  Processes data source state instructions, given an external datasource such as a SQL database.

- **[alethic-ism-memory](https://github.com/quantumwake/alethic-ism-memory.git) (Go):**
  Provides a memory processor for LLMs, allowing for the storage and retrieval of state data during state processing and transitions.

### State Routing and Persistence
- **[alethic-ism-state-router](https://github.com/quantumwake/alethic-ism-state-router.git) (V1 Python):**
  Dynamically discovers states and routes them to the appropriate processing nodes within the execution graph.

- **[alethic-ism-router](https://github.com/quantumwake/alethic-ism-router.git) (V2 Go):
  pending release: upgraded version of the state router, also handles cross ISM cluster routing.

- **[alethic-ism-state-store](https://github.com/quantumwake/alethic-ism-state-store.git) (V1 Python):
  Synchronizes state persistence (if enabled) and automatically forwards states based on configured routing rules.

- **[alethic-ism-storage-db](https://github.com/quantumwake/alethic-ism-storage-db.git) (V2 Go):
  pending release: upgraded version of the state sync store, specifically for database storage class (s3 and other storage classes are available but not fully tested)

- **[alethic-ism-storage-s3](https://github.com/quantumwake/alethic-ism-storage-s3.git) (V2 Go):**
  pending release: upgraded version of the state sync store, specifically for s3 storage class (other storage classes are available but not fully tested)  

### Monitoring & Usage
- **[alethic-ism-usage](https://github.com/quantumwake/alethic-ism-usage.git) (V1 Go)**
  Persists usage data for any state processor and provides a REST API for querying usage data.

- **[alethic-ism-monitor](https://github.com/quantumwake/alethic-ism-monitor.git) (V1 Python - deprecated but still in use):**
  Provides logging, and state transition reporting (v2 will be out sooner than later.

### Additional & Emerging Components
The Alethic ISM ecosystem continues to expand. Additional modules and experimental projects further extend the system's capabilities, including:
- **Alethic ISM Autoscaler:** For on-demand cloud compute allocation and scaling based on state processing needs in a multi-tenant environment.
- **Alethic ISM Interactive Action Hooks + UI:** For real-time user interactions and feedback loops for reinforcement learning capabilities during state executions.
- **Alethic ISM Training Studio:** For training and fine-tuning models based on state data (e.g., automated fine-tuning models as defined by the instruction graph).
- **Alethic ISM MCP Server:** Integration of alethic-ism with model context protocol (MCP) as defined by by Anthropic.
---

## Example Use Case: Animal-Friendly LLMs

One notable application of Alethic ISM was its use in evaluating animal-related queries, as explored in the study [The Case for Animal-Friendly LLMs](docs/Ghose%2C%20Tse%2C%20Rasaee%2C%20Sebo%2C%20Singer.pdf). Although the system was initially developed for this purpose, its flexible design now supports a broad range of applications—from language model instruction processing to complex graph-based workflows.

![Conceptual Machinery AnimaLLM](docs/ConceptualMachineryAnimaLLM_20231223r2.png)

---

## Getting Started
Detailed documentation and examples for these projects are forthcoming.

The quickest way to get started is to use the provided Helm charts, this will setup the basic infrastructure for the ISM system, including the core components and a few example processors.

- **[alethic-ism-helm](https://github.com/quantumwake/alethic-ism-helm.git)

---

## Contribution

We welcome contributions, feedback, and questions from the community. Whether you’re improving documentation, reporting issues, or developing new modules, your input is invaluable. Please feel free to open an issue or submit a pull request on any of our repositories.

---

### License
Alethic ISM is under a DUAL licensing model, please refer to [LICENSE.md](LICENSE.md).

---

## Acknowledgements

Special thanks to:
- **Alethic Research**
- **Princeton University Center for Human Values**
- **New York University**

---

For updates, additional documentation, and involvement opportunities, please visit our [GitHub organization page](https://github.com/quantumwake/alethic) or join our community forums.

Happy coding!
