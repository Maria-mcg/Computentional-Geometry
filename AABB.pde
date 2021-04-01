
// Class to hold an Axis Aligned Bounding Box
class AABB {
  Point px, py;
  float minX, maxX;
  float minY, maxY;
 
  
  AABB( float _minX, float _maxX, float _minY, float _maxY ){
    minX = _minX;
    maxX = _maxX;
    minY = _minY;
    maxY = _maxY;
  }
  
  boolean intersectionTest( AABB other ){
    // TODO: Implement A Method To Find The Intersection Between 2 Axis Aligned Bounding Boxes

    return ((min(maxY, other.maxY)- max(minY, other.minY)) >= 0) && ((min (maxX, other.maxX)- max(minX, other.minX)) >= 0); 
    //return true;
  }
  
}
