function [ skew ] = skew( a )
%SKEW Summary of this function goes here
%   Detailed explanation goes here
skew = [0     -a(3)  a(2);
        a(3)  0      -a(1);
        -a(2) a(1)   0];

end

