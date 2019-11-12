  cell $dlatch $auto$proc_dlatch.cc:409:proc_dlatch$14
    parameter \EN_POLARITY 1
    parameter \WIDTH 1
    connect \D $procmux$2_Y
    connect \EN $auto$rtlil.cc:1844:Not$13
    connect \Q \q
  end
