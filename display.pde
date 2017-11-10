void displayPts(){
  stroke(0);
  for(int i=0;i<global_ptList.size(); i++){
    pt P=global_ptList.get(i);
    //text(""+P.x+","+P.y,P.x,P.y);      
    stroke(100,100,100);
    ellipse(P.x,P.y,15,15);
    stroke(0,0,0);
    fill(0);
    ellipse(P.x,P.y,5,5);
    noFill();
  }
  fill(0);
  text("Press d to display departments",20,20);
  text("Press v to display circulation",20,40);
  text("num of points: "+global_ptList.size(),20,60);  
  text("num of triangles: "+global_tri_ptList.size(),20,80);
  noFill();
}


void displayDtriangulation(){
  background(255);
  stroke(0,0,0);
  strokeWeight(1);
  for(int i=0; i<global_tri_ptList.size(); i++){
    pt p=global_tri_ptList.get(i)[0]; pt q=global_tri_ptList.get(i)[1]; pt r=global_tri_ptList.get(i)[2]; 
    pt o=CircumCenter(p,q,r);
    float di=d(p,o)*2;
    noFill();
    int re=int(random(255));
    int gr=int(random(255));
    int bl=int(random(255));
    fill(re,gr,bl,25);
    //ellipse(o.x,o.y,di,di);
    beginShape();
    vertex(p.x,p.y);
    vertex(q.x,q.y);
    vertex(r.x,r.y); 
    endShape(CLOSE); 
    
  }
  displayPts();
}


void displayCells(ArrayList<pt[]> li){
  for(int i=0; i<li.size(); i++){
    pt[] ptarr=li.get(i);
    PShape s=createShape();
    stroke(0);
    strokeWeight(1);
    fill(255);
    s.beginShape();
    for(int j=0; j<ptarr.length; j++){
      pt p=ptarr[j];
      vertex(p.x,p.y);
    }    
    stroke(0);
    strokeWeight(1);
    shape(s);
    s.endShape();
    noFill();
  }
}