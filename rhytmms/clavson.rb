use_bpm 200

rhythm = (ring 1,0,0,1,0,0,1,0,0,0,1,0,1,0,0,0) #ClavSon
##| rhythm = (ring 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)

tablaDha = :tabla_ghe7
tablaDhin = :tabla_ghe8

tabla = (ring
         tablaDha,tablaDhin,tablaDhin,:tabla_ghe6,
         tablaDha,tablaDhin,tablaDhin,:tabla_ghe6,
         tablaDha,:tabla_tun2,:tabla_tun2,:tabla_tun3,
         :tabla_tun3,tablaDhin,tablaDhin,:tabla_ghe6
         )

tick_set :met, 0
tick_set :tab, 0
live_loop :teental do
  
  amp2 = rhythm.tick(:met)
  print amp2
  sample tabla.tick(:tab) , amp: amp2
  sleep 1
  
end

live_loop :meter do
  
  amp2 = rhythm.tick
  
  sample :bd_klub , amp: 0.5
  sleep 1
  
end