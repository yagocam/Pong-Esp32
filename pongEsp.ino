int pot = 4;
int pot2= 0;
int up = 18;
int down = 19;
int flag = 0;

void setup() {
  Serial.begin(9600);
  pinMode(pot,INPUT);
  pinMode(up,INPUT_PULLUP);
  pinMode(down,INPUT_PULLUP);
  pot2 = map(analogRead(pot),0,4095,49,430);
}

void loop() {
 

  
  if(digitalRead(up) == false){
    Serial.print("1 Sobe \n");
   
    delay(3);
  }
    
  if(digitalRead(down) == false){
    Serial.print("1 Desce \n");
    
    delay(3);
  }
  if(digitalRead(up) == true && digitalRead(down) == true ){
    
    delay(3);
  }
    pot2 = map(analogRead(pot),0,4095,49,430);
  Serial.print("2 ");
  Serial.print(pot2);
  Serial.print("\n");
  delay(3);
}
