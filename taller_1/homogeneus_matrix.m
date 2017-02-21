function [ r, p ] = homogeneus_matrix( DH, q )
%HOMOGENEUS_MATRIX Summary of this function goes here
%   Detailed explanation goes here
    if DH(1,5) == 0 %rotatinal joint
        theta = q;
        d = DH(1,2);
        a = DH(1,3);
        alpha = DH(1,4);
        
        p = [a*cos(theta) ; a*sin(theta) ; d];
        r=[ cos(theta), -cos(alpha)*sin(theta), sin(alpha)*sin(theta);
            sin(theta), cos(alpha)*cos(theta), -sin(alpha)*cos(theta);
            0         , sin(alpha)          ,   cos(alpha)];
        
    else %prismatic Joint
        theta = DH(1,1);
        d = q;
        a = DH(1,3);
        alpha = DH(1,4);
        p = [0; 0; d];
        r = [ cos(theta), -cos(alpha)*sin(theta), sin(alpha)*sin(theta);
              sin(theta), cos(alpha)*cos(theta), -sin(alpha)*cos(theta);
              0         , sin(alpha)           , cos(alpha)];
    end

end

