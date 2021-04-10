
#  RGB to YCbCr convert matrix
#  HDTV standard.

def matrix_float( r,g,b ):
    y  =  0.183*r + 0.614*g + 0.062*b + 16
    cb = -0.101*r - 0.339*g + 0.439*b + 128
    cr =  0.439*r - 0.399*g - 0.040*b + 128
    return y,cb,cr

def matrix_int8( r,g,b ):
    y  =  (0.183*256)*r + (0.614*256)*g + (0.062*256)*b + (16*256)
    cb =  (-0.101*256)*r - (0.339*256)*g + (0.439*256)*b + (128*256)
    cr =  (0.439*256)*r - (0.399*256)*g - (0.040*256)*b + (128*256)

    y = y/256
    cb = cb/256
    cr = cr/256
    return int(y),int(cb),int(cr)


rf=float(0)
gf=float(255)
bf=float(0)

yf,cbf,crf = matrix_float( rf, gf, bf);
print('{:f},{:f},{:f}'.format(yf, cbf, crf) );


r=0
g=255
b=0
y,cb,cr = matrix_int8( r, g, b);
print('{:d},{:d},{:d}'.format(y, cb, cr) );

