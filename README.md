# Alethic Instruction-Based State Machine (Alethic ISM) [EXPERIMENTAL]

**Note:** Although every component in this project is `mostly` operational, the entire system is EXPERIMENTAL. Use with caution in production environments.

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

### ISM STUDIO
- **[alethic-ism-ui](https://github.com/quantumwake/alethic-ism-ui.git) (React + Tailwind):**
- **Alethic ISM UI (v2.0 Alpha):** An experimental upgrade, ISM Studio now features a retro interface that provides a visual and interactive view of the state machine, in real time.

![ISM Studio UI Screenshot](ism-studio-v2.png)

### Core Libraries
- **[alethic-ism-core](https://github.com/quantumwake/alethic-ism-core.git) (Python):**  
  Provides the core state machine logic and interfaces for instruction execution.

- **[alethic-ism-db](https://github.com/quantumwake/alethic-ism-db.git) (Python):**  
  Manages state storage, versioning, and database interactions.

- **alethic-ism-core-go (Go):**  
  A Go implementation of the core library to facilitate integration in Go-based environments.

### API Services
- **[alethic-ism-api](https://github.com/quantumwake/alethic-ism-api.git) (Python/FastAPI):**  
  Exposes core and database functionalities via a RESTful API using Pedantic models.

- **alethic-ism-query-api (Go):**  
  Enables rapid retrieval of state data across the ISM network.

- **alethic-ism-streams-api (Go):**  
  Handles boundary proxying and bidirectional streaming of state data. This API also allows consumers to subscribe to the ISM network and supports cluster-wide state routing.

### Instruction Processors
The framework supports a variety of processors to execute instructions using different backends or programming environments:
- **[alethic-ism-processor-openai](https://github.com/quantumwake/alethic-ism-processor-openai.git) (Python):**  
  Processes instructions using OpenAI models.

- **[alethic-ism-processor-anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git) (Python):**  
  Executes state transitions with Anthropic’s language models.

- **alethic-ism-processor-google (Python):**  
  (Work in progress) Integrates with Google Gemini for executing instructions.

- **alethic-ism-processor-python (Python):**  
  Executes restricted Python code against a state input to generate an output state.

- **alethic-ism-processor-coalescer (Python):**  
  Coalesces and processes data streams in configurable ways.

- **alethic-ism-processor-composite (Python):**  
  Combines multiple data streams to produce composite outputs.

- **alethic-ism-llama (Python):**  
  Similar to other processor modules but tailored for Llama models.

- **alethic-ism-ds (Datasource Processor):**  
  Processes both input and output vectors for various data sources.

### State Routing and Persistence
- **alethic-ism-state-router (Python):**  
  Dynamically discovers states and routes them to the appropriate processing nodes within the execution graph.

- **alethic-ism-state-store (Python):**  
  Synchronizes state persistence (if enabled) and automatically forwards states based on configured routing rules.

### Monitoring & Usage
- **alethic-ism-usage (Go):**  
  Monitors system usage and resource allocation for billing and analytics.

- **alethic-ism-monitor (Python):**  
  Provides logging, system health checks, and monitoring of state transitions.

### Additional & Emerging Components
The Alethic ISM ecosystem continues to expand. Additional modules and experimental projects further extend the system's capabilities, including:
- **Autoscale Distribution Engine:** For on-demand cloud compute allocation, including containers.
- **Commercial-Grade Processors:** Such as versions for Falcon, Llama2, and other advanced models.

---

## Example Use Case: Animal-Friendly LLMs

One notable application of Alethic ISM was its use in evaluating animal-related queries, as explored in the study [The Case for Animal-Friendly LLMs](docs/Ghose%2C%20Tse%2C%20Rasaee%2C%20Sebo%2C%20Singer.pdf). Although the system was initially developed for this purpose, its flexible design now supports a broad range of applications—from language model instruction processing to complex graph-based workflows.

![Conceptual Machinery AnimaLLM](docs/ConceptualMachineryAnimaLLM_20231223r2.png)

---

## Getting Started

### Prerequisites
- **Programming Languages:** Python (and Go if you plan to work with Go-based modules)
- **Core Dependencies:**  
  - [Alethic ISM Core](https://github.com/quantumwake/alethic-ism-core.git)  
  - [Alethic ISM Database](https://github.com/quantumwake/alethic-ism-db.git)

### Installation & Setup
1. **Clone the Repositories:**  
   Clone the necessary repositories listed above.
2. **Follow Individual Guides:**  
   Each component has its own installation instructions—refer to the README in each repository for details.
3. **Run a Working Example:**  
   For a complete example using processors like OpenAI and Anthropic, check out:
   - [Alethic ISM API](https://github.com/quantumwake/alethic-ism-api.git)
   - [Alethic ISM Processor - OpenAI](https://github.com/quantumwake/alethic-ism-processor-openai.git)
   - [Alethic ISM Processor - Anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git)
   - [Alethic ISM Processor - Gemini (WIP)](https://github.com/quantumwake/alethic-ism-processor-gemini)

Detailed documentation and examples for these projects are forthcoming.

---

## Contribution

We welcome contributions, feedback, and questions from the community. Whether you’re improving documentation, reporting issues, or developing new modules, your input is invaluable. Please feel free to open an issue or submit a pull request on any of our repositories.

---

## License

Alethic ISM is released under the AGPL/GNU3 license.

---

## Acknowledgements

Special thanks to:
- **Alethic Research**
- **Princeton University Center for Human Values**
- **New York University**

---

For updates, additional documentation, and involvement opportunities, please visit our [GitHub organization page](https://github.com/quantumwake/alethic) or join our community forums.

Happy coding!
