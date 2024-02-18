# Alethic Instruction-Based State Machine (ISM)

**See below for list of related child projects**

## Introduction 
Welcome to the Alethic ISM project group! Originating from the study [The Case for Animal-Friendly LLMs](docs/Ghose%2C%20Tse%2C%20Rasaee%2C%20Sebo%2C%20Singer.pdf), this project embarks on a journey into experimental language instruction processing, exploring how language models respond to animal-related queries, while also being open to a broader range of applications.

The Alethic Instruction-Based State Machine (ISM) is a versatile framework designed to efficiently process a wide spectrum of instructions. Fundamentally, the project is driven by a commitment to animal welfare, using language-based instructions as a foundational use-case to evaluate, benchmark, score, and gather insights concerning animal well-being. Nonetheless, the architecture and functionality of the Alethic ISM go beyond its initial aim, offering a platform that boasts considerable flexibility and scalability.

Utilizing a state machine approach, the Alethic ISM manages and executes instructions, and transforms states through a network of interconnected processors. These processors are capable of handling a broad array of tasks beyond merely language-based ones, encompassing legal and medical evaluation, benchmarking, scoring, and various other graph-based instructions tailored for specific domains.

The system's architecture is built on a consumer/producer model for API-level state management and instruction execution. Together with a graph-based UI that facilitates the creation of connections between instructions and states, the Alethic ISM provides a dynamic and intuitive visualization of the process, enhancing the user's ability to understand and interact with the system.

Additionally, in the Alethic ISM, each state's execution is immutable, occurring only once. Reusing previous states with new instructions results in new, immutable outputs, not alterations to existing states. Every instruction process is marked with a checksum to ensure uniqueness; modifications trigger new state outputs and, consequently, new outputs for subsequent transitions. This design guarantees transparency and auditability in the process flow. As a result, the Alethic ISM allows for the maintenance of multiple versions of the same state inputs given new instructions, enabling the comparison of a timeline of states as new instructions are applied. This feature facilitates an in-depth analysis and understanding of how changes in instructions impact the evolution of states over time.

## Key Concepts
- **State**: Manages data and instructions, representing processing stages.
- **Instruction**: Enables transformation and processing of states.
- **Instruction Processor**: Transforms states based on custom instructions.
- **State Storage**: Handles the ephemeral, immutable, versioning, and storage of state data (see alethic-ism-db).
- **Extensibility and Flexibility**: Supports processors like OpenAI, Anthropic, and more.

## Overview
Alethic ISM utilizes state machines for versatile instruction processing:
- State objects encapsulate data and drive processing.
- Extensible for custom instructions and processors.
- Scalable architecture using a consumer/producer approach for API-level state management.
- Potential for a graph-based UI to visualize state transitions.

The project's experimental nature provides valuable insights into language model behaviors and data processing strategies.

# Example Machinery for Case for Animal-Friendly LLMs
![Conceptual Machinery AnimaLLM](docs/ConceptualMachineryAnimaLLM_20231223r2.png)

## Getting Started
- **Dependencies**: core components of the Alethic system:
  - [Alethic ISM Core](https://github.com/quantumwake/alethic-ism-core.git)
  - [Alethic ISM Database](https://github.com/quantumwake/alethic-ism-db.git)
 
- **Working Machine**: components forming working processors for openai and anthropcis:
  - [Alethic ISM API](https://github.com/quantumwake/alethic-ism-api.git)
  - [Alethic ISM Processor - OpenAI](https://github.com/quantumwake/alethic-ism-processor-openai.git)
  - [Alethic ISM Processor - Anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git)
 
- **In Development Machine**: components forming the processors, such as llama and falcon.
  - [Alethic ISM Processor - General](https://github.com/quantumwake/alethic-ism-processor-general.git)
    
- **Work in Progress**: Explore our expanding capabilities and future directions:
  - [Alethic ISM Processor - Gemini (TBD)](https://github.com/quantumwake/alethic-ism-processor-gemini)
  - [Alethic ISM Processor - Falcon (TBD)](https://github.com/quantumwake/alethic-ism-processor-falcon)
  - [Alethic ISM Processor - Llama2 (TBD)](https://github.com/quantumwake/alethic-ism-processor-llama2)
  - [Alethic ISM UI (TBD)](https://github.com/quantumwake/alethic-ism-ui)

Detailed examples and instructions will be provided soon. We are committed to constantly updating and improving our documentation.

## Contribution
We warmly welcome contributions, questions, and feedback. Feel free to reach out if you have any queries or suggestions for the project.

## License
The Alethic ISM is released under the AGPL/GNU3 license.

## Acknowledgements
Alethic Research, Princeton University Center for Human Values, New York University

---

Stay tuned for more updates and information. For involvement opportunities, visit [Alethic ISM GitHub page](https://github.com/quantumwake/alethic) or create an issue / comment ticket.
