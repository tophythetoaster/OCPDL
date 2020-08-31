%% generate data
sizes = [5000, 1000];
r = 10;
facts = init_facts(sizes, r);
T = 90;
data = gen_data(facts, T);


%% run ocpdl
facts_rec = ocpdl(data, r);


%% validate dictionary 
err = recerr(facts_rec, data);
disp(err);