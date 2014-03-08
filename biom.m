function R=biom(imagen, fondo, lambda)
%BIOM Implementaci�n propuesta para la transformaci�n de im�genes
%biom�dicas dada por el profesor para la asignatura Procesado Digital de
%Im�genes de la Universidad de Granda.
%
%   R=biom(IMAGEN, FONDO, LAMBDA) calcula la imagen transformada seg�n el
%   par�metro lambda. IMAGEN y FONDO deben ser 2 im�genes representadas
%   como matriz de tipo double. R es el resultado de la transformaci�n,
%   tambi�n en tipo double.
%
%   Antonio Jos� Moya D�az
%       9 de mayo de 2012    
    
    R=255*min(lambda*(imagen./fondo),1);
    

end