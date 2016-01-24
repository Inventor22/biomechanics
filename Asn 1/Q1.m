
% weight, height, armAngle,armCOMtoFdeltAngle)

for abductionAngle = [30 60 90 120]
    disp(['Forces for abduction angle of ' num2str(abductionAngle) ' degrees']);
    % weight, height, armAngle,armCOMtoFdeltAngle, FdeltDistToJoint
    ShoulderForces(77, 190, abductionAngle, 7.5, 7.5);
    disp(' ');
end