String result = "";
int[][] linepos = new int[3][2];
float xdelim=0;
float ydelim=0;

int cipher;

class Pot {
    float x=0;
    float y=0;
    public Pot(float nx,float ny){
        x=nx;
        y=ny;
    }
    void printall(){ 
        println(x+" "+y); 
    }
}
Pot[][] pList = new Pot[3][3];

float xh,yh;
ArrayList<Pot> resultList = new ArrayList();
void settings() {
    size(600,600);
}

void setup(){
    cipher=day()*31+month()*12+year()+hour()*24+minute()*60;
    println(cipher);
    smooth();
    ellipseMode(CENTER);
    xdelim=(590-10)/3.0;
    ydelim=(590-40)/3.0;
    xh = xdelim/2;
    yh = ydelim/2;
    
    
    for(int i=0;i<pList.length;i++){
        for(int j=0;j<pList[i].length;j++){
                pList[i][j]=new Pot(10+(j+j+1)*xh,40+(i+i+1)*yh);  
        }
    }
    
    printall();
}

// 0,0 0,1 0,2
// 1,0 1,1 1,2
// 2,0 2,1 2,2


void draw(){
    background(255);
    fill(50);
    textSize(30);
    text(result,5,30);
    init();
    resultList = new ArrayList();
    for(int i=0;i<result.length();i++){
        int num = (int)result.charAt(i)+i+9;
//        int num = (int)result.charAt(i)+i+9+cipher;
        num=num%9;
        int nx = num%3;
        int ny = floor(num/3);
        resultList.add(pList[nx][ny]);
    }
    if (resultList.size()>0) {
        Pot lasttemp = resultList.get(0);
        for (int i = 1;i<resultList.size();i++) {
            Pot temp = resultList.get(i);
            fromto(lasttemp,temp);
            lasttemp=temp;
        }
    }
//    println(resultList.size());
}

void fromto(Pot a,Pot b){
    strokeWeight(5.0);
    
    line(a.x,a.y,b.x,b.y);
}



void init(){
    stroke(0);
    strokeWeight(3.0);
    strokeCap(ROUND);
    line(10,40,590,40);
    line(590,40,590,590);
    line(590,590,10,590);
    line(10,590,10,40);
     for (int i = 0;i<linepos.length;i++ ) {
        linepos[i][0]=10+(int)(i*xdelim);
        linepos[i][1]=40;
//        ellipse(linepos[i][0],linepos[i][1],5,5);    
        line(linepos[i][0],40,linepos[i][0],590);
    }
    for (int i = 0;i<linepos.length;i++ ) {
        linepos[i][1]=40+(int)(i*ydelim);
        linepos[i][0]=10;
//        ellipse(linepos[i][0],linepos[i][1],5,5);    
        line(10,linepos[i][1],590,linepos[i][1]);
    }
    
//    test();

  
    
}
void keyPressed(){
    if (key=='\b'){
        if(result.length()>=1){
            result= result.substring(0,result.length()-1); 
        }
    }else if (key==CODED){
        if(keyCode==SHIFT){
            
        }
    }    
    else{
        if(result.length()>30){
            result = result.substring(1,result.length()-1);
        }
	   result +=key;
    }
//    print(key);
}
void listprint(ArrayList<Pot> a){
    for(Pot x:a){
        println(x.x+" "+x.y);
    }
    
}

void printall(){
    println("xdelim: "+xdelim+" ydelim: "+ydelim);
    println("xh: "+xh+" yh: "+yh);
    for (int i = 0;i<pList.length;i++ ) {
        for (int j =0 ;j<pList[i].length;j++){
            println(i+" "+j+":");
            pList[i][j].printall();
        }
    }
    println();
}


void  test(){
    for (int i = 0;i<pList.length;i++ ) {
        for (int j =0 ;j<pList[i].length;j++){
            Pot temp = pList[i][j];
//            println("Draw O at: "+temp.x+"@"+temp.y);
            ellipse(temp.x,temp.y,5,5);
        }
    }
    textSize(10);
    text("Current: "+mouseX+" "+mouseY,300,300);
}