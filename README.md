# Alethic Instruction-Based State Machine (ISM)

## Introduction
Welcome to the Alethic ISM project group! Born from the study "The Case for Animal-Friendly LLMs," this project is a journey into experimental language instruction processing, exploring how language models respond to animal-related queries.

## Key Concepts
- **State**: Manages data and instructions, representing processing stages.
- **Instruction**: Enables transformation and processing of states.
- **Instruction Processor**: Transforms states based on custom instructions.
- **State Storage**: Handles the ephemeral and or long term storage of state information (see alethic-ism-db).
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
The Alethic ISM is released under the GNU3 license.

## Acknowledgements
Alethic Research, Princeton University Center for Human Values, New York University

---

Stay tuned for more updates and information. For involvement opportunities, visit [Alethic ISM GitHub page](https://github.com/quantumwake/alethic) or create an issue / comment ticket.
