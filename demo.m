% Archivo de demostración de las transformaciones para las imágenes
% biomédicas, en el marco de la actividad 'Reto 1' de la asignatura
% 'Procesamiento Digital de Imágenes'

%% Notas de implementación
% La transformación dada se encuentra en el archivo biom.m y se ejecuta con
% el comando biom.
% La transformación propuesta se encuentra en el archivo reto1.m y se
% ejecuta con el comando reto1.

% Para más información de ambos, consulte el propio archivo .m adjunto o
% ejecute help seguido de la función en la línea de comandos de Matlab.



%% Demo 1 Comparativa subjetiva de resultados
clear, clc, close all

% Comparativa general de todas las imágenes mejoradas con cada una de las
% transformaciones
%   Notar que para todas ellas se ha usado un lambda igual 1, en el caso de
%   la transformación dada, y se ha dejado el valor de alfa por defecto en
%   la transformación propuesta.


I1=imread('imagenes_fondos/imagen1.pgm');
F1=imread('imagenes_fondos/fondo1.pgm');

R11=biom(double(I1),double(F1),1);
R12=reto1(I1,F1);

figure(1)
subplot(1,2,1),imshow(uint8(R11)),title('Transformación dada');
subplot(1,2,2),imshow(R12),title('Transformación propia');

pause

I2=imread('imagenes_fondos/imagen2.pgm');
F2=imread('imagenes_fondos/fondo2.pgm');

R21=biom(double(I2),double(F2),1);
R22=reto1(I2,F2);

figure(1)
subplot(1,2,1),imshow(uint8(R21)),title('Transformación dada');
subplot(1,2,2),imshow(R22),title('Transformación propia');

pause

I3=imread('imagenes_fondos/imagen3.pgm');
F3=imread('imagenes_fondos/fondo3.pgm');

R31=biom(double(I3),double(F3),1);
R32=reto1(I3,F3);

figure(1)
subplot(1,2,1),imshow(uint8(R31)),title('Transformación dada');
subplot(1,2,2),imshow(R32),title('Transformación propia');

pause

I4=imread('imagenes_fondos/imagen4.pgm');
F4=imread('imagenes_fondos/fondo4.pgm');

R41=biom(double(I4),double(F4),1);
R42=reto1(I4,F4);

figure(1)
subplot(1,2,1),imshow(uint8(R41)),title('Transformación dada');
subplot(1,2,2),imshow(R42),title('Transformación propia');

pause

I5=imread('imagenes_fondos/imagen5.pgm');
F5=imread('imagenes_fondos/fondo5.pgm');

R51=biom(double(I5),double(F5),1);
R52=reto1(I5,F5);

figure(1)
subplot(1,2,1),imshow(uint8(R51)),title('Transformación dada');
subplot(1,2,2),imshow(R52),title('Transformación propia');

%% Demo 2 Comparativa de evolución del fondo según el parámetro

% Breve comparativa para mostrar el efecto que la variación del parámetro
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
subplot(3,2,1),imshow(uint8(A1)),xlabel('Transformación dada para \lambda=0');
subplot(3,2,2),imshow(uint8(B1)),xlabel('Transformación propia para \alpha=0');
subplot(3,2,3),imshow(uint8(A2)),xlabel('Transformación dada para \lambda=0.5');
subplot(3,2,4),imshow(uint8(B2)),xlabel('Transformación propia para \alpha=0.5');
subplot(3,2,5),imshow(uint8(A3)),xlabel('Transformación dada para \lambda=1');
subplot(3,2,6),imshow(uint8(B3)),xlabel('Transformación propia para \alpha=1');


%% Demo 3 Comparativa de eficiencia.
clear, clc

% Breve comparativa que estima el tiempo de ejecución de cada una de las
% dos funciones.

% Se ha planteado como una batería de 1e4 simulaciones sucesivas y se han
% calculado los tiempos con las funciones tic y toc, que son las que
% aconseja matlab para hacer cálculos de eficiencia.

I=imread('imagenes_fondos/imagen5.pgm');
F=imread('imagenes_fondos/fondo5.pgm');

% Preasignación de memoria para los tiempos
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
fprintf('Transformación dada:\n  tiempo ejecución %.5f segundos\n',mean(t1));
fprintf('Transformación propia:\n  tiempo ejecución %.5f segundos\n',mean(t2));