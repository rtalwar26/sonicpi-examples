
samps = "/Users/rohittalwar/personal/sonic/harmonium"
use_bpm 60

define :harm do |n|
  print n
  sample_length = 2;
  finish_length = 0.5
  sample samps, n,  start: 0, finish: 0.5,attack: 0.05, release: 0.05, amp: 3
  sleep (sample_length*finish_length)
end
live_loop :myloop do
  
  use_random_seed 3701 #
  invalid = {
    "Pa_B"=>"Ga_M",
    "Pa_B"=>"Ma_M",
    "Dha_B"=>"Ma_M",
    "Ni_B"=>"Ma_M",
  }
  
  nring = (ring "Ma_M","Ga_M","Re_M","Sa_B","Ni_B","Dha_B","Pa_B");
  firstNote = "Sa_B"
  a = [];
  ##| a = [firstNote];
  ##| harm firstNote;
  sample :tabla_ghe5
  note1 = nring.choose
  note2 = nring.choose
  if invalid[note1] == note2 || invalid[note2] == note1
    print "invalid"
    note1 = "Sa_B"
    note2 = "Ma_M"
  end
  selectnotes = (ring note1,note2)
  2.times do
    
    note = selectnotes.tick
    harm note;
    ##| sample (ring :tabla_ghe5,:tabla_te_m).tick
    ##| a << note
    
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