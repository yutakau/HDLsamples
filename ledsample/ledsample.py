import math

step=15

deg=0
for d in range(step):
    rad = math.radians(deg)
    deg = deg + 180/step

    s = math.sin(rad)
    #print ( int(s * 256) )
    print ( hex( int(s * 256) ) )
