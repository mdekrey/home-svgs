
y1=0;
y2=5;
y3=25;
y4=25+11;
y_gable=-3;
x1=0;
x2=20.7;
x3=21.8;
gableExtraWidth=1;
x3_gable=x3-gableExtraWidth;
x4=x3 + 8.4;
x4_gable=x4+gableExtraWidth;
x5=x2+13.5;
x6=x5+16.8;
twoFloorHeight = 18 + 5/12;
peakHeight = twoFloorHeight+((y3-y1)/2 + 1)*6/12;
gableHeight = twoFloorHeight+((x4_gable-x3_gable)/2+1)*10/12;
backRoofHeight = twoFloorHeight+((x5-x2)/2+1)*6/12;

echo([x1,x2,x3,x4,x5,x6]);

// original structure
color("FireBrick")
linear_extrude(height = twoFloorHeight)
polygon(points = [[x1,y1], [x3,y1], [x3,y2], [x4,y2], [x4,y1], [x6,y1], [x6,y3], [x5,y3], [x5,y4], [x2,y4], [x2,y3], [x1,y3]], convexity=10);

color("LightGrey")
polyhedron(
    points = [
        [x1-1,y1-1,twoFloorHeight],
        [x3_gable-1,y1-1,twoFloorHeight],
        [x3_gable-1,y_gable,twoFloorHeight],
        [x4_gable+1,y_gable,twoFloorHeight],
        [x4_gable+1,y1-1,twoFloorHeight],
        [x6+1,y1-1,twoFloorHeight],
        [x6+1,y3+1,twoFloorHeight],
        [x5+1,y3+1,twoFloorHeight],
        [x5+1,y4+1,twoFloorHeight],
        [x2-1,y4+1,twoFloorHeight],
        [x2-1,y3+1,twoFloorHeight],
        /* 11 */ [x1-1,y3+1,twoFloorHeight],

        [x1+(y3-y1)/2,y1+(y3-y1)/2, peakHeight],
        [x6-(y3-y1)/2,y1+(y3-y1)/2, peakHeight],

        [(x3_gable+x4_gable)/2,y_gable, gableHeight],
        [(x3_gable+x4_gable)/2,y1+(y3/2) * (gableHeight-twoFloorHeight)/(peakHeight-twoFloorHeight), gableHeight],

        [(x2+x5)/2,y4, backRoofHeight],
        [(x2+x5)/2,y3-(y3/2) * (backRoofHeight-twoFloorHeight)/(peakHeight-twoFloorHeight), backRoofHeight],
    ],
    faces=[
        [0,1,2,3,4,5,6,7,8,9,10,11],
        [0,11,12],
        [5,6,13],
        [0,1,15,4,5,13,12],
        [6,7,17,10,11, 12,13],

        // gable
        [2,3,14],
        [1,2,14,15],
        [4,3,14,15],

        // back arch
        [7,8,16,17],
        [9,10,17,16],
        [8,9,16],
    ],
    convexity=10
);