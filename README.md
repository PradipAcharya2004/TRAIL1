# Smart Workflow Automator v4

This version is designed around the 2-install setup:

1. **Main desktop app**
2. **Optional Chrome Helper extension**

The Chrome Helper makes browser automation much better because it reads the web page structure directly instead of guessing from screenshots.

## What v4 adds

### Main App
- Workflow builder
- Raw mouse/keyboard recording
- Save/load JSON workflows
- Replay speed control
- Variables
- CSV/Excel row automation
- Loops
- Visual image matching
- Full-screen/multi-scale retargeting
- Smart click correction learning
- OCR optional support
- Local Chrome Helper WebSocket server

### Chrome Helper Extension
- Click visible web text/buttons/links
- Fill input fields by label/placeholder/name/selector
- Browser search
- Wait for web page text
- Page snapshot of visible buttons and fields
- Connects only to `ws://127.0.0.1:8765`

## Developer run

```bat
pip install -r requirements.txt
python smart_workflow_automator.py
```

## Build single EXE

On Windows:

```bat
build_windows_exe.bat
```

Output:

```text
dist\SmartWorkflowAutomator.exe
```

## Install Chrome Helper extension

1. Open Chrome.
2. Go to:

```text
chrome://extensions
```

3. Turn on **Developer mode**.
4. Click **Load unpacked**.
5. Select the folder:

```text
chrome_helper_extension
```

6. Open the desktop app.
7. The app should show:

```text
Chrome Helper: connected.
```

## Recommended final setup for users

- Give users the main app `.exe`.
- Give users the `chrome_helper_extension` folder or bundle it in an installer.
- They install/load the extension once.
- After that, they run the app and automate workflows.

## Why this is exponentially better

Without the helper, the app sees the browser as pixels.

With the helper, it can understand the DOM:

```json
{
  "element": "button",
  "text": "Export",
  "clickable": true
}
```

That means it can handle resized windows, moved buttons, and many webpage layout changes much better.

## Still not magic

This is much stronger than a normal macro recorder, but no automation system is perfect. It can still fail if:

- The page design changes completely
- Login expires
- A popup blocks the page
- Permissions are different
- The target text changes
- The site blocks automation-style interactions

That is why v4 includes retries, checkpoints, and correction learning.
