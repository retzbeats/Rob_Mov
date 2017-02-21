function [ tau ] = ID(SNAKE, PARAM, q, qd, qdd, grav, Fext)
%ID Summary of this function goes here
%   Detailed explanation goes here

n, pt = size(q);
V = zeros(6, n+1);
dV = zeros (6, n+1);
V(:,1) = zeros(6,1);
dV(:,1) = [0 0 0 grav]';
H = [0 0 1 0 0 0]';
F = zeros(6, n+1);
tau = zeros(n,pt);
for j=1:pt
    for i=1:n
        DH=[SNAKE.theta(i),SNAKE.d(i),SNAKE.a(i), SNAKE.alpha(i),0];
        w_skew_last = skew(V(1:3,i));
        W_skew_last=[w_skew_last, zeros(3,3);
                    zeros(3,3), w_skew_last];
        w_skew_present=skew(V(1:3,i+1));
        W_skew_present=[w_skew_present, zeros(3,3);
                    zeros(3,3), w_skew_present];
                
        [r,p] = homogeneus_matrix(DH,q(i,j));
        R=[r, zeros(3,3);zeros(3,3),r];
        P=[eye(3) skew(p); zeros(3) eye(3)];
        
        
        V(:,i+1) = R'*P*V(:,i)+H*qd(i,j);
        dV(:,i+1) = R'*P*dV(:,i)+ W_skew_last*R'*P*V(:,i)+H*qdd(i,j)*W_skew_present*H*qd(i,j);
    end
    
    for i=n:1
        [r,p] = homogeneus_matrix(DH,q(i,j));
        R=[r, zeros(3,3);zeros(3,3),r];
        P=[eye(3) skew(p); zeros(3) eye(3)];
        J=[PARAM(i,5)  0 0; 0 PARAM(i,6) 0; 0 0 PARAM(i,7)];
        I=[ J zeros(3); zeros(3), eye(3)*PARAM(i,1)];
        s_skew=skew(PARAM(i,2:4))
        S=[eye(3) s_skew; zeros(3) eye(3)];
        w_skew=skew(V(1:3,i));
        W=[w_skew_present, zeros(3,3);
                    zeros(3,3), w_skew_present];    
        
        F(:,i)=P'*R*F(:,i+1) + I*W*V(:,i) +(I*W*S + W*I)*V(:,i);
        tau(i,j) = H'*F(:,i);
    end
    V(:,1) = V(:,2);
    dV(:,1) = dV(:,2) + [0 0 0 grav]';
end

end

