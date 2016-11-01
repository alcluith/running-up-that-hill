##
##| # Sonic Pi version of  Placebo's cover
##| # of "Running up that Hill" by Kate Bush
##| # claire@coderdojoscotland.com, April 2015
##| # To listen, edit, etc. download Sonic Pi here: http://sonic-pi.net/

use_bpm 90

#define note length values
sq = 0.25 #semiquaver
q = 0.5 #Eight note
c = 1 #Quarter note
m = 2 #Half note
sb = 4 #Whole note


live_loop:strings do
  with_fx :hpf, amp: 0.5 do
    use_synth :tb303
    play :c8, amp: 0.1, pan: 1
    sleep 0.25
    play :c8, amp: 0.1, pan: 1
    sleep 0.25
    play :c8, amp: 0.1, pan: 1
    sleep 0.25
    play :c8, amp: 0.1, pan: 0
    sleep 0.25
    play :c8, amp: 0.1, pan: 0
    sleep 0.25
    play :c8, amp: 0.1, pan: -1
    sleep 0.25
    play :c8, amp: 0.1, pan: -1
    sleep 0.25
    play :c8, amp: 0.1, pan: -1
    sleep 0.25
  end
end


live_loop:heartbeat do
  with_fx :reverb, amp: 2.5 do
    6.times do
      sample :drum_bass_soft,  cutoff: 70,amp: 1, decay: 0.2,release: 0.05
      sleep 0.25
      sample :drum_bass_soft,  cutoff: 70, amp: 1,decay: 0.2,release: 0.05
      sleep 0.25
      sample :drum_bass_soft,  cutoff: 70,amp: 1, decay: 0.2,release: 0.05
      sleep 0.5
    end
    sample :drum_bass_soft,  cutoff: 70,amp: 1, release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70, amp: 1,decay: 0.1, release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70, amp: 1,release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70,amp: 1, release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70,amp: 1, release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70,amp: 1, release: 0.05
    sleep 0.25
    sample :drum_bass_soft,  cutoff: 70,amp: 1, release: 0.05
    sleep 0.5
  end
end
sleep 8

live_loop :ahahs do
  sync :go_ah
  use_synth :hollow
  with_fx :gverb do
    #sleep q + sq + q + c + c
    play_pattern_timed [:ef4, :d4, :bf3, :c4], [c, c, q, c]
  end
end


live_loop :afbcm do
  sync :play_afbcm
  use_synth :piano
  play_chord (chord :af3, :major), sustain: 4
  sleep m
  play_chord(chord :bf3, :major), sustain: 4
  sleep m
  play_chord (chord_invert(chord :ef3, :major),1), sustain: 4
end



live_loop :verse do
  with_fx :reverb , amp: 0.7 do
    ##| with_fx :echo , mix: 0.5 do
    use_synth :piano
    # use_synth_defaults sustain: 1
    sleep m
    #cue :play_afbcm
    play_pattern_timed [:g4, :af4, :g4, :bf4, :g4], [q,sq,q,c, c], sustain: 4
    cue :go_ah
    sleep q + m
    sleep q
    play_pattern_timed [:g4,:g4,:g4,:bf4, :g4, :g4,:c4], [q,sq,sq,c,q,q,q+c], sustain: 4
    cue :go_ah
    sleep m + c
    sleep sq
    play_pattern_timed [:g4,:g4,:g4,:bf4, :g4, :g4,:g4, :bf4, :g4, :bf4, :g4], [sq,sq,sq,c,q,sq,sq,sq,q,c,q+c], sustain: 4
    cue :go_ah
    sleep m + c
    play_pattern_timed [:g4,:g4,:g4,:bf4, :af4, :g4,:f4, :f4, :ef4, :f4, :g4], [q,sq,sq,c,q,q,q,q,c,c,q+c], sustain: 4
    cue :play_piano
    sleep c
    use_synth :blade
    play_pattern_timed [:bf4,:g4,:ef4,:f4], [q,c+q,q,c +q], sustain: 4
    cue :play_piano
    sleep m + c
    cue :play_piano
    sleep c
    play_pattern_timed [:bf4,:g4,:g4,:ef4,:f4], [q,q,c,q,c +q], sustain: 2
    sleep m+ q
    #if I only could
    play_pattern_timed [:ef4, :bf4,:bf4,:bf4,:bf4,:g4], [q,sq,sq,q,q, q +c], sustain: 2
    sleep q
    #I'd make a deal with God
    play_pattern_timed [:ef4, :ef4,:bf4,:bf4,:d4], [sq,sq,c,q ,q], sustain: 2
    sleep m
    #get him to swap our places
    play_pattern_timed [:bf4,:bf4,:bf4,:g4,:bf4,:c4,:g4], [sq,q,q,c,c,c,q], sustain: 2
    sleep q
    #be running up that road
    play_pattern_timed [:ef4, :bf4,:bf4,:bf4,:bf4,:g4], [q,sq,sq,q,q,c + q ], sustain: 2
    sleep q
    #be running up that hill
    play_pattern_timed [:ef4, :bf4,:bf4,:bf4,:bf4,:d4], [q,sq,sq,q,q,c + q ], sustain: 2
    sleep q
    #be running up that building
    play_pattern_timed [:ef4, :bf4,:bf4,:bf4,:bf4,:g4, :bf4], [q,sq,sq,q,q,c, c + q ], sustain: 2
    sleep sb
    
    ##| play_pattern_timed [:g4, :f4,:ef4,:c4], [c,c,q,c ], sustain: 2
    ##| sleep m
  end

end

live_loop :chord_piano do
  sync :play_piano
  with_fx :gverb do
    use_synth :piano
    #sleep m
    play_chord (chord :af3, :major), sustain: 4
    sleep m
    play_chord(chord :ef3, :major), sustain: 4
    sleep m
    play_chord (chord :af3, :major), sustain: 4
    sleep sb
  end
end
live_loop :chorus do
  sleep 1
end

##| in_thread :intro_melody do
##|   with_fx :reverb do
##|     use_synth :chiplead
##|     play :c4 , attack: 0.1, release: 2, amp: 0.5
##|     play :ef4 , attack: 0.1, release: 2, amp: 0.5
##|     sleep minim
##|     play_pattern_timed [:bf4, :g4, :c4], [ crotchet, quaver, quaver]
##|     sleep minim
##|     play_pattern_timed [:bf4, :g4, :c4], [crotchet, quaver, quaver]
##|     sleep minim
##|     play_pattern_timed [:bf4, :g4, :c4], [crotchet, quaver, quaver]
##|     sleep minim
##|     sleep quaver
##|     play_pattern_timed [:bf3, :c4,:ef4], [ quaver, quaver,quaver]
##|     sleep minim
##|     sleep crotchet
##|     play_pattern_timed [:bf4, :c4], [ quaver, quaver]
##|     sleep minim
##|     sleep crotchet
##|     play_pattern_timed [:bf4, :c4], [ quaver, quaver]
##|     sleep minim
##|     sleep crotchet
##|     play_pattern_timed [:g4, :f4,:ef4,:c4], [ crotchet, crotchet,quaver, quaver]
##|     sleep minim
##|   end
##| end


