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

Alethic ISM is composed of several interrelated components. Below is an overview of the major modules within the ecosystem.

### ISM UI Studio

- **[alethic-ism-ui](https://github.com/quantumwake/alethic-ism-ui.git) (v2.0.experimental):**  
  Provides a web-based interface for designing, monitoring, and managing state machines. This interface allows you to visualize instruction flows, inspect processor outputs, and configure system-level settings.


  ![ISM Studio UI Screenshot](ism-studio-v2.png)


### Core Libraries

- **[alethic-ism-core](https://github.com/quantumwake/alethic-ism-core.git) (Python):**  
  The foundational library providing core state machine logic and interfaces for instruction execution.


- **[alethic-ism-db](https://github.com/quantumwake/alethic-ism-db.git):**  
  Manages state storage, versioning, and database interactions for the ecosystem.


- **[alethic-ism-core-go](https://github.com/quantumwake/alethic-ism-core-go.git):**  
  A Go-based implementation of the core library, facilitating integration with Go-centric applications.


### API Services

- **[alethic-ism-api](https://github.com/quantumwake/alethic-ism-api.git) (V1 Python):**  
  Exposes core and database functionalities via a RESTful API, leveraging Pydantic for data validation and serialization.


- **[alethic-ism-query-api](https://github.com/quantumwake/alethic-ism-query-api.git) (Go):**  
  Enables rapid retrieval of state data across the ISM network. Designed for low-latency queries and scalable data access.


- **[alethic-ism-streams-api](https://github.com/quantumwake/alethic-ism-streams-api.git) (Go):**  
  Handles boundary proxying and bidirectional streaming of state data. This API also allows consumers to subscribe to the ISM network and supports cluster-wide state routing.


### Instruction Processors

The ISM framework supports various processors to execute instructions using different backends or programming environments:

- **[alethic-ism-processor-openai](https://github.com/quantumwake/alethic-ism-processor-openai.git) (Python):**  
  Executes instructions using OpenAI language models.


- **[alethic-ism-processor-anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git) (Python):**  
  Integrates Anthropic’s language models for state transitions.


- **[alethic-ism-processor-gemini](https://github.com/quantumwake/alethic-ism-processor-gemini.git) (Python):**  
  Utilizes Gemini language models for instruction execution.


- **[alethic-ism-processor-python](https://github.com/quantumwake/alethic-ism-processor-python.git) (Python):**  
  Executes restricted Python code against a state input to generate the resulting output state.


- **[alethic-ism-online-cross-join](https://github.com/quantumwake/alethic-ism-online-cross-join.git) (Python):**  
  Performs a distributed product of two states, enabling efficient cross-joins for large datasets.


- **[alethic-ism-online-merge](https://github.com/quantumwake/alethic-ism-online-merge.git) (Go):**  
  Combines multiple data state events into a single composite output event, given a shared composite key.


- **[alethic-ism-online-join](https://github.com/quantumwake/alethic-ism-online-join.git) (Go):**  
  Performs a windowed online inner join between two or more states, using a log2 timescale, given properly configured join keys and arrival windows.


- **[alethic-ism-processor-llama](https://github.com/quantumwake/alethic-ism-processor-llama.git) (Go):**  
  Similar to other processor modules but tailored for Llama language models.


- **[alethic-ism-ds](https://github.com/quantumwake/alethic-ism-ds.git) (Go):**  
  *(Pending public release)* Processes data source state instructions by connecting to external data sources (e.g., SQL databases).


- **[alethic-ism-memory](https://github.com/quantumwake/alethic-ism-memory.git) (Go):**  
  *(Pending public release)* Provides a memory processor for LLMs, storing and retrieving state data during transitions to support context-aware processing.

### State Routing & Persistence

- **[alethic-ism-state-router](https://github.com/quantumwake/alethic-ism-state-router.git) (V1 Python):**  
  Dynamically discovers states and routes them to the appropriate processing nodes within the execution graph.


- **[alethic-ism-router](https://github.com/quantumwake/alethic-ism-router.git) (V2 Go):**  
  *(Pending public release)* An upgraded version of the state router that also handles routing across ISM clusters.


- **[alethic-ism-state-sync](https://github.com/quantumwake/alethic-ism-state-sync-store.git) (V1 Python):**  
  Synchronizes state persistence (if enabled) and forwards states based on configured routing rules.


- **[alethic-ism-storage-db](https://github.com/quantumwake/alethic-ism-storage-db.git) (V2 Go):**  
  *(Pending public release)* An upgraded version of the state sync store specialized for database storage. While additional storage classes (like S3) exist, they are not fully tested here.


- **[alethic-ism-storage-s3](https://github.com/quantumwake/alethic-ism-storage-s3.git) (V2 Go):**  
  *(Pending public elease)* An upgraded version of the state sync store for S3-based storage, with other storage classes also in development.


### Monitoring & Usage

- **[alethic-ism-usage](https://github.com/quantumwake/alethic-ism-usage.git) (V1 Go):**  
  Persists usage data for any state processor and provides a REST API for querying usage metrics.


- **[alethic-ism-monitor](https://github.com/quantumwake/alethic-ism-monitor.git) (V1 Python - deprecated but still in use):**  
  Offers logging and state transition reporting. A v2 release is planned, which will bring improvements and additional features.


### Additional & Emerging Components

The Alethic ISM ecosystem continues to expand. Experimental modules extend the system’s capabilities in various ways:

- **Alethic ISM Autoscaler:**  
  Dynamically provisions cloud compute resources based on processing demands in multi-tenant environments.


- **Alethic ISM Interactive Action Hooks + UI:**  
  Enables real-time user feedback loops and reinforcement learning capabilities during state executions.


- **Alethic ISM Training Studio:**  
  Provides tools for training or fine-tuning models based on state data, including automated fine-tuning as defined by instruction graphs.


- **Alethic ISM MCP Server:**  
  Integrates Alethic ISM with the Model Context Protocol (MCP) as defined by Anthropic, further broadening supported workflow scenarios.

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
