function [mejorada] = reto1(imagen, fondo, ajuste)
%RETO1 Solución planteada para la mejora de imágenes biomédicas tomadas con
%microscopio. Solución planteada en el marco de la asignatura "Procesado
%Digital de Imágenes" de la Universidad de Granada
%
%   reto1(IMAGEN, FONDO) calcula la imagen mejorada y la muestra mediante
%   el uso de la función imshow. IMAGEN y FONDO deben ser imágenes en uint8
%
%   reto1(IMAGEN, FONDO, AJUSTE) la función intenta realizar un cálculo
%   óptimo para la mayoría de las fotografías, sin embargo, esto puede no
%   ser así. La mejora puede ser controlada parcialmente añadiendo un valor
%   de ajuste que debe estar entre 0 y 1.
%
%   M=reto(IMAGEN, FONDO) calcula la imagen y la devuelve en forma de
%   matriz.
%
%   Antonio José Moya Díaz
%       9 de mayo de 2012


    % Valor del factor por defecto
    if nargin<3
        ajuste=0.5;
    end

    if ajuste<0 || ajuste>1
        error('Por favor, use un valor tal que 0<=ajuste<=1');
    end
    
    % Se calculan las medias de las dos imágenes
    imedia=mean(imagen(:));
    fmedia=mean(fondo(:));
    
    % Se estima el factor en base a la diferencia entre las medias de las
    % dos imágenes
    factor=10/(fmedia-imedia)+2*ajuste;
    
    % Se restan las dos imágenes, fondo e imagen.
    diff=fondo-imagen;
    % Se fuerza un casting a doble antes de aplicar el facotr
    diff=double(diff)*factor;
    % Se invierte la imagen resultante del proceso anterior
    mejorada=uint8(255-diff);
    
    % Si no se pide que sea devuelta como matriz, se pinta la solución
    if nargout==0
        figure,imshow(mejorada);
    end

end

