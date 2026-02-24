PImage midi;

PImage pedal;
int showPedal = 0; 

PImage midiMerger;
int showMidiMerger = 0;

PImage atari1040;
int showAtari1040 = 0;

PImage dx7;
int showDX7 = 0;

PImage kk;
int showKK = 0;

PImage opcode;
int showOpcode = 0;

PImage mac;
int showMac;

PImage sampler;
int showSampler = 0;

PImage atariMega;
int showAtariMega = 0;

PImage reverb;
int showReverb = 0;

void setup() {
  size(817,1059);
  String path = dataPath("");
  midi = loadImage(path + "/midi.gif");
  pedal = loadImage(path + "/pedal2.jpg");
  midiMerger = loadImage(path + "/AKAIMIDIMerger.jpg");
  atari1040 = loadImage(path + "/Atari_1040ST.jpg");
  dx7 = loadImage(path + "/DX7.jpg");
  kk = loadImage(path + "/k&k.png");
  opcode = loadImage(path + "/OpcodeStudio.jpg");
  mac = loadImage(path + "/MacintoshII.jpg");
  sampler = loadImage(path + "/AKAIS1000_large.jpg");
  atariMega = loadImage(path + "/AtariMegaST2.png");
  reverb = loadImage(path + "/reverb.jpg");
}

void draw() {

  image(midi, 0, 0, 817, 1059);
  fill(0);
  text(mouseX + " | " + mouseY, mouseX + 5, mouseY + 5); 
  
  if(showPedal % 2 == 1)
    image(pedal, 220, 275);
  
  if(showMidiMerger % 2 == 1)
    image(midiMerger, 220, 520, midiMerger.width * .25, midiMerger.height * .25);
  
  if(showAtari1040 % 2 == 1)
    image(atari1040, 220, 610, atari1040.width * .05, atari1040.height * .05);
  
  if(showDX7 % 2 == 1)
    image(dx7, 50, 720, dx7.width * .1, dx7.height * .1);
    
  if(showKK % 2 == 1)
    image(kk, 135, 370, kk.width * .7, kk.height * .7);
    
  if(showOpcode % 2 == 1)
    image(opcode, 270, 650, opcode.width * .5, opcode.height * .5);
    
  if(showMac % 2 == 1)
    image(mac, 270, 600, mac.width * .1, mac.height * .1);
    
  if(showSampler % 2 == 1)
    image(sampler, 400, 410, sampler.width * .1, sampler.height * .1);
    
  if(showAtariMega % 2 == 1)
    image(atariMega, 410, 600, atariMega.width * .25, atariMega.height * .25);
    
  if(showReverb % 2 == 1)
    image(reverb, 400, 620, reverb.width * .5, reverb.height * .5);
}

void mousePressed() {
  
  //first row
  if(mouseX > 50 && mouseX < 140)
  {
    if(mouseY > 720 && mouseY < 770)
    {
      println("DX7");
      showDX7++;
    }
  }
  
  //second row k&k
  if(mouseX > 135 && mouseX < 400)
  {
     if(mouseY > 370 && mouseY < 410)
     {
       println("K&K");
       showKK++;
     }
  }
  
  //Third row
  if(mouseX > 220 && mouseX < 310)
  {
    //pedal
    if(mouseY > 275 && mouseY < 330)
    {
       //show pedal
       println("pedal");
       showPedal++;
    }
    
    //midi merger
    if(mouseY > 520 && mouseY < 560)
    {
      println("midi merger");
      showMidiMerger++;
    }
    
    //atari 1040
     if(mouseY > 610 && mouseY < 660)
    {
      println("atari 1040");
      showAtari1040++;
    }
  }
  
  //fourth row Opcode and Mac
  if(mouseX > 270 && mouseX < 440)
  {
    //opcodew
    if(mouseY > 860 && mouseY < 900)
    {
      println("opcode");
      showOpcode++;
    }
    
    if(mouseY > 945 && mouseY < 1020)
    {
      println("mac");
      showMac++;
    }
  }
  
  //fifth rwo atari
  if(mouseX > 450 && mouseX < 530)
  {
     if(mouseY > 610 && mouseY < 660)
     {
       println("atari mega");
       showAtariMega++;
     }
  }
  
  //sixth row akai and matric
  if(mouseX > 510 && mouseX < 610)
  {
     if(mouseY > 410 && mouseY < 460)
     {
       println("sampler");
       showSampler++;
     }
  }
  
  //seventh row reverb and arion
  if(mouseX > 575 && mouseX < 660)
  {
    if(mouseY > 720 && mouseY < 770)
    {
      println("reverb");
      showReverb++;
    }
  }
  
}
