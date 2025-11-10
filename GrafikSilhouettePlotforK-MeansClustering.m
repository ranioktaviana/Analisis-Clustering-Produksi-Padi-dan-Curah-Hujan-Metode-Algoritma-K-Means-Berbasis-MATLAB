% Data contoh (silakan ganti dengan data asli)
curah_hujan = randi([500 5500],100,1);        % contoh acak data curah hujan
produksi_padi = randi([300000 4500000],100,1);% contoh acak data produksi padi

% Gabungkan data
X = [curah_hujan, produksi_padi];

% Jumlah cluster
k = 3;

% Lakukan k-means clustering
[idx, C] = kmeans(X, k);

% Buat silhouette plot
figure;
silhouette(X, idx);

% Tambahkan judul
title('Silhouette Plot for K-Means Clustering');
