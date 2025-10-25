
### 🧠 Sway Workflow – “Opinionated Workspaces”

**Purpose**
A modular, named-workspace configuration for Sway.
Each workspace is opinionated, that is, each app opens to one workspace, on one monitor.
The hope is for zero-friction context-switching.

**ToDos**
Make my Waybar into something useful

---

**Core Workflow**

* **Spatial layout** → Every monitor has dedicated roles (e.g., *Left = Reference, Mid = Work, Right (vertical monitor) = Comms and LLM*).
* **Named workspaces** → `brws`, `code`, `chat`, etc. allow for declarative application movements.
* **Auto-assignment** → Apps open on their corresponding workspace automatically, and workspace is opened opened to display the app.

---

**Dependencies**

* [SwayFX](https://github.com/WillPower3309/swayfx) (blur / rounded corners)
* [waybar](https://github.com/Alexays/Waybar)
* [wofi](https://github.com/SimplyCEO/wofi)
* [cliphist](https://github.com/sentriz/cliphist)
* [flameshot](https://github.com/flameshot-org/flameshot)
* [autotiling-rs](https://github.com/ammgws/autotiling-rs)
* [brightnessctl](https://github.com/Hummer12007/brightnessctl), `pactl`
* [Maple Mono Nerd Font](https://github.com/subframe7536/maple-font) by subframe7536 for a pretty font

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

---

**Credits**
Themeing/rice credit goes to [Diinki's Retrofuture](https://github.com/diinki/diinki-retrofuture) ricing video and repo. The wallpaper I currently use is theirs as well, which looks so good I'm having a hard time finding another one to add 😅.
