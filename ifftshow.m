function [ ] = ifftshow(f)

f1=abs(f);
fm=max(f1(:));
e=f1/fm;

figure, imshow (e);

end