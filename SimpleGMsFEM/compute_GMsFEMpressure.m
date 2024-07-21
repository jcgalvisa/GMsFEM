function downz0G=compute_GMsFEMpressure(A0GMsFEM,b0G,R0GMsFEM,free0G,x0dG)


% coarsetest_OriginalGMsFEM
% pause(0.2)

fprintf('Classical GMsFEM solution...\n');

z0auxG=A0GMsFEM(free0G,free0G) \b0G(free0G);
z0G=x0dG;
z0G(free0G)=z0auxG;
downz0G=R0GMsFEM*z0G;
%donz0G is the coarse preasure in a mesh in the following
%% This triangulation is like 
%
% 11---12----13----14----15 
% |   / |   / |   / |   / |
% |  /  |  /  |  /  |  /  |
% | /   | /   | /   | /   |
% 6-----7-----8-----9----10 
% |   / |   / |   / |   / |
% |  /  |  /  |  /  |  /  |
% | /   | /   | /   | /   |
% 1-----2-----3-----4-----5
% nex vertical rectangles and ney horizontal rectangles.
% vertices 
