import hid

#
# You only need to use this if the main.py script doesnt work for you
#

# Replace with the correct Vendor ID and Product ID for WINWING MFD1-L
vendor_id = 0x4098
product_id = 0xBEE1

def list_hid_devices():
    for device in hid.enumerate():
        if device['vendor_id'] == vendor_id and device['product_id'] == product_id:
            print(f"Device Found: {device['product_string']}")
            print(f"  Vendor ID: {hex(device['vendor_id'])}")
            print(f"  Product ID: {hex(device['product_id'])}")
            print(f"  Path: {device['path']}")
            print(f"  Interface Number: {device['interface_number']}")
            print("")

def monitor_device(device_path):
    try:
        device = hid.Device(path=device_path)
        print("Monitoring device data. Press Ctrl+C to stop.")
        while True:
            data = device.read(64)
            if data:
                print(f"Data received: {data}")
    except KeyboardInterrupt:
        print("Stopped monitoring.")
    except Exception as e:
        print(f"Error: {e}")
    finally:
        try:
            device.close()
        except NameError:
            pass

if __name__ == "__main__":
    list_hid_devices()
    path = input("Enter the path of the device to monitor (include the b prefix and quotes): ")
    # Convert the input string to a byte string
    path = eval(path)
    monitor_device(path)


# MY MFD
# Device: WINWING MFD1-L
#  Vendor ID: 0x4098
#  Product ID: 0xbee1
#
#Device: WINWING MFD1-L
#  Vendor ID: 0x4098
#  Product ID: 0xbee1
#
#  Device: WINWING MFD1-L
#  Vendor ID: 0x4098
#  Product ID: 0xbee1

