import com.pdplusplus.*;
/*
This sketch is so we can practice with an acoustic trigger
I'm using a pickup attached to a board as my "pedal" to 
trigger scenes in daydreams

Just set the threshold to something above your baseline.  
There is a small delay, that is inherent in the system.

This is mainly so you can use two audio devices at the same time.
I'm pretty lazy and don't have time to setup all my audio equipment
everytime I practice this 30 minute piece, so I need to use two
audio drivers at the same time, which Pd can't do.  

So this sketch will hopefully help with that. 

Btw, this will only work on a Mac because we are using the IAC Bus,
you could refactor for PC, but would need to change your MIDI device.
See the code below.  

*/

 Pd pd;
 MyMusic music;
 MIDI midi;
 
 float dummyFloat = 1;

 void setup() {
   size(640, 360);
   background(255);
   
   
   music = new MyMusic();
   pd = Pd.getInstance(music);
   
   //start the Pd engine thread
   pd.start();
   midi = new MIDI();
   midi.printDevices();
    try 
    {
      midi.setUpMIDI("Bus 1");// change to another device if you like
    }
    catch(MidiUnavailableException e) {
      e.printStackTrace();
      
    }
    catch (IOException e) {
      e.printStackTrace();
    } 
    catch (InterruptedException e) {
      e.printStackTrace();
    }

    
 }
 
 void draw() {
  
 }
 
 //just for testing
 void mousePressed() {
   float note = random(90) + 37;
   try 
    {
       midi.sendMyMessage((int)note);
    }
    catch (InvalidMidiDataException e) {
      e.printStackTrace();
    }
    catch(MidiUnavailableException e) {
      e.printStackTrace();
    }
    catch (InterruptedException e) {
      e.printStackTrace();
    }
 }
 
 public void dispose() {
   //stop Pd engine
   pd.stop();
   println("Pd4P3 audio engine stopped.");
   super.dispose();
}
 

 class MyMusic extends PdAlgorithm {
   
   float dummy = 0;
   Envelope env = new Envelope();
   float thresh = 50; // change this match just above your baseline
   int dCounter = 0;
   boolean bang = false;
   
   //All DSP code goes here
   void runAlgorithm(double in1, double in2) {
     
     double db = env.perform(in1);
     if(db > thresh)
     {
        bang = true;  
        dCounter = 0;
     }
     
     if(bang == true && dCounter++ > 200)
     {
        try 
        {
           midi.sendMyMessage(36);
        }
        catch (InvalidMidiDataException e) {
          e.printStackTrace();
        }
        catch(MidiUnavailableException e) {
          e.printStackTrace();
        }
        catch (InterruptedException e) {
          e.printStackTrace();
        }
       bang = false;
      }
   
     
     outputL = outputR = 0; 
     
   }
  
  
   //Free all objects created from Pd4P3 lib
   void free() {
     Envelope.free(env);
   }
   
 }
