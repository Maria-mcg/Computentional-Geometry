

class Edge{
  
   Point p0,p1;
   AABB aabb;
   
   Edge(Point _p0, Point _p1 ){
     p0 = _p0;
     p1 = _p1;
     // TODO: Initialize AABB
     // aabb = new AABB( ... );
   }
   
   void draw(){
     line( p0.p.x, p0.p.y, 
           p1.p.x, p1.p.y );
   }
   
   AABB getAABB(){
     return aabb;
   }
   
   boolean intersectionTest( Edge other ){
     PVector v1 = PVector.sub( other.p0.p, p0.p );
     PVector v2 = PVector.sub( p1.p, p0.p );
     PVector v3 = PVector.sub( other.p1.p, p0.p );
     
     float z1 = v1.cross(v2).z;
     float z2 = v2.cross(v3).z;
     
     if( (z1*z2)<0 ) return false;  

     PVector v4 = PVector.sub( p0.p, other.p0.p );
     PVector v5 = PVector.sub( other.p1.p, other.p0.p );
     PVector v6 = PVector.sub( p1.p, other.p0.p );

     float z3 = v4.cross(v5).z;
     float z4 = v5.cross(v6).z;
     
     if( (z3*z4<0) ) return false;  
     
     return true;  
   }
   
   Point intersectionPoint( Edge other ){
     // TODO: Implement A Method To Find The Edge Intersection Point.
     // Should return the intersection point or null, if no intersection exists.
     // Care should be taken to make the implementation CORRECT. Speed doesn't matter.
     /*
    
     //System.out.println("dsfsdf"); 
      //slope formula 
      /*
      m= (y2-y1) / (x2-x1)
      b= m*x1 - y1
      
      b1 + m1*x = b2 + m2*x
      m1*x - m2*x = b2 - b1
      (m1 - m2)*x = b2 - b1
      x= (b2 - b1) / (m1 - m2)
     */
     
      //p2
   if( intersectionTest(other)){
     float x1 = p0.p.x;
     float y1 = p0.p.y;
     
     float x2  = p1.p.x;
     float y2  = p1.p.y;
     float x3 = other.p0.p.x;
     float y3 = other.p0.p.y;
     float x4  = other.p1.p.x;
     float y4  = other.p1.p.y;
    
     float a= (x4-x3);
     float b=(y1-y3);
     float c= (y4-y3);
     float d= (x1-x3);
     
     float int1= (a*b) - (c*d);
     
     float e= x2-x1;
     float f= y2-y1;
     
     float int1_= (c*e) - (a*f);
    //result 1
     float Fint1= int1 / int1_; 
     
     
     float g= x1-x3;
     
     float int2= (e*b) - (f*g);
     float int2_= (c*e) - (a*f);
     float Fint2= int2 / int2_;
     

      float pointofinterception_X= x1 + (Fint1 * (x2-x1));
      
      float pointofinterception_Y = y1 + (Fint1 * (y2-y1));
      //creating a new point
      Point intePoint= new Point (pointofinterception_X,pointofinterception_Y); 
    //checking intervals
    if(Fint1 >= 0 && Fint1 <= 1 && Fint2 >= 0 && Fint2 <= 1){
      return intePoint;}
     return null;     
     
    
   }
    return null; 
   }
   
   Point optimizedIntersectionPoint( Edge other ){
     // TODO: Implement A Faster Method To Find The Edge Intersection Point.
     // Should return the intersection point or null, if no intersection exists.
     // The result should be correct, but SPEED MATTERS.
     
     
     float x1 = p0.p.x;
     float y1 = p0.p.y;
     
     float x2  = p1.p.x;
     float y2  = p1.p.y;
     float x3 = other.p0.p.x;
     float y3 = other.p0.p.y;
     float x4  = other.p1.p.x;
     float y4  = other.p1.p.y;
    
     float a= (x4-x3);
     float b=(y1-y3);
     float c= (y4-y3);
     float d= (x1-x3);
     
     float int1= (a*b) - (c*d);
     
     float e= x2-x1;
     float f= y2-y1;
     
     float int1_= (c*e) - (a*f);
    //result 1
     float Fint1= int1 / int1_; 
     
     
     float g= x1-x3;
     
     float int2= (e*b) - (f*g);
     float int2_= (c*e) - (a*f);
     float Fint2= int2 / int2_;
     

      float pointofinterception_X= x1 + (Fint1 * (x2-x1));
      
      float pointofinterception_Y = y1 + (Fint1 * (y2-y1));
      //creating a new point
      Point intePoint= new Point (pointofinterception_X,pointofinterception_Y); 
    //checking intervals
    if(Fint1 >= 0 && Fint1 <= 1 && Fint2 >= 0 && Fint2 <= 1){
      return intePoint;}
     return null;  
     }
}
