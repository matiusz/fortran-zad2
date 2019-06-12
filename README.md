
<h1><a id="Zadanie_2__transformaty_Fouriera_0"></a>Zadanie 2 - transformaty Fouriera</h1>
<h1><a id="Opis_projektu_4"></a>Opis projektu</h1>
<h2><a id="Wymagania_6"></a>Wymagania</h2>
<p>Projekt wymaga obsługi komend gfortran, gnuplot oraz biblioteki FFTW zainstalowanej w /usr/local/</p>
<h1><a id="src_10"></a><strong>src</strong></h1>
<p><strong>gendataclean.f90, gendatanoised.f90</strong> - dwa moduły generujące sygnał zgodnie ze wzorem:<br>
<em>x = sin(2 ∗ π ∗ t ∗ 200) + 2 ∗ sin(2 ∗ π ∗ t ∗ 400)</em><br>
W przypadku wersji noised sygnał jest dodatkowo zmodyfikowany w każdym punkcie o losową wartość z przedziału (-0.5, 0.5).<br>
Każda generuje 10000 wartości domyślnie wypisywanych na wyjście standardowe.</p>
<p><strong>signal.f90</strong> - pozwala wykonać transformatę Fouriera na danych z pliku podanego jako argument uruchomieniowy programu.<br>
Drugim argumentem jest flaga bitowa która określa czy na wyjściu chcemy wartość rzeczywistą czy zespoloną.<br>
Wyniki w wersji zespolonej potrzebne są do przeprowadzenia odwrotnej transformaty</p>
<p><strong>reverse.f90</strong> - dokonuje odwrotnej transformaty z danych w postaci zespolonej z pliku podanego jako argument programu.<br>
Jednocześnie usuwa wartości uznawane za szumy, tj. o wartości bezwględnej &lt; 100 (wartość 50 podana w poleceniu zadania nie wystarczała aby uzyskać sygnał wyraźnie niezaszumiony)</p>
<p><strong>makefile</strong><br>
• <em>clean</em> - usuwa pliki wynikowe, tworzy bazową strukturę katalogów<br>
• <em>gen_data</em> - kompiluje generatory danych<br>
• <em>gen_data_run</em> - uruchamia generatory i zapisuje wyjścia do plików <em>data_clean</em> i <em>data_noised</em><br>
• <em>signal</em> - kompiluje moduł signal.f90<br>
• <em>signal_run</em> - dokonuje transformaty na plikach wygenerowanych <em>gen_data_run</em>, zapisuje do plików <em>data_clean_fftw</em>,        <em>data_noised_fftw</em> i <em>data_noised_fftw_complex</em><br>
• <em>reverse</em> - kompiluje moduł reverse.f90<br>
• <em>reverse_run</em> - dokonuje odwrotnej transformaty na zaszumionych danych<br>
• <em>plots</em> - rysuje wykresy danych wygenerowanych przez pozostałe opcje</p>
<h1><a id="srcgnu_specs_34"></a><strong>src/gnu_specs</strong></h1>
<p>Zawiera pliki ze specyfikacjami rysowania wykresów do gnuplot.</p>
<h1><a id="resdata_38"></a><strong>res/data</strong></h1>
<p>Zawiera pliki wynikowe z danymi.</p>
<h1><a id="resplots_42"></a><strong>res/plots</strong></h1>
<p>Zawiera wykresy danych wynikowych.</p>
<h1><a id="Opis_wynikw_47"></a>Opis wyników</h1>
<h2><a id="Cz_pierwsza_50"></a>Część pierwsza</h2>
<p><img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_clean_time.png?raw=true" alt="svg"></p>
<p>Po zastosowaniu FFTW otrzymujemy następujący rozkład częstotliwości:</p>
<p><img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_clean_fft.png?raw=true" alt="svg"></p>
<p>Można zuważyć, że dwa piki pokrywają się z częstotliwościami jakie były użyte we wzorze sygnału - 200 i 400 Hz. FFTW pozwala nam znacznie skompresować sygnał sinusoidalny, ponieważ możemy przechowywać go w postaci par częstotliwość-waga, a nie każdą wartość z osobna.</p>
<h2><a id="Cz_druga_60"></a>Część druga</h2>
<p><img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_noised_time.png?raw=true" alt="svg"></p>
<p>Jak widać sygnał po zaszumieniu znacznie różni się od sygnału czystego.<br>
Za tą różnicę odpowiadają niewielkie składowe częstotliwości które widać w widmie sygnału</p>
<p><img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_noised_fft.png?raw=true" alt="svg"></p>
<p>Po ich usunięciu za pomocą odwrotnej transformaty otrzymujemy sygnał praktycznie identyczny z sygnałem niezaszumionym.</p>
<p>Po odszumianiu:<br>
<img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_reversed.png?raw=true" alt="svg"><br>
Sygnał wyjściowy:<br>
<img src="https://github.com/matiusz/fortran-zad2/blob/master/res/plots/signal_clean_time.png?raw=true" alt="svg"></p>
