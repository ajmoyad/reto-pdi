% Archivo de demostraci�n de las transformaciones para las im�genes
% biom�dicas, en el marco de la actividad 'Reto 1' de la asignatura
% 'Procesamiento Digital de Im�genes'

%% Notas de implementaci�n
% La transformaci�n dada se encuentra en el archivo biom.m y se ejecuta con
% el comando biom.
% La transformaci�n propuesta se encuentra en el archivo reto1.m y se
% ejecuta con el comando reto1.

% Para m�s informaci�n de ambos, consulte el propio archivo .m adjunto o
% ejecute help seguido de la funci�n en la l�nea de comandos de Matlab.



%% Demo 1 Comparativa subjetiva de resultados
clear, clc, close all

% Comparativa general de todas las im�genes mejoradas con cada una de las
% transformaciones
%   Notar que para todas ellas se ha usado un lambda igual 1, en el caso de
%   la transformaci�n dada, y se ha dejado el valor de alfa por defecto en
%   la transformaci�n propuesta.


I1=imread('imagenes_fondos/imagen1.pgm');
F1=imread('imagenes_fondos/fondo1.pgm');

R11=biom(double(I1),double(F1),1);
R12=reto1(I1,F1);

figure(1)
subplot(1,2,1),imshow(uint8(R11)),title('Transformaci�n dada');
subplot(1,2,2),imshow(R12),title('Transformaci�n propia');

pause

I2=imread('imagenes_fondos/imagen2.pgm');
F2=imread('imagenes_fondos/fondo2.pgm');

R21=biom(double(I2),double(F2),1);
R22=reto1(I2,F2);

figure(1)
subplot(1,2,1),imshow(uint8(R21)),title('Transformaci�n dada');
subplot(1,2,2),imshow(R22),title('Transformaci�n propia');

pause

I3=imread('imagenes_fondos/imagen3.pgm');
F3=imread('imagenes_fondos/fondo3.pgm');

R31=biom(double(I3),double(F3),1);
R32=reto1(I3,F3);

figure(1)
subplot(1,2,1),imshow(uint8(R31)),title('Transformaci�n dada');
subplot(1,2,2),imshow(R32),title('Transformaci�n propia');

pause

I4=imread('imagenes_fondos/imagen4.pgm');
F4=imread('imagenes_fondos/fondo4.pgm');

R41=biom(double(I4),double(F4),1);
R42=reto1(I4,F4);

figure(1)
subplot(1,2,1),imshow(uint8(R41)),title('Transformaci�n dada');
subplot(1,2,2),imshow(R42),title('Transformaci�n propia');

pause

I5=imread('imagenes_fondos/imagen5.pgm');
F5=imread('imagenes_fondos/fondo5.pgm');

R51=biom(double(I5),double(F5),1);
R52=reto1(I5,F5);

figure(1)
subplot(1,2,1),imshow(uint8(R51)),title('Transformaci�n dada');
subplot(1,2,2),imshow(R52),title('Transformaci�n propia');

%% Demo 2 Comparativa de evoluci�n del fondo seg�n el par�metro

% Breve comparativa para mostrar el efecto que la variaci�n del par�metro
% de ambas funciones produce en la imagen resultado.

I5=imread('imagenes_fondos/imagen5.pgm');
F5=imread('imagenes_fondos/fondo5.pgm');

A1=biom(double(I5),double(F5),0);
A2=biom(double(I5),double(F5),0.5);
A3=biom(double(I5),double(F5),1);

B1=reto1(I5,F5,0);
B2=reto1(I5,F5,0.5);
B3=reto1(I5,F5,1);

figure(1)
subplot(3,2,1),imshow(uint8(A1)),xlabel('Transformaci�n dada para \lambda=0');
subplot(3,2,2),imshow(uint8(B1)),xlabel('Transformaci�n propia para \alpha=0');
subplot(3,2,3),imshow(uint8(A2)),xlabel('Transformaci�n dada para \lambda=0.5');
subplot(3,2,4),imshow(uint8(B2)),xlabel('Transformaci�n propia para \alpha=0.5');
subplot(3,2,5),imshow(uint8(A3)),xlabel('Transformaci�n dada para \lambda=1');
subplot(3,2,6),imshow(uint8(B3)),xlabel('Transformaci�n propia para \alpha=1');


%% Demo 3 Comparativa de eficiencia.
clear, clc

% Breve comparativa que estima el tiempo de ejecuci�n de cada una de las
% dos funciones.

% Se ha planteado como una bater�a de 1e4 simulaciones sucesivas y se han
% calculado los tiempos con las funciones tic y toc, que son las que
% aconseja matlab para hacer c�lculos de eficiencia.

I=imread('imagenes_fondos/imagen5.pgm');
F=imread('imagenes_fondos/fondo5.pgm');

% Preasignaci�n de memoria para los tiempos
t1=zeros(1e4,1);
t2=t1;

for i=1:1e4

    tn1=tic;
    A1=biom(double(I),double(F),0);
    t1(i)=toc(tn1);

    tn2=tic;
    B=reto1(I,F,0);
    t2(i)=toc(tn2);
      
end

% Muestra de los resultados promediados para cada algoritmo
fprintf('Transformaci�n dada:\n  tiempo ejecuci�n %.5f segundos\n',mean(t1));
fprintf('Transformaci�n propia:\n  tiempo ejecuci�n %.5f segundos\n',mean(t2));