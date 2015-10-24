//Helen Zhang, Block 1, Starfield
Particle [] stars = new Particle[100];
void setup(){
	size(400,400);
	noStroke();
	for(int i=0;i<stars.length;i++){
		if(i%25==0){
			stars[i]=new OddballParticle();
		}else if(i==1){
			stars[i]=new JumboParticle();
		}else{
			stars[i]=new NormalParticle();
		}
	}
}
void draw(){
	background(20);
	for(int i=0;i<stars.length;i++){
		stars[i].move();
		stars[i].show();
		stars[i].wrap();
		stars[i].accelerate();
		if(i%25==0){
			((OddballParticle)stars[i]).spin();
		}
		if(i==1){
			((JumboParticle)stars[i]).expand();
		}
	}
}
class NormalParticle implements Particle{
	double x,y,speed,angle,ini,a,w;
	int r,g,b,t;
	NormalParticle(){
		a=.001;
		speed=Math.random()*1+.1;
		angle=Math.random()*360;
		ini=Math.random()*199;
		x=200+cos((float)angle)*ini;
		y=200+sin((float)angle)*ini;
		r=(int)(Math.random()*255)+100;
		g=(int)(Math.random()*255)+100;
		b=(int)(Math.random()*255)+100;
		w=2;

	}
	public void move(){
		x+=cos((float)angle)*speed;
		y+=sin((float)angle)*speed;
	}
	public void show(){
		fill(r,b,g);
		ellipse((float)x,(float)y,(float)w,(float)w);
	}
	public void wrap(){
		if(x<0||x>400||y<0||y>400){
			speed=Math.random()*1+.5;
			x=200;
			y=200;
			a=.001;
			angle=Math.random()*360;
			w=1;
			r=(int)(Math.random()*255)+100;
			g=(int)(Math.random()*255)+100;
			b=(int)(Math.random()*255)+100;
		}
	}
	public void accelerate(){
		speed+=a;
		a*=1.04;
	}
}
interface Particle{
	public void move();
	public void show();
	public void wrap();
	public void accelerate();
}
class OddballParticle implements Particle{
	double x,y,speed,angle,ini,a;
	int r,g,b,t;
	OddballParticle(){
		a=.001;
		speed=Math.random()*1+.1;
		angle=Math.random()*360;
		ini=Math.random()*199;
		x=200+cos((float)angle)*ini;
		y=200+sin((float)angle)*ini;
		r=(int)(Math.random()*255)+100;
		g=(int)(Math.random()*255)+100;
		b=(int)(Math.random()*255)+100;

	}
	public void move(){
		x+=cos((float)angle)*speed;
		y+=sin((float)angle)*speed;
	}
	public void show(){
		fill(r,b,g);
		ellipse((float)x,(float)y,2,2);
	}
	public void wrap(){
		if(x<0||x>400||y<0||y>400){
			speed=Math.random()*1+.5;
			x=200;
			y=200;
			a=.001;

			r=(int)(Math.random()*255)+100;
			g=(int)(Math.random()*255)+100;
			b=(int)(Math.random()*255)+100;
		}
	}
	public void accelerate(){
		speed+=a;
		a*=1.01;
	}
	void spin(){
		angle+=.05;
	}
}
class JumboParticle extends NormalParticle{
	JumboParticle(){
		speed=2;
	}
	public void expand(){
		w+=.1;
	}
}

