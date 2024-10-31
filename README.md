# FOR A 2560x440p MAIN MONITOR ONLY, YOU WILL HAVE TO ADJUST NUMBERS TO MAKE IT WORK FOR OTHER SIZES

# Requirements
- HIDAPI
- OBS
- Python
- obs-websocket-py pip module
- https://github.com/itsmikethetech/Virtual-Display-Driver

# How to set up

**SimAppPro**
- Go to Game Peripheral Display
- Make sure your MFD screen is selected as NEITHER of the options
- Recommended to run with close 1 split 3 mode

**Virtual Displays**
- Using virtual display driver
- Follow this tutorial twice, making 2 displays https://www.youtube.com/watch?v=TQeMtr1soto&t=266s
- Next, go to display settings on windows
- Make sure both virtual displays are set to extend desktop
- Move them to be between your monitor and your MFD screen
![](https://drive.google.com/drive-viewer/AKGpihY5keUR2bTT_PwknMNYjkKRmAmXDGRB-g6zmTkua3h3wffRU-aZtYVTW8WQoxR3h87t8YBx_coNRVFzkws63WgCifcZbixamPY=s2560)
- Select the first of the 2 virtual displays
- Scroll down to Scale & Layout, set orientation to portait and resolution to 768x1024
- Select the second of the 2 virtual displays
- Scroll down to Scale & Layout, set orientation to portait and resolution to 768x1024

**OBS**
- File > Settings > Video > Base (Canvas) Resolution to 768x1024
- Ok
- Tools > WebSocket Server Settings
- Check Enable WebSocket Server
- Set Server Port to 4455
- Click Generate Password
- Click Show Connect Info
- Copy Server Password
- Open main.py in a text editor
- On line 8, set the word password to the password you copied, keep the quotes
- Save
- Close the text editor & WebSocket Connect Info
- Ok
- Back to your main OBS window
- Create 2 scenes, 1 named "MFD_Left" and the other "MFD_Right"
- In MFD_Left, create a display capture (in sources), set it to the leftmost of the 2 virtual displays you made
- In MFD_Right, create a display capture (in sources), set it to the rightmost of the 2 virtual displays you made

**DCS**
- Go to C:\Users\your_username\Saved Games\DCS.openbeta\Config
- Create a folder named "MonitorSetup"
- put the custom.lua file in the MonitorSetup folder
- Go to C:\Users\your_username\Saved Games\DCS.openbeta\Config
- Open options.lua with a text or code editor
- Press ctrl+f and search for width
- Set width to 4096
- Press ctrl+f and search for height
- Set height to 1440
- Save then close your text editor
- Open the DCS launcher
- Go to settings in the launcher
- In the monitors setting, set it to "Custom MFDs"
- Reboot DCS

**When running the game**
- Run main.py with python
- Open OBS
- Right click in the light gray area
- Fullscreen projector (preview)
- USB_Monitor
- Leave OBS and main.py open and running (close when youre done with dcs)
- Open DCS
- Have fun
![](https://drive.google.com/drive-viewer/AKGpihYR2c_Dyq7zB49zNCifDF1dblhAGBNknESqynx7UmTM_6dGckho9k5xIcAvjFFwu_Jp3hDn93qaU33MCUlI4ke7PtJZlxtBfqw=s1600-rw-v1)

# If your 3 way switch doesnt switch the screens
- Run the discover-mfd-address.py file with python
- Open main.py with a text editor and check that Vendor ID, Product ID, and Path all match, the only thing thats different between the 3 devices that will show up is the path. It shouldnt matter which path you choose.
- To copy over things from the pop up, you will need to highlight it then do ctrl+shift+c

**To verify input is correct**
- Copy the path from one of the devices (ctrl+shift+c)
- Paste it into the pop up (ctrl+shift+v)
- Enter
- When in the bottom position, you should see Data received: b'\x03\x00\x00\x00\x00\x00\x10\x00\x00\x80'
- Middle should be Data received: b'\x03\x00\x00\x00\x00\x00 \x00\x00\x80'
- Top should be Data received: b'\x03\x00\x00\x00\x00\x00@\x00\x00\x80'
- If any of those are different for you, copy the entire line including the b, not including the "Data received: "
- Open main.py in a text editor
- Paste that under TOGGLE_POSITIONS in main.py in the right spot for MFD_Right, MFD_Middle, MFD_Left, etc
