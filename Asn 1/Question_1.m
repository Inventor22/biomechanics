
format compact
syms Fdelta;

weight = 77; % kg
height = 190; % cm

armLength = (0.818 - 0.377)*height
armCOM = 0.53 * armLength
armSegmentWeight = 0.05*weight

armAngle = 30 % degrees

armMomentAngle = 90-armAngle
armCOMtoFdeltAngle = 7.5

paperToBodyRatio = 3

% sum of moments to solve for fDelta;
syms Fdelt;

jointToFdeltLength = 7.5/10*paperToBodyRatio % cm

moments = (0 == Fdelt*jointToFdeltLength -...
            armSegmentWeight*cos(degtorad(armMomentAngle))*armCOM)
Fdelt = double(solve(moments))

Fjy = armSegmentWeight - Fdelt*cos(degtorad(armAngle - armCOMtoFdeltAngle))
Fjx = -Fdelt*sin(degtorad(armAngle - armCOMtoFdeltAngle))

angle = radtodeg(atan2(Fjy, Fjx));
if (angle < 0)
    angle = 360 + angle;
end
angle