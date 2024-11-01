import hid
from obswebsocket import obsws, requests
import time

# OBS WebSocket connection parameters
OBS_HOST = "localhost"
OBS_PORT = 4455
OBS_PASSWORD = "password"  # Replace with your OBS WebSocket password

# Data values associated with each toggle switch position
TOGGLE_POSITIONS = {
    b'\x04\x00\x00\x00\x00\x00@\x00\x00\x80': 'MFD_Right',   # Top position
    b'\x04\x00\x00\x00\x00\x00 \x00\x00\x80': 'MFD_Middle', # Middle position
    b'\x04\x00\x00\x00\x00\x00\x10\x00\x00\x80': 'MFD_Left' # Bottom position
}

# Track the last position to avoid duplicate switching
last_position = None

# Function to switch OBS scenes
def switch_obs_scene(scene_name):
    try:
        ws = obsws(OBS_HOST, OBS_PORT, OBS_PASSWORD)
        ws.connect()
        ws.call(requests.SetCurrentProgramScene(sceneName=scene_name))
        ws.disconnect()
    except Exception as e:
        print(f"Failed to switch scene to '{scene_name}': {e}")

# Monitoring function using hidapi
def monitor_device():
    global last_position

    # Initialize the device with the correct path
    device_path = b'\\\\?\\HID#VID_4098&PID_BEE1&Col03#8&9238f9&0&0002#{4d1e55b2-f16f-11cf-88cb-001111000030}'
    device = hid.Device(path=device_path)

    print("Monitoring toggle switch state. Press Ctrl+C to exit...")
    try:
        while True:
            data = device.read(64)
            if data:
                # Check if data matches any known toggle positions
                position_data = bytes(data)
                if position_data in TOGGLE_POSITIONS and position_data != last_position:
                    scene_name = TOGGLE_POSITIONS[position_data]
                    print(f"Switching to OBS scene: {scene_name}")
                    switch_obs_scene(scene_name)
                    last_position = position_data
            time.sleep(0.01)  # Small delay to prevent overloading CPU
    except KeyboardInterrupt:
        print("Exiting...")
    finally:
        device.close()

if __name__ == "__main__":
    monitor_device()
