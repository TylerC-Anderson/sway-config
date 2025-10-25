
### 🧠 SwayFX Workflow – “Opinionated Workspaces”

**Purpose**
A modular, named-workspace configuration for SwayFX.
Each workspace is opinionated, that is, each app opens to one workspace, on one monitor.
The hope is for zero-friction context-switching.

**ToDos**
Make Waybar into something useful

---

**Core Workflow**

* **Spatial layout** → Every monitor has dedicated roles (e.g., *Left = Reference, Mid = Work, Right (vertical monitor) = Comms and LLM*).
* **Named workspaces** → `brws`, `code`, `chat`, etc. allow for declarative application movements.
* **Auto-assignment** → Apps open on their corresponding workspace automatically, and workspace is opened opened to display the app.

---

**Dependencies**

* `swayfx` (blur / rounded corners)
* `waybar`
* `wofi`
* `cliphist`
* `flameshot` (optional screenshots)
* `autotiling-rs`
* `brightnessctl`, `pactl`
* `maple mono nf` for a pretty font: https://github.com/subframe7536/Maple-font
* `jq` (if you later add scripting helpers)

---

**File Layout**

```
~/.config/sway/
├── config                   # includes all below
└── conf.d/
    ├── 00-variables.conf
    ├── 10-env-and-agents.conf
    ├── 20-autostart.conf
    ├── 30-input.conf
    ├── 40-outputs.conf
    ├── 50-appearance.conf
    ├── 60-workspaces-and-rules.conf
    ├── 65-bindings-core.conf
    ├── 66-bindings-workspaces.conf
    ├── 67-bindings-utilities.conf
    └── 68-bindings-summon.conf
```

Each file governs a single subsystem (variables, environment, outputs, keybinds, etc.).
You can extend this pattern endlessly without touching the root `config`.

