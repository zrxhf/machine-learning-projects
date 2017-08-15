function [acc,msgs,extraFields]=hw06_eval()
%
% Tests the functions from project 6
% Please make sure that the error statements are instructive.
%
% Output:
% acc=100 accuracy on hw03tests
% s= statement describing the failed test (s={} if all succeed)
%
[failed, ok, msgs]=hw6tests();
acc = 100 * ok / (failed + ok);
max_score_tests = 70;
max_score_quality = 30;

if acc == 100,
  testscore = max_score_tests;
else
  testscore = ceil((max_score_tests-1)/100 * acc);
end;
extraFields=[];

% TODO: update with secret data set and competition
try
  load('secret.mat');
  h=autosvm(xTr,yTr);
  score = 100*sum(sign(h(xTe))==yTe(:))./length(yTe);
  if score > 80
    qualityscore = max_score_quality;
  elseif score >76.5
    qualityscore = max_score_quality * 0.85;
  elseif score >75.5
    qualityscore = max_score_quality * 0.7;
  elseif score >  74.5
    qualityscore = max_score_quality *0.55 ;
  end;
  qualityscore = round(qualityscore);
catch err
  fprintf('Exception thrown during competition\n');
  fprintf('%s', err.getReport('extended', 'hyperlinks','off'));
  qualityscore = 0;
end
