function [mejorada] = reto1(imagen, fondo, ajuste)
%RETO1 Soluci�n planteada para la mejora de im�genes biom�dicas tomadas con
%microscopio. Soluci�n planteada en el marco de la asignatura "Procesado
%Digital de Im�genes" de la Universidad de Granada
%
%   reto1(IMAGEN, FONDO) calcula la imagen mejorada y la muestra mediante
%   el uso de la funci�n imshow. IMAGEN y FONDO deben ser im�genes en uint8
%
%   reto1(IMAGEN, FONDO, AJUSTE) la funci�n intenta realizar un c�lculo
%   �ptimo para la mayor�a de las fotograf�as, sin embargo, esto puede no
%   ser as�. La mejora puede ser controlada parcialmente a�adiendo un valor
%   de ajuste que debe estar entre 0 y 1.
%
%   M=reto(IMAGEN, FONDO) calcula la imagen y la devuelve en forma de
%   matriz.
%
%   Antonio Jos� Moya D�az
%       9 de mayo de 2012


    % Valor del factor por defecto
    if nargin<3
        ajuste=0.5;
    end

    if ajuste<0 || ajuste>1
        error('Por favor, use un valor tal que 0<=ajuste<=1');
    end
    
    % Se calculan las medias de las dos im�genes
    imedia=mean(imagen(:));
    fmedia=mean(fondo(:));
    
    % Se estima el factor en base a la diferencia entre las medias de las
    % dos im�genes
    factor=10/(fmedia-imedia)+2*ajuste;
    
    % Se restan las dos im�genes, fondo e imagen.
    diff=fondo-imagen;
    % Se fuerza un casting a doble antes de aplicar el facotr
    diff=double(diff)*factor;
    % Se invierte la imagen resultante del proceso anterior
    mejorada=uint8(255-diff);
    
    % Si no se pide que sea devuelta como matriz, se pinta la soluci�n
    if nargout==0
        figure,imshow(mejorada);
    end

end

