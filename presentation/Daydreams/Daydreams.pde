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
boolean macIsShowing = false;

PImage sampler;
int showSampler = 0;

PImage atariMega;
int showAtariMega = 0;

PImage reverb;
int showReverb = 0;

PImage audio;
int showAudio = 0;
boolean audioIsShowing = false;

PImage mixer;
int showMixer = 0;

PImage arionFront;
int showArionFront = 0;

PImage arionBack;
int showArionBack;

PImage max1;
int showMax1 = 0;

PImage max2;
int showMax2 = 0;

int showMatrix = 0;

int xColor = 0;

float fudge = 1;
int w = (int)(817 * fudge);
int h = (int)(1059 * fudge) ;

void setup() {
  //it seems we have to hard code our values here 653, 847
  windowResize(817, 1059);
  windowResizable(true);
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
  audio = loadImage(path + "/audio.gif");
  mixer = loadImage(path + "/yamaha.jpg");
  arionFront = loadImage(path + "/AudioMatrixFront.jpeg");
  arionBack = loadImage(path + "/AudioMatrix.jpeg");
  max1 = loadImage(path + "/max1.png");
  max2 = loadImage(path + "/max2.png");
}

void windowResized() {
  println(width, height);
  fudge = (float)width/817;
  println(fudge);
  w = (int)(817 * fudge);
  h = (int)(1059 * fudge) ;
}

void draw() {
  
  background(255);
  image(midi, 0, 0, w, h);
  
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

  //only show the max images if the mac is showing
  if(macIsShowing && showMax1 % 2 == 1)
    image(max1, 50 * fudge, 200 * fudge, max1.width * .6 * fudge, max1.height * .6 * fudge);
  
  if(showMax2 % 2 == 1)
    image(max2, 400 * fudge, 200 * fudge, max1.width * .6 * fudge, max1.height * .6 * fudge);
  
  //This image will allow the max images to display, click to the immediate left of right of the Mac box
  if(macIsShowing && showMac % 2 == 1)
  {
    image(mac, 270 * fudge, 600 * fudge, mac.width * .1 * fudge, mac.height * .1 * fudge);
    macIsShowing = true;
  }
  else
  {
     macIsShowing = false; 
  }
    
  if(showSampler % 2 == 1)
    image(sampler, 400 * fudge, 410 * fudge, sampler.width * .1 * fudge, sampler.height * .1 * fudge);
  
  //no image for this so show a ?
  if(showMatrix % 2 == 1)
  {
    fill(0);
    textSize(160);
    text("?", 600 * fudge, 540 * fudge);
  }
  
  if(showAtariMega % 2 == 1)
    image(atariMega, 410 * fudge, 600 * fudge, atariMega.width * .25 * fudge, atariMega.height * .25 * fudge);
    
  if(showReverb % 2 == 1)
    image(reverb, 400 * fudge, 620 * fudge, reverb.width * .5 * fudge, reverb.height * .5 * fudge);
  
  //change our color of the X on the audio slide (which closes the slide)
  if(mouseX > 50 * fudge && mouseX < 75 && audioIsShowing)
  {
    xColor = 50;
  }
  else
  {
    xColor = 0;  
  }
  
  //show our audio slide and associated images
  if(showAudio % 2 == 1)
  {
    image(audio, 0, 0, w, h);
    audioIsShowing = true;
    fill(xColor);
    textSize(24);
    text("X", 50, 50);
  }
  else
  {
    audioIsShowing = false;
  }
  
  if(audioIsShowing && showMixer % 2 == 1)
    image(mixer, 235 * fudge, 600 * fudge,  mixer.width * .4 * fudge, mixer.height * .4 * fudge);
  
  if(audioIsShowing && showArionFront % 2 == 1)
    image(arionFront, 25 * fudge, 400 * fudge, arionFront.width * .3 * fudge, arionFront.height * .3 * fudge);
    
  if(audioIsShowing && showArionBack % 2 == 1)
    image(arionBack, 475 * fudge, 400 * fudge, arionBack.width * .3 * fudge, arionBack.height * .3 * fudge);
    
  
  fill(0);
  textSize(12);
  text(mouseX + " | " + mouseY, mouseX + 5, mouseY + 5); 
}

void mousePressed() {
  
  //X for Audio slide
  if(mouseX > 50 * fudge && mouseX < 75 && audioIsShowing)
  {
    println("close audio");
    showAudio++;
  }
  
  //first colum
  if(mouseX > 50 * fudge && mouseX < 140 * fudge)
  {
    if(mouseY > 720 * fudge && mouseY < 770 * fudge)
    {
      println("DX7");
      showDX7++;
    }
  }
  
  //second colum k&k
  if(mouseX > 135 * fudge && mouseX < 400 * fudge)
  {
     if(mouseY > 370 * fudge && mouseY < 410 * fudge)
     {
       println("K&K");
       showKK++;
     }
  }
  
  //Third colum
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
  
  //fourth colum Opcode and Mac
  if(mouseX > 270 * fudge && mouseX < 440 * fudge)
  {
    //opcode
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
  //max images
  if(mouseY > 945 * fudge && mouseY < 1020 * fudge && macIsShowing)
  {
    //show max images
      if(mouseX > 50 * fudge && mouseX < 270 * fudge)
      {
        println("max1");
        showMax1++;
      }
      if(mouseX > 440 * fudge && mouseX < 800 * fudge)
      {
        println("max2");
        showMax2++;
      }
  }
  
  //fifth colum atari
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
     
    if(mouseY > 500 * fudge && mouseY < 550 * fudge)
    {
       println("matrixe 360"); 
       showMatrix++;
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
    //audio slide
    if(mouseY > 610 * fudge && mouseY < 655 * fudge)
    {
      println("audio");
      showAudio++;
    }
  }
  
  //Audio layer
  if(mouseX > 235 * fudge && mouseX < 555 * fudge && audioIsShowing)
  {
    //show mixer
    if(mouseY > 725 * fudge && mouseY < 805 * fudge)
    {
      showMixer++;
    }
    
    //show our Arion hardware
    if(mouseY > 530 * fudge && mouseY < 615 * fudge)
    {
       if(mouseX > 275 * fudge && mouseX <  385 * fudge)
       {
         println("Arion Front");
         showArionFront++;
       }
       if(mouseX > 385 * fudge && mouseX <  540 * fudge)
       {
         println("Arion Back");
         showArionBack++;
       }
    }
    
  }
  
}
