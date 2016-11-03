import CoreBluetooth

//Define class variable in your VC/AppDelegate
var bluetoothPeripheralManager: CBPeripheralManager?

 //On viewDidLoad/didFinishLaunchingWithOptions
let options = [CBCentralManagerOptionShowPowerAlertKey:0] //<-this is the magic bit!
bluetoothPeripheralManager = CBPeripheralManager(delegate: self, queue: nil, options: options)

func peripheralManagerDidUpdateState(peripheral: CBPeripheralManager!) {

    var statusMessage = ""

    switch peripheral.state {
    case CBPeripheralManagerState.PoweredOn:
        statusMessage = "Bluetooth Status: Turned On"

    case CBPeripheralManagerState.PoweredOff:
        statusMessage = "Bluetooth Status: Turned Off"

    case CBPeripheralManagerState.Resetting:
        statusMessage = "Bluetooth Status: Resetting"

    case CBPeripheralManagerState.Unauthorized:
        statusMessage = "Bluetooth Status: Not Authorized"

    case CBPeripheralManagerState.Unsupported:
        statusMessage = "Bluetooth Status: Not Supported"

    default:
        statusMessage = "Bluetooth Status: Unknown"
    }

    println(statusMessage)

    if peripheral.state == CBPeripheralManagerState.PoweredOff {
        //TODO: Update this property in an App Manager class
    }
}
