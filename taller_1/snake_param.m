
%Esta funcion contiene los par?metros cinem?ticos y din?micos de un robot
%tipo serpiente de 12 grados de libertad

%Copyright: Julian Colorado.


function [SNAKE, PARAM] = snake_param()% snake es una estructura de datos con
%la estructura morfologica (dh, etc). 

%matriz de par?metros LINK:

%-Contiene la matriz DH con sus 4 par?metros geom?tricos: alpha[rad],a[m],theta[rad],d[m].
%sigma=0 (articulaci?n Rotacional), Sigma=1 (articulaci?n prism?tica)

%Link permite ensamblar la cadena articulada
%se define para cada grado de libertad

 %LINK     theta  d     a       alpha  sigma
  L1=Link([  0     0     0        0     0  ],'standard');
  L2=Link([  0     0     0.18    0       0  ],'standard');%standard significa que es DH estandar
  L3=Link([  0     0     0.18    0       0  ],'standard');
  L4=Link([  0     0     0.18    0       0  ],'standard');
  L5=Link([  0     0     0.18    0       0  ],'standard');
  L6=Link([  0     0     0.18    0       0  ],'standard');
  L7=Link([  0     0     0.18    0       0  ],'standard');
  L8=Link([  0     0     0.18    0       0  ],'standard');
  L9=Link([  0     0     0.18    0       0  ],'standard');
  L10=Link([  0     0    0.18    0       0  ],'standard');
  L11=Link([  0     0    0.18    0       0  ],'standard');
  L12=Link([  0     0    0.18    0       0  ],'standard');

  

 %Ensamble del robot PUMA usando la funcion robot() del toolbox de robotica
 %de Peter Corke

 SNAKE = SerialLink([L1 L2 L3 L4 L5 L6 L7 L8 L9 L10 L11 L12]);% L1 es la cola y L12 la cabeza
 SNAKE.name='SNAKE';
 
 %Matriz de parametros dinamico del robot (para el calculo dinamico)
 
%-Contiene la masa puntual de cada cuerpo r?gido m[Kg] 

%-Contiene el vector de posici?n si_cm = [sx sy sz], el cual relaciona el
%sist. de coordenadas de la articulaci?n al centro de masa (cm) del cuerpo r?gido.

%-Contiene los momentos de inercial de cada cuerpo r?gido [Ixx Iyy Izz].
%NOTA: los productos son cero.
 
        %M    Sx      Sy     Sz     Ixx      Iyy        Izz
 PARAM=[ 1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3;
       1.4  0.075    0     0.05  2.6285e-3  2.5949e-3  1.7501e-3];   
     
%filas son cada cuerpo. M masa puntual, S del centro de coord al CM, Ixx etc. son los momentos de inercia.     
 %Visualizacion del robot.
 q = [0 0 0 0 0 0 0 0 0 0 0 0];        %postura de cada articulaci?n [rad]
 %SNAKE.plot(q);
 %SNAKE.teach(q);         %GUI para manejar cada articulacion              
 
end
    