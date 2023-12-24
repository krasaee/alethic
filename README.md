# Alethic Instruction-Based State Machine (ISM)

## Introduction
Welcome to the Alethic ISM project group! This project was born from my interest and work on "Case for Animal-Friendly LLMs". It's an experimental journey, and while I don't claim to have all the answers, I'm excited about what we're building here. 

# Description
The Alethic ISM project, an experimental framework utilizing state machines for instruction processing, specifically but not limited to language processing. Developed from scratch in under two months, it includes a full suite of initial research experiments, which we will share shortly. 

## Key Concepts
- **State Machines**: Alethic ISM employs state machines for data and instruction handling, with each state representing distinct information or processing stages.
- **Instruction Processing**: It processes states incrementally, ideal for tasks like generating and evaluating language model responses, leading to new state convergences.
- **Extensibility and Flexibility**: Designed to support various processors, including OpenAI and Anthropic, with future plans to integrate models like Llama2 and Falcon. It's adaptable for diverse instructional processors and data processing.

## Overview
Alethic ISM uses state objects encapsulating data values, constants, or function derived data. These states are processed by a range of processors for executing instructions and managing transitions, guided by flexible configurations like, particularly StateConfigLM for language processing.

# Example Machinery for Case for Animal-Friendly LLMs
![Conceptual Machinery AnimaLLM](docs/ConceptualMachineryAnimaLLM_20231223r2.png)

## Getting Started
- **Dependencies**: To begin with the Alethic ISM, clone the core components:
  - [Alethic ISM Core](https://github.com/quantumwake/alethic-ism-core.git)
  - [Alethic ISM Database](https://github.com/quantumwake/alethic-ism-db.git)
 
- **Working Machine**: Check out our operational components, forming the project's backbone:
  - [Alethic ISM API](https://github.com/quantumwake/alethic-ism-api.git)
  - [Alethic ISM Processor - OpenAI](https://github.com/quantumwake/alethic-ism-processor-openai.git)
  - [Alethic ISM Processor - Anthropic](https://github.com/quantumwake/alethic-ism-processor-anthropic.git)
 
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

Stay tuned for more updates and information. For involvement opportunities, visit [Alethic ISM GitHub page](https://github.com/quantumwake/alethic) or contact us at krasaee@gmail.com.
