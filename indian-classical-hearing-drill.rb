
samps = "/path/to/harmonium"
use_bpm 60
define :harm do |n|
  print n
  sample_length = 2;
  finish_length = 0.5
  sample samps, n,  start: 0, finish: 0.5,attack: 0.05, release: 0.05, amp: 3
  sleep (sample_length*finish_length)
end
live_loop :myloop do
  use_random_seed 2450 #
  nring = (ring "Re_M","Sa_B","Ni_B","Dha_B","Pa_B");
  firstNote = "Sa_B"
  a = [];
  ##| a = [firstNote];
  ##| harm firstNote;
  sample :tabla_ghe5
  2.times do
    
    note = nring.choose
    harm note;
    ##| sample (ring :tabla_ghe5,:tabla_te_m).tick
    a << note
    
  end
  sleep 0.2
  ##| 4.times do
  ##|   note = a.tick
  ##|   harm note;
  
  ##| end
  ##| sleep 4
end

##| harm "Sa_B"

##| harm "Ni_B"

##| harm "Dha_B"

##| harm "Pa_B"