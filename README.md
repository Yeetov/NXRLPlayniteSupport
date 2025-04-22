# NXRLPlayniteSupport

**NXRLPlayniteSupport** is a cross-platform tool designed to launch Nintendo Switch games directly from Playnite by utilizing the [NX Remote Launcher](https://github.com/kirankunigiri/nx-remote-launcher). This tool is compatible with Windows, Linux, and macOS. It simplifies the process of launching games remotely on a modded Nintendo Switch using the Playnite app.

---

## Features

- Converts hexadecimal Title IDs to decimal automatically.
- Supports both Windows and Linux/macOS platforms.
- Sends a `curl` request to launch games using a remote server (NX Remote Launcher).
- Configurable IP address stored in a separate configuration file.
- Built as an enhancement and companion for the [NX Remote Launcher](https://github.com/kirankunigiri/nx-remote-launcher), making it Playnite-compatible.

---

## Prerequisites

- A modded Nintendo Switch running [NX Remote Launcher](https://github.com/kirankunigiri/nx-remote-launcher) (this project is a dependency).
- Playnite installed on your system.
- The remote server (NX Remote Launcher) should be running on your Nintendo Switch.
- `curl` installed on your machine (comes pre-installed on macOS and Linux. Windows users may need to install it).

---

## Installation

### 1. Download the Repository

Download or clone the `NXRLPlayniteSupport` repository.

    git clone https://github.com/yourusername/NXRLPlayniteSupport.git

### 2. Configure the IP Address

Edit the `config.txt` file to provide the IP address of your Nintendo Switch running the NX Remote Launcher.

    ip=192.168.x.x  # Replace with your Switch's local IP address

### 3. Platform-Specific Setup

- **Windows**: Use the `.bat` file for launching.
- **Linux/macOS**: Use the `.sh` file for launching.
- Ensure that the appropriate script is executable.

---

## Usage

### Windows

1. Open a Command Prompt window.  
2. Navigate to the folder where the `launch_switch_game.bat` file is located.  
3. Run the batch file with the Title ID as an argument:

        launch_switch_game.bat 01005EA01C0FC000

### Linux/macOS

1. Open a Terminal window.  
2. Navigate to the folder where the `launch_switch_game.sh` file is located.  
3. Make the script executable:

        chmod +x launch_switch_game.sh

4. Run the script with the Title ID as an argument:

        ./launch_switch_game.sh 01005EA01C0FC000

---

## How It Works

- This tool acts as a Playnite-compatible wrapper for the [NX Remote Launcher](https://github.com/kirankunigiri/nx-remote-launcher).
- When you run the script with a Title ID (in either hexadecimal or decimal format), it first checks if the Title ID contains letters (indicating it’s in hexadecimal format).
- If the Title ID is in hexadecimal, it converts it to decimal and sends it as part of a `curl` POST request to your remote Nintendo Switch, which launches the corresponding game via NX Remote Launcher.
- If the Title ID is already in decimal format, it is used directly.
- The IP address of the Nintendo Switch is fetched from the `config.txt` file, so there’s no need to hardcode it into the script.

---

## Example

If the Title ID for a game is `01005EA01C0FC000` (in hexadecimal), you can launch it like this:

    launch_switch_game.bat 01005EA01C0FC000   # Windows
    ./launch_switch_game.sh 01005EA01C0FC000   # Linux/macOS

---

## Troubleshooting

- **No Title ID passed**: Ensure that you pass the Title ID when running the script.
- **Conversion failed**: Check that the Title ID is valid and properly formatted.
- **App ID is missing or invalid**: Make sure the Title ID is correct and corresponds to a game that can be launched on your Nintendo Switch using NX Remote Launcher.

---

## License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## How to Use in Playnite

![How to Use in Playnite](https://i.ibb.co/m5GbJBRy/image.png)

This tool is intended to integrate directly with the [NX Remote Launcher](https://github.com/kirankunigiri/nx-remote-launcher), which must be running on your modded Nintendo Switch.
