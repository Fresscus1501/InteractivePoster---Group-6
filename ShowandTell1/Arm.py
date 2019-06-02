import usb, time

Armc = 1750
Arm = None

while (Arm == None):
    Arm = usb.core.find(idVendor=0x1267,idProduct=0x0001)
    Armc = Armc+1
    if (Armc == 2000):
        print ('arm couldnt connect')
        Armc = Armc/2000
        