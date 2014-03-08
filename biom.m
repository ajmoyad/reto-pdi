function R=biom(imagen, fondo, lambda)
%BIOM Implementación propuesta para la transformación de imágenes
%biomédicas dada por el profesor para la asignatura Procesado Digital de
%Imágenes de la Universidad de Granda.
%
%   R=biom(IMAGEN, FONDO, LAMBDA) calcula la imagen transformada según el
%   parámetro lambda. IMAGEN y FONDO deben ser 2 imágenes representadas
%   como matriz de tipo double. R es el resultado de la transformación,
%   también en tipo double.
%
%   Antonio José Moya Díaz
%       9 de mayo de 2012    
    
    R=255*min(lambda*(imagen./fondo),1);
    

end