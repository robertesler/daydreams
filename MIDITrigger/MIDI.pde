import java.io.IOException;
import javax.sound.midi.*;

class MIDI implements Receiver {
    MidiDevice.Info[] devices = MidiSystem.getMidiDeviceInfo();
    byte[] theMessage = new byte[4];
    Transmitter transmitter;
    MidiDevice keyboard = null;
    
    @Override
    public void close() {
      println("Closed MIDI");
    }

    @Override
    public void send(MidiMessage m, long timeStamp) {
      theMessage = m.getMessage();
    
    }
    
    public void sendMyMessage(int note) throws MidiUnavailableException, InvalidMidiDataException, InterruptedException {
      ShortMessage myMsg = new ShortMessage();
      myMsg.setMessage(ShortMessage.NOTE_ON, 0, note, 93);
      long timeStamp = -1;
      Receiver rcvr = MidiSystem.getReceiver();
      rcvr.send(myMsg, timeStamp); 
    }
  
    public void printDevices() {

    for (MidiDevice.Info d : devices)
    {
      println("Device: " + d.getName() + " | " + d.getDescription()); 

      try {
        MidiDevice myDevice = MidiSystem.getMidiDevice(d);
        //check if device is open
        println("Device: " + d.getName() + " is open? " + myDevice.isOpen());
      }
      catch(MidiUnavailableException e) {
        e.printStackTrace();
      }
    }
  }
  
  public MidiDevice setKeyboard(String name) {
    MidiDevice keyboard = null;
    MidiDevice.Info[] devices = MidiSystem.getMidiDeviceInfo();

    for (MidiDevice.Info d : devices)
    { 
      try {
        MidiDevice myDevice = MidiSystem.getMidiDevice(d);

        if (myDevice.getMaxTransmitters() != 0)
        {
          if ((name == null) || (d.getName().toLowerCase().contains(name.toLowerCase())))
          {
            keyboard = myDevice;
            println("Device: " + d.getName());
            break;
          }
        }
      }
      catch(MidiUnavailableException e) {
        e.printStackTrace();
      }
    }
    return keyboard;
  }

  public int setUpMIDI(String device) throws MidiUnavailableException, IOException, InterruptedException {

    MidiDevice k = setKeyboard(device);
    int status = -1;
    
    if (k != null)
    {
      k.open();
      transmitter = k.getTransmitter();
      transmitter.setReceiver(this);
      status = 1;
    } else
    {
      println("Keyboard was not found!");
      status = 0;
    }

    return status;
  }
  
};
