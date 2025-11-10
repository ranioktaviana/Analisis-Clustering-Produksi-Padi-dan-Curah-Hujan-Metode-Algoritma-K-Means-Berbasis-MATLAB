% Data contoh (silakan ganti dengan data produksi dari CSV kalau perlu)
tahun = 1993:2020;  
produksi = [1.05 1.10 1.12 1.15 1.18 1.20 1.19 1.21 1.23 1.24 ...
            1.22 1.23 1.25 1.26 1.30 1.35 1.40 1.45 1.50 1.55 ...
            1.60 1.65 1.70 1.75 1.80 1.85 1.90 2.05];  

produksi = produksi * 1e7;  % skala ton

% --- Kategori produksi ---
rendah = produksi;
sedang = produksi;
tinggi = produksi;

% Atur threshold kategori (misalnya)
th_rendah = 1.2e7;
th_sedang = 1.5e7;

rendah(produksi > th_rendah) = NaN;
sedang(produksi <= th_rendah | produksi > th_sedang) = NaN;
tinggi(produksi <= th_sedang) = NaN;

% --- Plot ---
figure;
hold on;

bar(tahun, rendah, 'FaceColor', 'r');   % merah
bar(tahun, sedang, 'FaceColor', 'y');   % kuning
bar(tahun, tinggi, 'FaceColor', 'g');   % hijau

hold off;

% --- Tambahan gaya ---
xlabel('Tahun');
ylabel('Total Produksi Padi (ton)');
title('Total Produksi Padi per Tahun');
legend({'Rendah','Sedang','Tinggi'}, 'Location','northwest');
grid on;

% Keterangan gambar di bawah grafik
dim = [0 0 1 0.05];
annotation('textbox', dim, 'String', 'Gambar 1. Total Produksi Padi per Tahun', ...
    'EdgeColor', 'none', 'HorizontalAlignment','center');
