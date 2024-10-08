float[] tempos; 
int nMax = 50; // Quantidade de medições a serem realizadas

void setup() {
  size(800, 600);
  tempos = new float[nMax];
  thread("medir");
}

void draw() {
  background(220);
  int l = width / nMax;
  for (int n = 0; n < nMax; n++) {
    int h = int(tempos[n]*100);
    fill(100, 100, 250);
    rect(n * l, height - h, l, h);
    fill(0);
    textAlign(CENTER);
    text(str(n), n * l, height - h - 10, l, h);
    //print(str(tempos[n])+",");
    
    if(int(mouseX/l) == n && mouseY > height - h)
      text(str(tempos[n]), width/2, height/2);
  }
  
}

void medir() {
  for (int n = 0; n < nMax; n++) {
    long inicio = millis();
    
    fib2(n);
    
    long fim = millis(); 
    tempos[n] = (fim - inicio)/1000.0;
  }

}


void O1(int n) {
  delay(100);
}

void Ologn(int n){
  for(int i = n; i >= 1; i /= 2) delay(100);
}

void Onlogn(int n){
  for(int k = 0; k < n; k++)
    for(int i = n; i >= 1; i /= 2) 
      delay(10);
}

void On(int n){
  for(int i = 0; i < n; i++) delay(100);
}

void On2(int n){
  for(int i = 0; i < n; i++) 
    for(int j = 0; j < n; j++)
      delay(1);
}

void On3(int n){
  for(int i = 0; i < n; i++) 
    for(int j = 0; j < n; j++)
      for(int k = 0; k < n; k++)
        delay(1);
}

int fib(int n){
   if(n < 2) return 1;
   return fib(n-1)+fib(n-2);
}

int fib2(int n){
   if(n < 2) return 1;
   
   int[] f = new int[n];
   f[0] = 1;
   f[1] = 1;
   for(int i = 2; i < n; i++){
     f[i] = f[i-1]+f[i-2];
     delay(100);
   }
   
   return f[n-1] + f[n-2];
}
  
