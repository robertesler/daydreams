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

float fudge = .8;
int w = (int)(817 * fudge);
int h = (int)(1059 * fudge) ;

void setup() {
  //it seems we have to hard code our values here
  size(653, 847);
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

  image(midi, 0, 0, w, h);
  fill(0);
  text(mouseX + " | " + mouseY, mouseX + 5, mouseY + 5); 
  
  if(showPedal % 2 == 1)
    image(pedal, 220, 275);
  
  if(showMidiMerger % 2 == 1)
    image(midiMerger, 220 * fudge, 520 * fudge, midiMerger.width * .25  * fudge, midiMerger.height * .25 * fudge);
  
  if(showAtari1040 % 2 == 1)
    image(atari1040, 220 * fudge, 610 * fudge, atari1040.width * .05 * fudge, atari1040.height * .05 * fudge);
  
  if(showDX7 % 2 == 1)
    image(dx7, 50 * fudge, 720 * fudge, dx7.width * .1 * fudge, dx7.height * .1 * fudge);
    
  if(showKK % 2 == 1)
    image(kk, 135 * fudge, 370 * fudge, kk.width * .7 * fudge, kk.height * .7 * fudge);
    
  if(showOpcode % 2 == 1)
    image(opcode, 270 * fudge, 650 * fudge, opcode.width * .5 * fudge, opcode.height * .5 * fudge);
    
  if(showMac % 2 == 1)
    image(mac, 270 * fudge, 600 * fudge, mac.width * .1 * fudge, mac.height * .1 * fudge);
    
  if(showSampler % 2 == 1)
    image(sampler, 400 * fudge, 410 * fudge, sampler.width * .1 * fudge, sampler.height * .1 * fudge);
    
  if(showAtariMega % 2 == 1)
    image(atariMega, 410 * fudge, 600 * fudge, atariMega.width * .25 * fudge, atariMega.height * .25 * fudge);
    
  if(showReverb % 2 == 1)
    image(reverb, 400 * fudge, 620 * fudge, reverb.width * .5 * fudge, reverb.height * .5 * fudge);
}

void mousePressed() {
  
  //first row
  if(mouseX > 50 * fudge && mouseX < 140 * fudge)
  {
    if(mouseY > 720 * fudge && mouseY < 770 * fudge)
    {
      println("DX7");
      showDX7++;
    }
  }
  
  //second row k&k
  if(mouseX > 135 * fudge && mouseX < 400 * fudge)
  {
     if(mouseY > 370 * fudge && mouseY < 410 * fudge)
     {
       println("K&K");
       showKK++;
     }
  }
  
  //Third row
  if(mouseX > 220 * fudge && mouseX < 310 * fudge)
  {
    //pedal
    if(mouseY > 275 * fudge && mouseY < 330 * fudge)
    {
       //show pedal
       println("pedal");
       showPedal++;
    }
    
    //midi merger
    if(mouseY > 520 * fudge && mouseY < 560 * fudge)
    {
      println("midi merger");
      showMidiMerger++;
    }
    
    //atari 1040
     if(mouseY > 610 * fudge && mouseY < 660 * fudge)
    {
      println("atari 1040");
      showAtari1040++;
    }
  }
  
  //fourth row Opcode and Mac
  if(mouseX > 270 * fudge && mouseX < 440 * fudge)
  {
    //opcodew
    if(mouseY > 860 * fudge && mouseY < 900 * fudge)
    {
      println("opcode");
      showOpcode++;
    }
    
    if(mouseY > 945 * fudge && mouseY < 1020 * fudge)
    {
      println("mac");
      showMac++;
    }
  }
  
  //fifth rwo atari
  if(mouseX > 450 * fudge && mouseX < 530 * fudge)
  {
     if(mouseY > 610 * fudge && mouseY < 660 * fudge)
     {
       println("atari mega");
       showAtariMega++;
     }
  }
  
  //sixth row akai and matric
  if(mouseX > 510 * fudge && mouseX < 610 * fudge)
  {
     if(mouseY > 410 * fudge && mouseY < 460 * fudge)
     {
       println("sampler");
       showSampler++;
     }
  }
  
  //seventh row reverb and arion
  if(mouseX > 575 * fudge && mouseX < 660 * fudge)
  {
    if(mouseY > 720 * fudge && mouseY < 770 * fudge)
    {
      println("reverb");
      showReverb++;
    }
  }
  
}
