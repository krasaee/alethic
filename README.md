

# Alethic-ISM

_– Instruction-Based State Machine for Composable Analytic Workflows_  
_– Research Workbench for Computational Reasoning_

_(Status: Experimental)_

---

**Alethic-ISM** is an experimental system for composing and executing directed graphs of instruction-based state transitions. It enables orchestration and computation across domains including _AI pipelines, research workflows, agent modeling, and normative structural analysis_.

Its modular architecture includes a core execution engine, processors, API services, routing and streaming components, and a visual web-based editor for composing, inspecting, and executing live computation graphs. The system integrates seamlessly with AI models, structured data, and executable code, supporting real-time, distributed execution through a publish-subscribe model and dynamic workload management. It is designed to scale across data-intensive workflows and streaming pipelines.

Instructions can invoke code, query data, direct large language models, or perform structured transformations. Each node applies an instruction to an input state via a processor, producing a new, versioned, immutable output state. Together, these nodes form computable workflows that are fully executable, traceable and reproducible.

The system is experimental and is under active development as part of Bioethics with AI research supported by the University of Oxford and the National University of Singapore, with previous research support from Princeton University.

![Alethic Studio](alethic_studio_1.png)

---

## Core Architecture

Alethic-ISM is built on a modular, extensible, and interoperable architecture:

- **Immutable State Transitions**: All computation flows through transformations of immutable, versioned states.
- **Instruction Graphs**: Workflows are represented as directed graphs. Each node specifies a processor, an instruction, and its inputs.
- **Execution Engine**: Resolves dependencies, evaluates nodes, and routes outputs through the graph.
- **Processors**: Modules that define how instructions are interpreted (e.g., OpenAI, Python, Anthropic).
- **State Store & Router**: Persist and route states between graph segments, enabling distributed execution.
- **API Services**: Provide access for submitting, inspecting, or modifying workflows via REST or streaming interfaces.
- **Alethic Studio**: A visual web interface for building, executing, and analyzing workflows.

> _[Jump to quickstart ⤵](#quickstart)_

---

## Modules

### Core Libraries

- `alethic-ism-core` (Python): Core state machine and instruction interfaces.
- `alethic-ism-db` (Python): State persistence, versioning, and DB integration.
- `alethic-ism-core-go` (Go): Go implementation of the execution engine.

### API Services

- `alethic-ism-api` (FastAPI): RESTful control interface for managing workflows.
- `alethic-ism-query-api` (Go): Fast, read-only access to state and graph data.
- `alethic-ism-streams-api` (Go): Streaming interface for distributed state transitions and event handling.

### Instruction Processors

- `alethic-ism-processor-openai`: Executes LLM instructions using OpenAI.
- `alethic-ism-processor-anthropic`: Claude model processor.
- `alethic-ism-processor-google`: *(In development)* Gemini processor.
- `alethic-ism-processor-llama`: Supports LLaMA-family models.
- `alethic-ism-processor-python`: Executes sandboxed Python logic.
- `alethic-ism-processor-coalescer`: Merges multiple inputs into a single state.
- `alethic-ism-processor-composite`: Composite multi-source processor.
- `alethic-ism-ds`: Structured datasource input/output.

### Instruction Transformers

These processors merge or compose multiple inputs:

- `alethic-ism-transformer-coalescer`: Merges multiple input states into a unified output.
- `alethic-ism-transformer-composite`: Combines structured and model-based outputs across sources.

### Routing & Persistence

- `alethic-ism-state-router`: Dynamically directs state outputs across graph edges.
- `alethic-ism-state-store`: Manages optional persistence and retrieval.

### Monitoring & Usage

- `alethic-ism-monitor`: Logs events, tracks system health.
- `alethic-ism-usage`: Tracks processor usage and system metrics.

### UI

- `alethic-ism-ui`: Alethic Studio — web-based visual editor and real-time graph computer.

### Optional & Deployment Modules

- `alethic-ism-helm`: Kubernetes Helm charts for deployment orchestration.
- `alethic-ism-state-sync-store`: Sync module for broadcasting state updates in clustered setups.

### Experimental & Emerging

- Autoscale Distribution Engine (WIP)
- Falcon, Gemini, LLaMA2 processors (in development)

---

## Use Cases

- **AI orchestration**:  
  Multi-step prompt pipelines, dynamic model switching, modular reasoning chains.

- **Data processing with provenance**:  
  Build structured workflows with immutable state transitions and versioned transformations.

- **Research pipelines**:  
  Compose analytic workflows with full traceability and graph-based conceptual modeling.

- **Agents with modeled reasoning**:  
  Encode agent processes, preference updates, and perspective-based decisions.

- **Structured normative reasoning**:  
  Represent and compute reflective equilibrium, preference assessments, and principled tradeoffs in bioethics, clinical ethics, and more.

<div align="center">
  <table>
    <tr>
      <td><img src="results_example_1.png" width="350"/></td>
      <td><img src="results_example_2.png" width="350"/></td>
    </tr>
    <tr>
      <td><img src="results_example_3.png" width="350"/></td>
      <td><img src="results_example_4.png" width="350"/></td>
    </tr>
  </table>
</div>

---

## Execution Model

Each graph execution begins with one or more input states and proceeds via instruction nodes.

- Each node: `Input state → Instruction → Output state`
- Output state is versioned and has a unique ID
- Graphs can be executed incrementally or fully
- All transitions are recorded for inspection and replay

---

## Outputs

Each run produces:

- Final and intermediate states (all versioned)
- Instruction-level metadata (type, processor, duration, dependencies)
- Logs of model completions or function returns
- Full execution trace (`state_trace.json`)
- Optional exports: JSON summaries, CSV tables, serialized replay data

---

## Quickstart

### Requirements

- Python 3.10+  
- Go (for API services)  
- Docker (optional)

### Running

After setup:

- Start backend services (API, DB, Studio)
- Open **Alethic Studio** in your browser
- Load or create a workflow (e.g., informed consent)
- Run nodes individually or execute the full graph
- Inspect states, outputs, and graph trace

### Setup

```bash
git clone --recursive https://github.com/alethic/alethic-ism
cd alethic
git submodule update --init --recursive

# Run module-specific setup or use docker-compose
```

---

## Project Status

**Current stability:**

- **Core engine**: Functional and used in experimental settings
- **Instruction processors**: Stable for Python, OpenAI, Composite; others are in active development
- **UI (Alethic Studio)**: Alpha version; supports core functionality
- **API and routing**: Evolving with ongoing architectural extensions
- ⚠️ **Note**: Interfaces may change; backward compatibility is not guaranteed

Contributions are welcome. This system is not yet production-hardened.

---

## Citation

If you use Alethic-ISM in research or academic work, please cite:

> Rasaee, K., Ghose, S. et al. (2025).  
> *"Alethic-ISM: Technical Appendix" in Doing Ethics With AI (Ghose, S., et al)*  
> Forthcoming. [DOI or permanent URL to be added]

---

## Contributing & Collaboration

We welcome contributions, feedback, and questions from the community – and we invite collaboration from developers and researchers.

Whether you're improving documentation, reporting issues, developing new modules, or proposing new use cases, your input is invaluable. This is an experiment and our only aim is results.

You can:

- Submit issues or feature requests
- Open pull requests for bug fixes or improvements
- Propose new processors, workflows, or integrations
- Help expand documentation or UI functionality
- Build analytic workflows for use cases
- Utilize in reasoning, decision-making, or agentic projects

If you're working on related projects or would like to collaborate on applied deployments, please get in touch. We're especially interested in partnerships across research tooling, applied reasoning systems, the structure of normative ethics, applied use in biomedical and legal settings, and artificial intelligence.

See `CONTRIBUTING.md` (coming soon) for development guidelines, or please reach out directly to our research team.

---

## Contact

**For questions, feedback, or collaboration:**

📧 [kasra@alethic.ai](mailto:kasra@alethic.ai)  
📧 [sankalpa@alethic.ai](mailto:sankalpa@alethic.ai)

Alethic-ISM is developed as part of the *Bioethics With AI* project at the University of Oxford and the National University of Singapore.

If you're using **Alethic-ISM** in research or applied contexts, let us know — we’re building a shared case library.

---

## License

**AGPL v3**  
Intended for academic, research, and nonprofit institutional use.
