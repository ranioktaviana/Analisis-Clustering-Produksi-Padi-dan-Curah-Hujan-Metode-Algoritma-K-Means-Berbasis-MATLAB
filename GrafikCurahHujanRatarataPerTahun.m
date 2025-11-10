% --- Baca data CSV ---
opts = detectImportOptions('/MATLAB Drive/Data_Tanaman_Padi_Sumatera_version_1 (1).csv', ...
    'Delimiter',';', 'VariableNamingRule','preserve');
data = readtable('/MATLAB Drive/Data_Tanaman_Padi_Sumatera_version_1 (1).csv', opts);

% --- Ambil kolom tahun dan curah hujan ---
tahun = str2double(string(data.Tahun));
curahHujan = str2double(string(data.("Curah hujan")));

% --- Hapus baris kosong/NaN ---
valid = ~isnan(tahun) & ~isnan(curahHujan);
tahun = tahun(valid);
curahHujan = curahHujan(valid);

% --- Hitung rata-rata curah hujan per tahun ---
[tahunUnik, ~, idx] = unique(tahun);
curahHujanRata = accumarray(idx, curahHujan, [], @mean);

% --- Plot garis dengan marker ---
figure;
plot(tahunUnik, curahHujanRata, '-o', 'LineWidth', 1.5, ...
    'MarkerSize', 6, 'MarkerFaceColor', 'b')

% --- Format grafik ---
title('Curah Hujan Rata-Rata per Tahun')
xlabel('Tahun')
ylabel('Curah Hujan Rata-Rata (mm)')
grid on
ylim([500 3500])   % biar persis dengan contoh
xlim([1990 2020])  % sesuai range tahun di gambar
