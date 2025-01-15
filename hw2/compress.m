im=imread('wpeppers.jpg');

[CR,BPP] = wcompress('c',im,'wpeppers.wtc','spiht','maxloop',12);
imc = wcompress('u','wpeppers.wtc');

tiledlayout('flow');
nexttile;
imshow(im);
title('Original Image')
nexttile;
imshow(imc);
title('Compressed Image - 12 steps')
xlabel({['Compression Ratio: ' num2str(CR,'%1.2f %%')], ...
        ['BPP: ' num2str(BPP,'%3.2f')]});