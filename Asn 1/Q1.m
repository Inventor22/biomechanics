
for massHeld = [0 20]
    for abductionAngle = [30 60 90 120]
        disp(['Forces for abduction angle of ' num2str(abductionAngle) ' degrees']);
        % weight, height, massHeld, armAngle, armCOMtoFdeltAngle, FdeltDistToJoint
        ShoulderForces(77, 190, massHeld, abductionAngle, 7.5, 7.5);
        disp(' ');
    end
end