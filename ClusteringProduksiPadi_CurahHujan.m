% Data contoh (silakan ganti dengan data asli dari CSV)
curah_hujan = randi([500 5500],100,1);   % contoh acak 100 data curah hujan
produksi_padi = randi([300000 4500000],100,1); % contoh acak produksi padi

% Gabungkan ke dalam matriks untuk clustering
X = [curah_hujan, produksi_padi];

% Tentukan jumlah cluster
k = 3;

% Lakukan K-Means clustering
[idx, C] = kmeans(X, k);

% Plot hasil clustering
figure;
gscatter(X(:,1), X(:,2), idx, 'rgb', 'o', 6); % warna r,g,b dengan marker bulat

hold on;
% Plot centroid
plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 3);

% Tambahkan label dan judul
title('Clustering Produksi Padi dan Curah Hujan');
xlabel('Curah Hujan (mm)');
ylabel('Produksi Padi (ton)');

% Tambahkan legend manual agar mirip contoh
legend('Cluster 1','Cluster 2','Cluster 3','Centroid');

hold off;
