% Baca data
opts = detectImportOptions('/MATLAB Drive/Data_Tanaman_Padi_Sumatera_version_1 (1).csv', ...
    'VariableNamingRule','preserve');
data = readtable('/MATLAB Drive/Data_Tanaman_Padi_Sumatera_version_1 (1).csv', opts);

% Ambil kolom yang dibutuhkan
provinsi = data.("Provinsi");
produksi = data.("Produksi");

% Hitung total produksi per provinsi
produksi_provinsi = groupsummary(data,"Provinsi","sum","Produksi");

% Ambil hasil ringkasan
provinsi = produksi_provinsi.Provinsi;
total_produksi = produksi_provinsi.sum_Produksi;

% Tentukan kategori berdasarkan batas produksi
warna = strings(size(total_produksi));
for i = 1:length(total_produksi)
    if total_produksi(i) < 2e7
        warna(i) = "r";   % Rendah
    elseif total_produksi(i) < 6e7
        warna(i) = "y";   % Sedang
    else
        warna(i) = "g";   % Tinggi
    end
end

% Buat bar chart
figure;
b = bar(total_produksi,'FaceColor','flat');

% Atur warna sesuai kategori
for k = 1:length(total_produksi)
    b.CData(k,:) = rgb(warna(k));
end

% Atur sumbu x dengan nama provinsi
set(gca,'XTickLabel',provinsi,'XTickLabelRotation',45);

% Tambahkan judul dan label
title('Total Produksi Padi per Provinsi');
xlabel('Provinsi');
ylabel('Total Produksi Padi (ton)');

% Tambahkan legenda
hold on
bar(nan,'r');
bar(nan,'y');
bar(nan,'g');
legend('Rendah','Sedang','Tinggi');
hold off

% --- Fungsi bantu untuk konversi warna huruf ke RGB
function c = rgb(ch)
    switch ch
        case "r"
            c = [1 0 0];
        case "y"
            c = [1 1 0];
        case "g"
            c = [0 1 0];
    end
end
