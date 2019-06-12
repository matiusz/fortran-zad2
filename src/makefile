all: clean gen_data gen_data_run signal signal_run reverse reverse_run plots

gen_data:
	gfortran -o gendataclean gendataclean.f90
	gfortran -o gendatanoised gendatanoised.f90

gen_data_run:
	./gendataclean > ../res/data/data_clean
	./gendatanoised > ../res/data/data_noised

signal:
	gfortran -o signal signal.f90 -I/usr/local/include -L/usr/local/lib -lfftw3

signal_run:
	./signal ../res/data/data_clean 0 > ../res/data/data_clean_fftw
	./signal ../res/data/data_noised 0 > ../res/data/data_noised_fftw
	./signal ../res/data/data_noised 1 > ../res/data/data_noised_fftw_complex

reverse:
	gfortran -o reverse reverse.f90 -I/usr/local/include -L/usr/local/lib -lfftw3

reverse_run:
	./reverse ../res/data/data_noised_fftw_complex > ../res/data/data_reversed

plots:
	gnuplot gnu_specs/signal_clean_plot
	gnuplot gnu_specs/signal_noised_plot
	gnuplot gnu_specs/signal_clean_fftw_plot
	gnuplot gnu_specs/signal_noised_fftw_plot
	gnuplot gnu_specs/signal_noised_reversed
clean:
	rm -f -r ../res/*
	rm -f signal
	rm -f gendataclean
	rm -f gendatanoised
	rm -f reverse
	mkdir -p ../res
	mkdir -p ../res/data
	mkdir -p ../res/plots

