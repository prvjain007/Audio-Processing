

%     H = padarray(0.8,[1 1]) - fspecial('prewitt' ); % create unsharp mask
% eH = fspecial('unsharp');
% %eH = padarray(1,[2 2]) - fspecial('gaussian' ,[5 5],10); % create unsharp mask
% 
% sharpened = imfilter(thisFrame,H);  % create a sharpened version of the image using that mask
% 
% %sharpened = imfilter(image,eH);  % create a sharpened version of the image using that mask
% Background=imadd(0.2*thisFrame, sharpened);
