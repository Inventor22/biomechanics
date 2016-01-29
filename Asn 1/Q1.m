close all;

im1 = imread('Abduction30.png');
im2 = imread('Abduction60.png');
im3 = imread('Abduction90.png');
im4 = imread('Abduction120.png');

imcenter = [130 107;
            164 129;
            197 84;
            171 88];

abductionAngle = [30 60 90 120];
massHeld = [0 20/9.81];

for i = 1:2
    for j = 1:4
        disp(['Forces for abduction angle of ' num2str(abductionAngle(j)) ' degrees']);
        % weight, height, massHeld, armAngle, armCOMtoFdeltAngle, FdeltDistToJoint
        [Fdelt, Fjx, Fjy, angle] =...
            ShoulderForces(77, 190, massHeld(i), abductionAngle(j), 7.5, 7.5);
        
        figure;
        %subplot(2, 4, j+4*(i-1));
        switch j
            case 1
                imshow(im1); hold;
            case 2
                imshow(im2); hold;
            case 3
                imshow(im3); hold;
            case 4
                imshow(im4); hold;
        end
        
        if (i == 1)
            title('No Mass');
            elsecl
            title('20N Mass');
        end
        
        arrow(imcenter(j, :)-[Fjx Fjy]/norm([Fjx, Fjy])*100, imcenter(j, :),...
            'EdgeColor', 'r', 'FaceColor', 'r');
        text(imcenter(j,1)+10, imcenter(j,2)+10, num2str(norm([Fjx, Fjy])), 'color', 'b');
        
        disp(' ');
    end
end

