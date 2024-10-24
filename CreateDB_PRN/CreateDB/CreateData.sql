USE SWP391_FengShuiKoiConsultingPRN212_DB
GO
-- Insert data into Element table
INSERT INTO Element (ElementID, Mutualism) VALUES (N'Thổ',N'Hỏa');
INSERT INTO Element (ElementID, Mutualism) VALUES (N'Kim',N'Thổ');
INSERT INTO Element (ElementID, Mutualism) VALUES (N'Thủy',N'Kim');
INSERT INTO Element (ElementID, Mutualism) VALUES (N'Mộc',N'Thủy');
INSERT INTO Element (ElementID, Mutualism) VALUES (N'Hỏa',N'Mộc');
-- Insert data into Account table
INSERT INTO Account (UserID, Password, Role, Email, Status)
VALUES 
('hau', '123', 'Admin', 'hauhnse183392@fpt.edu.vn', 'Active'),
('nhan', '123', 'Member', 'nhannbse183358@fpt.edu.vn', 'Active'),
('khoa', '123', 'Member', 'khoatdse183308@fpt.edu.vn', 'Active'),
('huy', '123', 'Member', 'huynqse183261@fpt.edu.vn', 'Active'),
('after', '123', 'Member', 'ngochau1310@gmail.com', 'Active'),
('tin', '123', 'Member', 'tinptse183485@fpt.edu.vn', 'Active');

-- Insert data into Member table
INSERT INTO Member (Name, Birthday, UserID)
VALUES 
(N'After Huỳnh', '2000-10-20', 'after'),
(N'Huỳnh Ngọc Hậu', '1990-01-01', 'hau'),
(N'Nguyễn Bá Nhân', '1995-05-15', 'nhan'),
(N'Nguyễn Quốc Huy', '1995-05-15', 'huy'),
(N'Trương Đình Khoa', '1995-05-15', 'khoa'),
(N'Phạm Trung Tín', '2000-10-20', 'tin');

-- Insert data into Shape table
INSERT INTO Shape (ShapeID,image)
VALUES 
(N'Hình tròn','D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\pond\hinhtron.jpg'),
(N'Hình vuông','D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\pond\Square.jpg'),
(N'Hình chữ nhật','D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\pond\hinhchunhat.jpg'),
(N'Hình lượn sóng','D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\pond\hinhluonsong.jpg'),
(N'Hình tam giác','D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\pond\triangular.jpg');


-- Insert data into PointOfShape table
INSERT INTO PointOfShape (ElementID,ShapeID,Point)
VALUES 
(N'Kim',N'Hình tròn',0.75),
(N'Kim',N'Hình vuông',1),
(N'Kim',N'Hình chữ nhật',0.25),
(N'Kim',N'Hình lượn sóng',0.5),
(N'Kim',N'Hình tam giác',0.25),
(N'Mộc',N'Hình tròn',0.25),
(N'Mộc',N'Hình vuông',0.25),
(N'Mộc',N'Hình chữ nhật',0.75),
(N'Mộc',N'Hình lượn sóng',1),
(N'Mộc',N'Hình tam giác',0.5),
(N'Thủy',N'Hình tròn',1),
(N'Thủy',N'Hình chữ nhật',0.5),
(N'Thủy',N'Hình lượn sóng',0.75),
(N'Thủy',N'Hình tam giác',0.25),
(N'Thủy',N'Hình vuông',0.25),
(N'Thổ',N'Hình tròn',0.5),
(N'Thổ',N'Hình vuông',0.75),
(N'Thổ',N'Hình chữ nhật',0.25),
(N'Thổ',N'Hình lượn sóng',0.25),
(N'Thổ',N'Hình tam giác',1),
(N'Hỏa',N'Hình tròn',0.25),
(N'Hỏa',N'Hình chữ nhật',1),
(N'Hỏa',N'Hình lượn sóng',0.25),
(N'Hỏa',N'Hình tam giác',0.75),
(N'Hỏa',N'Hình vuông',0.5);

-- Insert data into Package table
INSERT INTO Package (Rank, Duration, Description, price)
VALUES 
(N'Diamond', 30, N'Hình ảnh lớn, xuất hiện ở đầu trang, tần suất xuất hiện nhiều, phù hợp với các doanh nghiệp lớn muốn quảng bá mạnh mẽ.', 6000000),
(N'Gold', 30, N'Hình ảnh vừa, xuất hiện ở dưới gói Dimond, tần suất xuất hiện vừa, phù hợp với doanh nghiệp vừa và nhỏ muốn có sự hiện diện ổn định.', 4000000),
(N'Silver', 30, N'Hình ảnh nhỏ, chỉ xuất hiện ở trang đăng tin, tần suất xuất hiện ít, phù hợp với doanh nghiệp cá nhân hoặc startup muốn tiết kiệm chi phí.', 2000000);	
INSERT INTO LifePalace (LifePalaceID)
VALUES 
(N'Càn'),
(N'Đoài'),
(N'Cấn'),
(N'Khôn'),
(N'Ly'),
(N'Khảm'),
(N'Tốn'),
(N'Chấn');

-- Insert data into Direction table
INSERT INTO Direction (DirectionID)
VALUES 
(N'Đông Bắc'),
(N'Tây'),
(N'Tây Bắc'),
(N'Tây Nam'),
(N'Bắc'),
(N'Đông Nam'),
(N'Nam'),
(N'Đông');

-- Insert data into LifePalace_Direction table
INSERT INTO LifePalace_Direction (LifePalaceID,DirectionID,EightMansions,PointOfDirection,Description)
VALUES 
(N'Càn',N'Tây',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Càn',N'Đông Bắc',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Càn',N'Tây Nam',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Càn',N'Tây Bắc',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Càn',N'Nam',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Càn',N'Đông',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Càn',N'Bắc',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Càn',N'Đông Nam',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Đoài',N'Tây Bắc',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Đoài',N'Tây Nam',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Đoài',N'Đông Bắc',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Đoài',N'Tây',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Đoài',N'Đông',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Đoài',N'Nam',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Đoài',N'Đông Nam',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Đoài',N'Bắc',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Ly',N'Đông',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Ly',N'Đông Nam',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Ly',N'Bắc',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Ly',N'Nam',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Ly',N'Tây Bắc',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Ly',N'Tây',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Ly',N'Tây Nam',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Ly',N'Đông Bắc',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Khảm',N'Đông Nam',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Khảm',N'Đông',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Khảm',N'Nam',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Khảm',N'Bắc',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Khảm',N'Tây Nam',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Khảm',N'Đông Bắc',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Khảm',N'Tây Bắc',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Khảm',N'Tây',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Chấn',N'Nam',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Chấn',N'Bắc',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Chấn',N'Đông Nam',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Chấn',N'Đông',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Chấn',N'Tây',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Chấn',N'Tây Bắc',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Chấn',N'Đông Bắc',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Chấn',N'Tây Nam',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Tốn',N'Bắc',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Tốn',N'Nam',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Tốn',N'Đông',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Tốn',N'Đông Nam',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Tốn',N'Đông Bắc',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Tốn',N'Tây Nam',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Tốn',N'Tây',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Tốn',N'Tây Bắc',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Khôn',N'Tây Nam',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Khôn',N'Tây Bắc',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Khôn',N'Tây',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Khôn',N'Đông Bắc',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Khôn',N'Bắc',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Khôn',N'Đông Nam',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Khôn',N'Nam',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Khôn',N'Đông',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.'),

(N'Cấn',N'Đông Bắc',N'Sinh khí',1,N'Đây là hướng mang lại may mắn nhất cho chủ nhà và tạo ra khí tốt.'),
(N'Cấn',N'Tây',N'Thiên y',1,N'Đây là hướng tập trung vào sức khỏe, có thể giảm bớt bệnh tật và mang lại sự thịnh vượng.'),
(N'Cấn',N'Tây Bắc',N'Diên niên',0.75,N'Hướng mang đến sự hòa thuận, thúc đẩy sự nghiệp và gia tăng tuổi thọ.'),
(N'Cấn',N'Tây Nam',N'Phục vị',0.5,N'Hướng giúp cải thiện quan hệ gia đình và mang lại bình yên.'),
(N'Cấn',N'Nam',N'Tuyệt mệnh',0.25,N'Hướng không tốt cho sự phát triển, gây ra bất hòa và đau buồn.'),
(N'Cấn',N'Đông',N'Ngũ quỷ',0.25,N'Hướng gây trở ngại trong quan hệ tình cảm và có nhiều thử thách, bệnh tật.'),
(N'Cấn',N'Bắc',N'Lục sát',0.25,N'Hướng dễ hao tài, tốn của và thành viên trong gia đình gặp rủi ro, tai nạn.'),
(N'Cấn',N'Đông Nam',N'Họa hại',0,N'Hướng ảnh hưởng không tốt đến sức khỏe và gây rủi ro cho gia chủ.');


-- Insert data into Koi_Variety table
INSERT INTO Koi_Variety (KoiType, Image, Element, Description) VALUES
(N'Hariwake', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Hariwake.jpg', N'Thổ', N'Hariwake là một trong những dòng cá koi vàng được yêu thích nhất với màu sắc vàng rực rỡ bao phủ trên toàn thân. Điểm nổi bật của dòng cá koi này là chúng có các đốm vàng trên lưng và cánh tay của nó. Koi hariwake được coi là biểu tượng của sự giàu có và thịnh vượng theo văn hóa Nhật Bản.'),
(N'Kikusui', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Kikusui.png', N'Kim', N'Cá koi Kikusui về cơ bản là một phiên bản Doitsu của koi Hariwake, là một con koi kim loại, hai màu với màu cơ bản là trắng và hoa văn màu đỏ, cam hoặc vàng trên nền màu trắng . Kikusui cũng thường được mô tả là koi kim loại, Doitsu Kohaku koi vì nó là một con koi trắng, không vảy với hoa văn màu đỏ trên nền trắng và một lớp ánh sáng phản chiếu, hoặc bóng, trên da của cá koi.'),
(N'Goshiki', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Goshiki.png', N'Hỏa', N'Cá koi Goshiki là kết quả lai tạo thành công hai giống cá koi phổ biến asagi và cá koi kohaku. Có thể nói cá koi Goshiki là một con kohaku với lớp vẩy caro màu đen ấn tượng trên lưng làm nổi bật những mảng màu đỏ (hi) vốn có của giống kohaku. Từ Goshiki có nghĩa là ngũ sắc các nhà tạo giống rất yêu thích và ấn tượng với giống cá này bởi màu sắc nó khá phong phú và đẹp mắt.'),
(N'Goromo', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Goromo.png', N'Hỏa', N'Cá koi Goromo là kết quả lai tạo tình cờ giữa một con cá koi kohaku, một con Sanke hoặc một con Showa với một con cá koi Asagi. Bình thường việc lai tạo các giống koi trên với koi asagi chỉ tạo ra koi Goshiki. Chính vì đặc điểm này mà cá koi mới được đặt tên là “Goromo” – nghĩa tiếng Nhật là “được khoác áo”. Thực chất Goromo chỉ là tên rút gọn, tên đầy đủ của dòng koi Goromo này phải là Ai Goromo có nghĩa là “ được khoác áo màu xanh Indigo”.'),
(N'Soragoi', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Soragoi.png', N'Kim', N'Cá koi Soragoi (SOH-rog-GOY) là những con koi xám đơn màu thường có dạng lưới trên vảy của chúng được gọi là fukurin (FOO-koo-REEN).Do đó, hầu hết cá koi Soragoi đều có tiềm năng là cá koi rất lớn và thường hướng về thức ăn hơn các loại koi khác. Điều này rất tốt cho người nuôi cá koi vì nó có nghĩa là Soragoi và Chagoi, koi sẽ thường đến chào đón bạn ở đầu ao với hy vọng được cho ăn và bất kỳ con cá nào khác trong ao sẽ đi theo chúng!'),
(N'Hi Utsuri', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Hi_Utsuri.png', N'Hỏa', N'Koi utsuri có điểm đặc trưng là những bệt màu tạo thành vệt hoặc khoang màu lớn trên màu nền đen của chúng.Tại phần đầu của cá koi utsuri luôn có những mảng hoặc vệt màu đen. Các mảng đen trên mình koi utsuri có thể là mảng lớn, chấm nhỏ hoặc vệt uốn lượn theo chiều ngang'),
(N'Ki Utsuri', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Ki_Utsuri.png', N'Thổ', N'Koi utsuri có điểm đặc trưng là những bệt màu tạo thành vệt hoặc khoang màu lớn trên màu nền đen của chúng.Tại phần đầu của cá koi utsuri luôn có những mảng hoặc vệt màu đen. Các mảng đen trên mình koi utsuri có thể là mảng lớn, chấm nhỏ hoặc vệt uốn lượn theo chiều ngang'),
(N'Tancho Kohaku', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Tancho_Kohaku.png', N'Kim', N'Koi tancho kohaku chính là “quốc kì sống” của đất nước Nhật Bản, chúng có thân mình và phần bụng màu trắng muốt như tuyết, tất cả các vây cũng màu trắng và chỉ có duy nhất một chấm màu đỏ lớn ở trên đầu. Đây cũng là loại cá koi Tancho được nhiều người biết đến và ao ước được sở hữu nhất.'),
(N'Kujaku', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Kujaku.png', N'Kim', N'Cá Koi KujaKu là một trong những dòng cá Koi nổi bật bởi sở hữu bộ vảy ánh bạc nền đen pha lẫn các dãy màu đỏ vô cùng kiêu hãnh và bắt mắt. Trong vài năm gần đây, Kujaku đang ngày càng gây được sự chú ý lớn tại Việt Nam, trở thành giống cá được nhiều người yêu Koi tìm kiếm.'),
(N'Shiro Utsuri', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\shiro-utsuri.jpg', N'Kim', N'Cá koi utsuri được lai tạo sao cho thân mình của chúng thường chỉ có hai màu, trong đó màu đen (sumi) chiếm tỷ lệ nhỏ hơn, tạo thành các bệt đen (vết đen) trên thân cá.'),
(N'Ochiba Shigure', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\ochibaSigure.jpg', N'Kim', N'Ochiba là giống cá Koi được lai tạo như một sự kết hợp của Chagoi và Kohaku. Trong tiếng Anh, thuật ngữ Nhật Bản dịch gần như là là mùa thu trên mặt nước. Điều này thể hiện màu sắc ánh kim loại trên mình cá Ochiba.'),
(N'Ogon', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\ogon.jpg', N'Thổ', N'Cá Koi Ogon được coi là một trong những giống cá Koi đẹp nhất và độc đáo nhất trên trái đất với ngoại hình đặc trưng là màu vàng óng ánh rực rỡ.'),
(N'Shusui', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\shusui.png', N'Kim',N'Cá koi Shusui là một trong những giống cá chép đẹp và độc đáo nhất trong thế giới cá cảnh. Với thiết kế hai mảng vẩy lớn sậm màu trải dài từ vai xuống lưng, cá koi Shusui thực sự là một tác phẩm nghệ thuật sống đầy ấn tượng'),
(N'Taisho Sanke', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\TaishoSanke.jpg', N'Kim',N' Koi Taisho Sanke là một trong số 2 dòng chính được lai tạo từ cá chép hoang dã Magoi cổ xưa tại Nhật Bản.'),
(N'Kikokuryu', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Kikokuryu.jpg', N'Kim', N'Cá Kikokuryu thực chất là một Kumonryu kim loại, một con cá koi với làn da bạch kim sáng bóng và vây với màu sắc Sumi sâu trong suốt. Dòng Koi  sẽ không có 2 con nào giống nhau vì chúng rất hiếm được thấy trên thị trường.'),
(N'Kin Kikokuryu', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\KinKikokuryu.jpg', N'Thủy',N' Kin Kikokuryu kết hợp màu da cam hoặc màu vàng với các mẫu màu đen và trắng của Kikokuryu để tạo thành loại koi mới nhất trong họ cá Koi.'),
(N'Showa Sanshoku', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\showa_sanshoku.jpg', N'Kim', N'Mặc dù tất cả các Showa phải sở hữu làn da đen (gọi là Sumi) được bao phủ bởi các dấu hiệu từ đỏ đến đỏ cam (Hi) và trắng (Shiroji) trên đó, có rất nhiều giống Showa khác nhau bao gồm các loại hoa văn và cách sắp xếp khác nhau.'),
(N'Kohaku', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\kohaku.jpg', N'Hỏa', N'Kohaku – dòng cá kết hợp tương phản giữa 2 màu trắng(Shiroji) và đỏ (Hi) đã tạo nên vẻ đẹp đơn giản không chỉ phổ biến nhất, đẹp nhất mà còn luôn tiềm ẩn khả năng trở thành chủng cá có giá trị cao nhất trong các dòng cá Koi.'),
(N'Asagi', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\asagi.jpg', N'Thủy', N'Asagi chính là giống sản sinh ra Nishikigoi, chúng bắt nguồn từ loài cá chép đen thường sinh sống ở những vùng sông hoặc suối, những chú cá chép đen có sự tiến hóa vượt bậc và được người dân Nhật chọn lựa những chú cá có màu sắc như Trắng, Xanh dương và màu đỏ và giữ lại trong hồ.'),
(N'Kumonryu', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\kumonryu.png', N'Kim', N'Kumonryu là koi Doitsu có hoa văn màu đen như mực nổi lên như những đám mây sấm đen cuồn cuộn trên nền tuyết trắng. Một con Koi Ben Kumonryu được đánh giá là đẹp khi có sự tương xứng và cân bằng giữa các màu đỏ, đen và trắng trên thân của nó.'),
(N'Beni Kumonryu', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Beni_Kumonryu.jpg', N'Hỏa', N'Koi Beni Kumonryu là một biến thể hiếm hoi của Kumonryu, chúng thường có ba màu là đỏ, đen và trắng.'),
(N'Ginrin Chagoi', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\GinrinChagoi.jpg', N'Thổ', N'Ginrin Chagoi luôn chiếm được sự yêu thích từ người chơi cá koi. Chagoi biểu tượng cho sự mạnh mẽ, dũng cảm, sẵn sàng đương đầu với thử thách để đạt được thành công.' ),
(N'Matsuba', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\matsubaKOI.png', N'Kim', N'Koi Matsuba là những con cá đơn sắc. Giống cá này thường có 3 màu chủ yếu là màu trắng bạc, màu vàng hoặc màu đỏ cam. Matsuba là cá koi màu kim loại với hoạ tiết lưới màu đen. Cơ thể của cá koi Matsuba có một màu với vảy hình nón rỗng'),
(N'Gin Rin Yamato Nishiki', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\GinRinYamatoNishiKi.jpg', N'Hỏa', N'Gin Rin Yamato nishiki koi là loài cá được lai tạo khoảng thời gian sau này của giống koi sanke. Có thể nói cá koi yamato nishiki giúp vẻ đẹp màu sắc Gin Rin tiến đến một tầm mới hơn khi phủ lên mình cá một lớp ánh kim loại lấp lánh.'),
(N'Ushutimono', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Ushutimono.jpg', N'Mộc', N'Ushutimono có màu xanh chiếm phần lớn cơ thể, với các vảy màu trắng xen kẽ. Hoa văn của vảy tạo ra sự tương phản rõ rệt giữa màu xanh và trắng, với màu xanh nổi bật hơn, bao phủ phần lớn thân cá. Các vây và đuôi cũng có màu xanh nhẹ. Cá này có thể là một biến thể của dòng Koi có sự pha trộn mạnh mẽ giữa hai màu xanh và trắng.'),
(N'Midorigoi', N'D:\01_PRN212\KoiFengShuiASM_PRN212\KoiFengShuiPRN212\CreateDB_PRN\KOI_FISH\Midorigoi.jpg', N'Mộc', N'Midorigoi có màu xanh lục nhạt phủ toàn thân, với các vảy đều đặn và bóng loáng. Màu sắc chủ đạo là xanh lục, bao gồm cả vây và đuôi. Cá này có thể thuộc dòng Koi Ogon, đặc trưng bởi màu đơn sắc và sự bóng bẩy của lớp vảy.');

-- Insert data into Color table
INSERT INTO Color (ColorID) VALUES
(N'Vàng'),
(N'Trắng'),
(N'Đỏ'),
(N'Đen'),
(N'Cam'),
(N'Bạc'),
(N'Nâu'),
(N'Xanh lục');
-- Insert data into Element_Color table
INSERT INTO Element_Color (ElementID,ColorID,ColorPoint) VALUES
(N'Kim',N'Vàng',1),
(N'Kim',N'Trắng',0.75),
(N'Kim',N'Đỏ',0.25),
(N'Kim',N'Xanh lục',0.25),
(N'Kim',N'Đen',0.5),
(N'Kim',N'Cam',0.25),
(N'Kim',N'Bạc',0.75),
(N'Kim',N'Nâu',1),
(N'Hỏa',N'Xanh lục',1),
(N'Hỏa',N'Vàng',0.5),
(N'Hỏa',N'Trắng',0.25),
(N'Hỏa',N'Đỏ',0.75),
(N'Hỏa',N'Đen',0.25),
(N'Hỏa',N'Cam',0.75),
(N'Hỏa',N'Bạc',0.25),
(N'Hỏa',N'Nâu',0.5),
(N'Mộc',N'Vàng',0.25),
(N'Mộc',N'Trắng',0.25),
(N'Mộc',N'Xanh lục',0.75),
(N'Mộc',N'Đỏ',0.5),
(N'Mộc',N'Đen',1),
(N'Mộc',N'Cam',0.5),
(N'Mộc',N'Bạc',0.25),
(N'Mộc',N'Nâu',0.25),
(N'Thủy',N'Vàng',0.25),
(N'Thủy',N'Trắng',1),
(N'Thủy',N'Xanh lục',0.5),
(N'Thủy',N'Đỏ',0.25),
(N'Thủy',N'Đen',0.75),
(N'Thủy',N'Cam',0.25),
(N'Thủy',N'Bạc',1),
(N'Thủy',N'Nâu',0.25),
(N'Thổ',N'Vàng',0.75),
(N'Thổ',N'Trắng',0.5),
(N'Thổ',N'Xanh lục',0.25),
(N'Thổ',N'Đỏ',1),
(N'Thổ',N'Đen',0.25),
(N'Thổ',N'Cam',0.75),
(N'Thổ',N'Bạc',0.5),
(N'Thổ',N'Nâu',0.75);

-- Insert data into Type_Color table
INSERT INTO Type_Color (KoiType, ColorID, Percentage) VALUES
(N'Hariwake', N'Vàng', 0.6),
(N'Hariwake', N'Trắng', 0.4),
(N'Kikusui', N'Trắng', 0.7),
(N'Kikusui', N'Đỏ', 0.3),
(N'Goshiki', N'Đỏ', 0.7),
(N'Goshiki', N'Đen', 0.2),
(N'Goshiki', N'Trắng', 0.1),
(N'Goromo', N'Đỏ', 0.6),
(N'Goromo', N'Trắng', 0.4),
(N'Soragoi', N'Trắng', 1),
(N'Hi Utsuri', N'Cam', 0.7),
(N'Hi Utsuri', N'Đen', 0.3),
(N'Ki Utsuri', N'Vàng', 0.7),
(N'Ki Utsuri', N'Đen', 0.3),
(N'Tancho Kohaku', N'Trắng', 0.9),
(N'Tancho Kohaku', N'Đỏ', 0.1),
(N'Kujaku', N'Bạc', 0.6),
(N'Kujaku', N'Đen', 0.2),
(N'Kujaku', N'Đỏ', 0.2),
(N'Shiro Utsuri', N'Trắng', 0.7),
(N'Shiro Utsuri', N'Đen', 0.3),
(N'Ochiba Shigure', N'Trắng', 0.7),
(N'Ochiba Shigure', N'Cam', 0.3),
(N'Ogon', N'Vàng', 1),
(N'Shusui', N'Trắng', 0.6),
(N'Shusui', N'Đen', 0.4),
(N'Taisho Sanke', N'Trắng', 0.7),
(N'Taisho Sanke', N'Đen', 0.15),
(N'Taisho Sanke', N'Đỏ', 0.15),
(N'Kikokuryu', N'Trắng', 0.8),
(N'Kikokuryu', N'Đen', 0.2),
(N'Kin Kikokuryu', N'Đen', 0.6),
(N'Kin Kikokuryu', N'Vàng', 0.3),
(N'Kin Kikokuryu', N'Trắng', 0.1),
(N'Showa Sanshoku', N'Trắng', 0.7),
(N'Showa Sanshoku', N'Đỏ', 0.2),
(N'Showa Sanshoku', N'Đen', 0.1),
(N'Kohaku', N'Đỏ', 0.6),
(N'Kohaku', N'Trắng', 0.4),
(N'Asagi', N'Đen', 0.5),
(N'Asagi', N'Đỏ', 0.1),
(N'Asagi', N'Trắng', 0.4),
(N'Kumonryu', N'Trắng', 0.6),
(N'Kumonryu', N'Đen', 0.4),
(N'Beni Kumonryu', N'Đỏ', 0.6),
(N'Beni Kumonryu', N'Trắng', 0.3),
(N'Beni Kumonryu', N'Đen', 0.1),
(N'Ginrin Chagoi', N'Vàng', 0.8),
(N'Ginrin Chagoi', N'Nâu', 0.2),
(N'Matsuba', N'Trắng', 0.6),
(N'Matsuba', N'Đen', 0.4),
(N'Gin Rin Yamato Nishiki', N'Trắng', 0.25),
(N'Gin Rin Yamato Nishiki', N'Cam', 0.7),
(N'Gin Rin Yamato Nishiki', N'Đen', 0.05),
(N'Ushutimono', N'Trắng', 0.3), 
(N'Ushutimono', N'Xanh lục', 0.7),
(N'Midorigoi', N'Xanh lục', 1);

-- Insert data into Quantity table
INSERT INTO QuantityOfFish (ElementID, Description) VALUES
(N'Thủy', N'Phù hợp nuôi số lượng cá có hàng đơn vị là 1 hoặc 6. VD: 1 con, 11 con, 6 con, 26 con,...'),
(N'Kim', N'Phù hợp nuôi số lượng cá có hàng đơn vị là 4 hoặc 9. VD: 4 con, 14 con, 9 con, 29 con,...'),
(N'Mộc', N'Phù hợp nuôi số lượng cá có hàng đơn vị là 3 hoặc 8. VD: 3 con, 13 con, 8 con, 28 con,...'),
(N'Hỏa', N'Phù hợp nuôi số lượng cá có hàng đơn vị là 2 hoặc 7. VD: 2 con, 12 con, 7 con, 27 con,...'),
(N'Thổ', N'Phù hợp nuôi số lượng cá có hàng đơn vị là 5 hoặc 0. VD: 10 con, 5 con, 15 con,...');

INSERT INTO Advertisement (AdID, Heading,Image,Link,UserID,ElementID,status) VALUES
(N'AD820', N'Bán cá Koi Nhật Bản chất lượng cao tại Yên Bái, Tuyên Quang, Cao Bằng, Bắc Kạn', 
N'https://nonbo.net.vn/wp-content/uploads/2021/01/ca-koi-cua-trung-quoc-va-nhat-ban-pho-bien-tren-thi-truong-hien-nay.jpg', 
N'<h2 class="detail-sapo" style="text-align: center;" data-role="sapo">Cá Koi Nhật Bản - Biểu tượng của sự may mắn và thịnh vượng. Chúng tôi chuyên cung cấp cá Koi nhập khẩu trực tiếp từ Nhật Bản với chất lượng đảm bảo, kích thước đa dạng, phù hợp với mọi nhu cầu.</h2> 
<p style="text-align: center;"><img src="https://nonbo.net.vn/wp-content/uploads/2021/01/ca-koi-cua-trung-quoc-va-nhat-ban-pho-bien-tren-thi-truong-hien-nay.jpg" alt="Cá Koi Nhật Bản chất lượng cao"></p> 
<p style="text-align: center;">Cá Koi của chúng tôi được nuôi dưỡng theo tiêu chuẩn Nhật Bản, với màu sắc đa dạng, sức sống mạnh mẽ và không mang mầm bệnh. Đội ngũ chuyên gia sẽ hỗ trợ tư vấn chăm sóc hồ cá Koi tận tình.</p> 
<p style="text-align: center;">Chúng tôi cam kết:</p> 
<ul> 
<li>Nhập khẩu cá Koi trực tiếp từ các trại cá uy tín ở Nhật Bản</li> 
<li>Cung cấp dịch vụ bảo hành sức khỏe cá trong 1 tháng</li> 
<li>Tư vấn miễn phí về thiết kế hồ cá và cách chăm sóc</li> 
<li>Vận chuyển toàn quốc, đảm bảo an toàn tuyệt đối cho cá Koi</li> 
</ul> 
<p style="text-align: center;">Liên hệ ngay để sở hữu những chú cá Koi đẳng cấp, mang lại may mắn và tài lộc cho gia đình bạn!</p>', 
N'huy', N'Mộc', N'Approved'),

(N'AD793',N'Hợp tác xã Sản xuất và thương mại Tân Khánh thành công với mô hình nuôi cá Koi',N'https://baonamdinh.vn/file/e7837c02816d130b0181a995d7ad7e96/102024/untitled-1_20241015074751.jpg',
N'<p style="text-align: center;"><em><strong>Hợp t&aacute;c x&atilde; Sản xuất v&agrave; thương mại T&acirc;n Kh&aacute;nh ở th&ocirc;n Phong Cốc, x&atilde; Minh T&acirc;n (Vụ Bản) th&agrave;nh lập năm 2021 với 16 th&agrave;nh vi&ecirc;n chuy&ecirc;n sản xuất, kinh doanh c&aacute; Koi. Với quy m&ocirc; nu&ocirc;i hơn 30ha, mỗi năm HTX cung ứng ra thị trường tr&ecirc;n 100 tấn c&aacute;. Vừa qua, HTX Sản xuất v&agrave; thương mại T&acirc;n Kh&aacute;nh l&agrave; 1 trong 63 HTX được Trung ương Hội N&ocirc;ng d&acirc;n Việt Nam c&ocirc;ng nhận l&agrave; HTX x&atilde; ti&ecirc;u biểu to&agrave;n quốc năm 2024.</strong></em></p>
<div style="text-align: center;">
<table class="image center" align="center">
<tbody>
<tr>
<td><em><img src="https://baonamdinh.vn/file/e7837c02816d130b0181a995d7ad7e96/102024/untitled-1_20241015074751.jpg" alt="Mỗi năm Hợp t&aacute;c x&atilde; sản xuất v&agrave; thương mại T&acirc;n Kh&aacute;nh, x&atilde; Minh T&acirc;n xuất b&aacute;n ra thị trường tr&ecirc;n 100 tấn c&aacute; ch&eacute;p Koi."></em></td>
</tr>
<tr>
<td class="desc"><em>Mỗi năm Hợp t&aacute;c x&atilde; sản xuất v&agrave; thương mại T&acirc;n Kh&aacute;nh, x&atilde; Minh T&acirc;n xuất b&aacute;n ra thị trường tr&ecirc;n 100 tấn c&aacute; ch&eacute;p Koi.</em></td>
</tr>
</tbody>
</table>
</div>
<p style="text-align: center;">Về T&acirc;n Kh&aacute;nh, nhắc đến &ldquo;Vua c&aacute; Koi&rdquo;, người d&acirc;n địa phương kh&ocirc;ng ai l&agrave; kh&ocirc;ng biết anh Phạm Đức Thuần, Chủ tịch HĐQT ki&ecirc;m Gi&aacute;m đốc HTX Sản xuất v&agrave; thương mại T&acirc;n Kh&aacute;nh. Lo&agrave;i thủy sản được giới thiệu l&agrave; vật nu&ocirc;i "qu&yacute; tộc" n&agrave;y l&agrave; loại c&aacute; cảnh xuất xứ từ Nhật Bản, hiện được thị trường săn đ&oacute;n. Kh&ocirc;ng chỉ l&agrave; một trong những người ti&ecirc;n phong đưa con c&aacute; ch&eacute;p Koi về bổ sung v&agrave;o danh s&aacute;ch con nu&ocirc;i thủy sản c&oacute; gi&aacute; trị, anh Thuần c&ograve;n l&agrave; &ldquo;đầu t&agrave;u&rdquo; k&eacute;o ng&agrave;nh nu&ocirc;i c&aacute; Koi ở địa phương ph&aacute;t triển vững chắc, đem lại lợi &iacute;ch kinh tế lớn cho người nu&ocirc;i. HTX kh&ocirc;ng chỉ sản xuất c&aacute; thương phẩm m&agrave; c&ograve;n ương nu&ocirc;i th&agrave;nh c&ocirc;ng c&aacute; giống cung cấp cho thị trường; li&ecirc;n kết với hơn 100 đại l&yacute; chuy&ecirc;n mua b&aacute;n c&aacute; cảnh tr&ecirc;n khắp cả nước để bao ti&ecirc;u sản phẩm cho c&aacute;c th&agrave;nh vi&ecirc;n. Hiện anh đang sở hữu một trang trại nu&ocirc;i c&aacute; Koi rộng 7,2ha được quy hoạch khoa học với hệ thống c&aacute;c ao nu&ocirc;i li&ecirc;n kết chặt chẽ với nhau c&ugrave;ng hệ thống bể ương, nu&ocirc;i dưỡng đầy đủ m&aacute;y sủi &ocirc;-xy, c&oacute; m&aacute;i che nắng, che mưa&hellip;&nbsp;</p>',
N'huy',N'Hỏa',N'Approved'),

(N'AD363',N'Dịch vụ vệ sinh hồ cá Koi, chữa bệnh cá ở TPHCM , Đồng Nai, Củ Chi Dịch vụ vệ sinh hồ cá Koi, chữa bệnh cá ở TPHCM , Đồng Nai, Củ Chi Dịch vụ vệ sinh hồ cá Koi, chữa bệnh cá ở TPHCM , Đồng Nai, Củ Chi',
N'https://i-raovat.vnecdn.net/2024/07/03/b73465ad_1719989584.jpg?w=1280&h=768&q=100&dpr=1&rt=fit&g=no&wmi=&wmg=ce&wmo=50&wms=30&wmx=0&wmy=0&s=2jr8PPQFtm8x7RWzEOLXpg',
N'<p style="text-align: left;">C&aacute; Koi l&agrave; một trong những loại c&aacute; cảnh được nhập từ nước ngo&agrave;i về với gi&aacute; rất đắt. V&igrave; l&agrave; một lo&agrave;i c&aacute; kh&oacute; nu&ocirc;i, n&ecirc;n hồ c&aacute; Koi cũng đ&ograve;i hỏi rất khắc khe so với c&aacute;c loại hồ nu&ocirc;i c&aacute; kh&aacute;c. Việc vệ sinh hồ c&aacute; Koi cũng kh&ocirc;ng đơn giản, n&ecirc;n nếu cần h&atilde;y t&igrave;m đến dịch vụ vệ sinh hồ c&aacute; Koi của ch&uacute;ng t&ocirc;i ở Hồ Ch&iacute; Minh.&nbsp;<br>Những dấu hiệu cho thấy cần vệ sinh cho hồ c&aacute; Koi:&nbsp;<br>&ndash; Nước trong hồ c&aacute; Koi bắt đầu ngả m&agrave;u xanh lam, bắt đầu c&oacute; dấu hiệu đục nguồn nước, kh&ocirc;ng quan s&aacute;t được c&aacute; trong hồ, r&ecirc;u tảo xanh ph&aacute;t triển qu&aacute; nhiều khiến hồ bị đục nước.&nbsp;<br>&ndash; Sau một thời gian d&agrave;i vận h&agrave;nh, m&aacute;y lọc của hồ bắt đầu kh&ocirc;ng c&ograve;n được hoạt động tốt nữa. L&aacute; c&acirc;y rơi xuống l&agrave;m mất mỹ quan của hồ v&agrave; g&oacute;p phần l&agrave;m &ocirc; nhiễm nguồn nước của hồ. G&acirc;y kh&oacute; khăn cho việc hoạt động của hệ thống lọc nước của hồ c&aacute; Koi.&nbsp;<br>&ndash; Do c&aacute;ch cho c&aacute; ăn kh&ocirc;ng đ&uacute;ng c&aacute;ch l&agrave;m cho thức ăn thừa ứ đọng lại dưới đ&aacute;y bể cũng như ph&acirc;n c&aacute; sau thời gian d&agrave;i sẽ rất nhiều l&agrave;m cho đ&aacute;y hồ c&aacute; Koi kh&ocirc;ng c&ograve;n tho&aacute;ng v&agrave; đẹp như l&uacute;c trước.&nbsp;<br>&ndash; Ngo&agrave;i ra lượng chất thải qu&aacute; nhiều m&agrave; kh&ocirc;ng được xử l&yacute; kịp sẽ sinh ra nhiều loại vi khuẩn, c&aacute;c loại vi khuẩn n&agrave;y kh&ocirc;ng chỉ l&agrave;m nước đục m&agrave; c&ograve;n c&oacute; thể sinh ra nhiều bệnh v&agrave; nghi&ecirc;m trọng hơn l&agrave; c&oacute; thể g&acirc;y chết c&aacute;.&nbsp;<br>&ndash; Hồ c&oacute; đầy r&aacute;c tr&ecirc;n bề mặt cũng l&agrave; một dấu hiệu n&ecirc;n vệ sinh hồ c&aacute;.&nbsp;<br>&ndash; Hồ c&aacute; trước đ&oacute; c&oacute; nhiều c&aacute; chết, c&oacute; nhiều v&aacute;ng bọt nổi tr&ecirc;n bề mặt, th&igrave; cần vệ sinh để khong g&acirc;y hại cho c&aacute; kh&aacute;c v&igrave; hồ đ&atilde; bị nhiễm khuẩn c&oacute; hại.&nbsp;<br>Quang Minh Landscape cung cấp dịch vụ https://cayxanhhcm.com.vn/thiet-ke-va-thi-cong-ho-ca-koi/ tại Đồng Nai, TPHCM, B&igrave;nh Dương, BRVT&hellip; Li&ecirc;n hệ với ch&uacute;ng t&ocirc;i qua Hotline 0792.662.678 để được tư vấn tận t&igrave;nh, cụ thể 24/7</p>',
N'huy',N'Kim',N'Approved'),

(N'AD419', N'Bán cá Koi Nhật Bản chất lượng cao tại Biên Hòa', 
N'https://cakoibienhoa.com/themes/template/images/fb_default.jpg', 
N'<h2 class="detail-sapo" style="text-align: center;" data-role="sapo">Cá Koi Nhật Bản - Biểu tượng của sự may mắn và thịnh vượng. Chúng tôi chuyên cung cấp cá Koi nhập khẩu trực tiếp từ Nhật Bản với chất lượng đảm bảo, kích thước đa dạng, phù hợp với mọi nhu cầu.</h2> 
<p style="text-align: center;"><img src="https://cakoibienhoa.com/themes/template/images/fb_default.jpg" alt="Cá Koi Nhật Bản chất lượng cao"></p> 
<p style="text-align: center;">Cá Koi của chúng tôi được nuôi dưỡng theo tiêu chuẩn Nhật Bản, với màu sắc đa dạng, sức sống mạnh mẽ và không mang mầm bệnh. Đội ngũ chuyên gia sẽ hỗ trợ tư vấn chăm sóc hồ cá Koi tận tình.</p> 
<p style="text-align: center;">Chúng tôi cam kết:</p> 
<ul> 
<li>Nhập khẩu cá Koi trực tiếp từ các trại cá uy tín ở Nhật Bản</li> 
<li>Cung cấp dịch vụ bảo hành sức khỏe cá trong 1 tháng</li> 
<li>Tư vấn miễn phí về thiết kế hồ cá và cách chăm sóc</li> 
<li>Vận chuyển toàn quốc, đảm bảo an toàn tuyệt đối cho cá Koi</li> 
</ul> 
<p style="text-align: center;">Liên hệ ngay để sở hữu những chú cá Koi đẳng cấp, mang lại may mắn và tài lộc cho gia đình bạn!</p>', 
N'khoa', N'Thủy', N'Approved'),

(N'AD885', N'Bán cá Koi Nhật Bản nhập khẩu - Cá cảnh cao cấp tại Thủ Đức, TPHCM', 
N'https://inhat.vn/wp-content/uploads/2021/03/ca-koi-tphcm-9.jpg', 
N'<h2 class="detail-sapo" style="text-align: center;" data-role="sapo">Cung cấp cá Koi Nhật Bản, biểu tượng may mắn và thịnh vượng, nhập khẩu trực tiếp từ Nhật Bản với đa dạng màu sắc và kích thước.</h2> 
<p style="text-align: center;"><img src="https://cdn-i.vtcnews.vn/resize/th/upload/2024/03/04/cafe-koikichi-19403461.jpg" alt="Cá Koi Nhật Bản chất lượng cao"></p> 
<p style="text-align: center;">Cá Koi của chúng tôi được nuôi dưỡng theo tiêu chuẩn Nhật Bản, với sức sống bền bỉ, không mang mầm bệnh và được kiểm định kỹ lưỡng trước khi đến tay khách hàng.</p> 
<p style="text-align: center;">Chúng tôi cam kết:</p> 
<ul> 
<li>Nhập khẩu trực tiếp từ các trại cá Koi uy tín tại Nhật Bản</li> 
<li>Cung cấp dịch vụ bảo hành sức khỏe cá trong 1 tháng</li> 
<li>Tư vấn thiết kế và bảo trì hồ cá miễn phí</li> 
<li>Vận chuyển an toàn toàn quốc</li> 
</ul> 
<p style="text-align: center;">Liên hệ ngay để sở hữu những chú cá Koi tuyệt đẹp, mang lại tài lộc và may mắn!</p>', 
N'khoa', N'Thổ', N'Approved'),

(N'AD126', N'Bán cá Koi Nhật Bản cao cấp - Đa dạng màu sắc và kích thước', 
N'https://hcmtoplist.com/wp-content/uploads/2022/06/ca-canh-hong-ngoc-thu-duc-hcmtoplist.jpg', 
N'<p style="text-align: center;">- Chúng tôi cung cấp cá Koi Nhật Bản, biểu tượng của sự may mắn và thịnh vượng, nhập khẩu trực tiếp từ Nhật Bản với đa dạng màu sắc và kích thước.<br>- Cá Koi được nuôi dưỡng và kiểm tra sức khỏe định kỳ theo tiêu chuẩn nghiêm ngặt, đảm bảo không bệnh tật và sức khỏe tốt trước khi đến tay khách hàng.<br>- Chúng tôi còn cung cấp các dịch vụ như bảo hành sức khỏe cá trong 1 tháng, tư vấn thiết kế và bảo trì hồ cá miễn phí.<br>- Cá được vận chuyển toàn quốc với quy trình an toàn và chuyên nghiệp.</p>
<p style="text-align: center;"><img src="https://lh4.googleusercontent.com/-AS1lzLCGTNY/UhotkitWW4I/AAAAAAAABIg/1waPcLknTqM/w640-h480-no/ca-chep-koi.jpg" alt="Cá Koi Nhật Bản cao cấp"></p> 
<p style="text-align: center;">Liên hệ ngay để được tư vấn và sở hữu những chú cá Koi đẹp mắt, mang lại tài lộc và sự thịnh vượng.</p> 
<p style="text-align: center;">Công ty Koi Việt<br>Tel: 0933.549.011<br>E-mail: koiviet@gmail.com<br>Website: https://www.koiviet.com</p>', 
N'khoa', N'Thổ', N'Approved'),

(N'AD551', N'Café Koi - Thư giãn cùng những chú cá Koi tuyệt đẹp', 
N'https://mia.vn/media/uploads/blog-du-lich/cafe-koikichi-1704808859.jpg', 
N'<p style="text-align: center;">- Trải nghiệm không gian thư giãn với hồ cá Koi tuyệt đẹp tại Café Koi, nơi bạn có thể thưởng thức cà phê và ngắm nhìn những chú cá Koi bơi lội trong không gian yên bình.<br>- Chúng tôi cung cấp đa dạng các loại đồ uống: cà phê, trà, sinh tố và bánh ngọt trong không gian thiên nhiên xanh mát.<br>- Đây là địa điểm lý tưởng để gặp gỡ bạn bè, họp nhóm hoặc thư giãn sau những giờ làm việc căng thẳng.<br>- Với dịch vụ tận tình và không gian thoáng đãng, Café Koi mang đến trải nghiệm độc đáo và thư thái cho quý khách.</p> 
<p style="text-align: center;"><img src="https://mia.vn/media/uploads/blog-du-lich/coffe-cay-loc-vung-1704809014.jpg" alt="Café Koi - Thư giãn cùng cá Koi"></p> 
<p style="text-align: center;">Địa chỉ: 123 Đường Bình An, Quận Thủ Đức, TP.HCM<br>Tel: 0933.549.011<br>E-mail: cafekoi@gmail.com<br>Website: https://www.cafekoi.com</p>', 
N'nhan', N'Thủy', N'Approved'),

(N'AD004',N'Cà phê Koi – Không gian thư giãn tuyệt vời',N'https://sgl.com.vn/wp-content/uploads/2021/10/quin-koi-coffee-garden.jpeg',
N'<p>- Cà phê hương vị đậm đà, được tuyển chọn từ những hạt cà phê nguyên chất.<br>- Không gian Koi độc đáo với hồ cá đẹp mắt, tạo cảm giác thư giãn tuyệt đối.<br>- Dịch vụ phục vụ tận tình và chuyên nghiệp, luôn sẵn sàng đáp ứng nhu cầu của khách hàng.<br>- Thưởng thức nhiều loại thức uống phong phú, từ cà phê đến trà và các món tráng miệng hấp dẫn.<br>- Tổ chức các sự kiện, gặp gỡ bạn bè, hoặc đơn giản chỉ là thư giãn sau một ngày dài.<br>- Địa chỉ: 149/11 Tân Thới Nhất 17, P. Tân Thới Nhất, Q.12, TP.HCM.<br>- Điện thoại: 0972181028&nbsp;<br>- Website: theuvietemb.vn</p>',
N'nhan',N'Thổ',N'Approved'),

(N'AD762',N'Quán cà phê cá Koi tuyệt đẹp',N'https://sanvuonsaigon.vn/wp-content/uploads/2022/08/quan-cafe-ca-koi-thu-duc-koi-lands-coffee-3.jpg',
N'<p>Chào mừng bạn đến với quán cà phê cá Koi tuyệt đẹp, nơi mà hương vị cà phê thơm ngon kết hợp với không gian thư giãn gần gũi với thiên nhiên sẽ mang đến cho bạn những trải nghiệm tuyệt vời nhất.&nbsp;<br>Chúng tôi tự hào mang đến cho bạn:</p>
<ul>
    <li>Cà phê nguyên chất, được pha chế từ những hạt cà phê tuyển chọn, đảm bảo mang đến cho bạn những ly cà phê đậm đà và tinh tế.</li>
    <li>Không gian yên tĩnh, dễ chịu, lý tưởng cho những buổi họp mặt bạn bè, làm việc hay chỉ đơn giản là tìm một góc riêng để thưởng thức cà phê.</li>
    <li>Hồ cá Koi sống động và tuyệt đẹp, giúp bạn cảm thấy thư thái và bình yên trong từng giây phút.</li>
    <li>Đặc sản bánh ngọt và đồ uống hấp dẫn, từ bánh mì nướng giòn tan đến các loại trà thơm, đảm bảo làm hài lòng khẩu vị của bạn.</li>
    <li>Các sự kiện thú vị và chương trình khuyến mãi định kỳ, mang đến những trải nghiệm mới mẻ và bất ngờ cho khách hàng.</li>
</ul>
<p>Hãy đến và trải nghiệm một buổi chiều tuyệt vời tại quán cà phê cá Koi của chúng tôi, nơi mà mỗi giọt cà phê đều được chăm chút, mỗi khoảnh khắc đều đáng giá! Chúng tôi rất mong được chào đón bạn.</p>
<p><img src="https://phongcachmoc.vn/upload/images/tin-tuc/thiet-ke-cafe-ca-koi/thiet-ke-quan-cafe-ca-koi%20(5).jpg" alt="Quán cà phê cá Koi tuyệt đẹp"><br>Quán cà phê cá Koi&nbsp;<br>Điện thoại/Zalo: 0909902061&nbsp;<br>Địa chỉ: Số 123, Đường Koi, Phường Yên Bình, Quận 1, TP HCM&nbsp;<br>Website: https://cafe-koi.vn</p>',
N'nhan',N'Thủy',N'Approved');


INSERT INTO Ads_Package (AdID, Rank,StartDate,ExpiredDate,Quantity,Total,CreateAt) VALUES
(N'AD820',N'Diamond','2024-10-13','2024-11-12',1,6000000,'2024-10-15'),

(N'AD793',N'Diamond','2024-10-11','2024-11-10',1,6000000,'2024-10-15'),

(N'AD363',N'Diamond','2024-10-09','2024-12-08',2,12000000,'2024-10-15'),

(N'AD419',N'Gold','2024-10-01','2024-11-30',2,8000000,'2024-10-15'),

(N'AD885',N'Gold','2024-10-14','2024-12-13',2,8000000,'2024-10-15'),

(N'AD126',N'Gold','2024-09-11','2024-11-10',2,8000000,'2024-10-15'),

(N'AD551',N'Silver','2024-09-11','2024-11-10',2,4000000,'2024-10-15'),

(N'AD004',N'Silver','2024-09-11','2024-11-10',2,4000000,'2024-10-15'),

(N'AD762',N'Silver','2024-09-11','2024-11-10',2,4000000,'2024-10-15');

INSERT INTO Blog (BlogID, Heading,Image,Link,status) VALUES
(N'BL001',N'Xu hướng thiết kế, thi công hồ cá Koi đơn giản',N'https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-768x576.jpg',
N'<p><em>Xu hướng thiết kế, thi c&ocirc;ng hồ c&aacute; Koi đơn giản đang rất được ưa chuộng hiện nay nhờ v&agrave;o việc tiết kiệm&nbsp;<a href="https://hocakoi.vn/chi-phi-thi-cong-ho-ca-koi-chuan-nhat/">chi ph&iacute; thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật</a>&nbsp;vốn kh&ocirc;ng hề rẻ. B&ecirc;n cạnh đ&oacute;, phong c&aacute;ch tối giản v&agrave; hiện đại ng&agrave;y c&agrave;ng được y&ecirc;u th&iacute;ch trong thiết kế cảnh quan s&acirc;n vườn, mang đến t&iacute;nh độc đ&aacute;o cao. H&atilde;y c&ugrave;ng Hocakoi.vn t&igrave;m hiểu xu hướng x&acirc;y dựng hồ c&aacute; ch&eacute;p Nhật mới n&agrave;y trong b&agrave;i viết h&ocirc;m nay nh&eacute;:</em></p>
<h2><span id="Tai_sao_xu_huong_thi_cong_ho_ca_Koi_don_gian_lai_duoc_ua_chuong"><strong>Tại sao xu hướng thi c&ocirc;ng hồ c&aacute; Koi đơn giản lại được ưa chuộng?</strong></span></h2>
<p>Như ở phần đầu ti&ecirc;n của b&agrave;i viết đ&atilde; cho thấy r&otilde; được sự l&ecirc;n ng&ocirc;i của c&aacute;c hồ c&aacute; Koi đơn giản do xu hướng thịnh h&agrave;nh v&agrave; tiết kiệm được chi ph&iacute;. Trước hết, về xu hướng trang tr&iacute; cảnh quan s&acirc;n vườn biệt thự trong những năm gần đ&acirc;y, Hocakoi.vn thấy được rằng, nhu cầu tối giản c&aacute;c hạng mục trang tr&iacute; l&agrave; yếu tố cốt l&otilde;i trong c&aacute;c bạn thiết kế. Giờ đ&acirc;y trong c&aacute;c s&acirc;n vườn cảnh quan, họ kh&ocirc;ng để qu&aacute; nhiều những l&ugrave;m c&acirc;y, bụi cỏ hay tổng hợp nhiều tiểu cảnh trang tr&iacute;. Kh&aacute;ch h&agrave;ng lu&ocirc;n muốn d&agrave;nh một kh&ocirc;ng gian mở, tho&aacute;ng đ&atilde;ng v&agrave; c&oacute; t&iacute;nh thẩm mỹ được c&acirc;n đối h&agrave;i h&ograve;a với tổng thể xung quanh. Nhờ đ&oacute; m&agrave; họ c&oacute; thể c&oacute; th&ecirc;m kh&ocirc;ng gian sinh hoạt giữa khu vườn, s&acirc;n vườn nh&agrave; m&igrave;nh. B&ecirc;n cạnh đ&oacute;, việc đơn giản h&oacute;a cảnh quan cũng gi&uacute;p chủ nh&agrave; c&oacute; thể tiết kiệm c&ocirc;ng sức v&agrave; thời gian để bảo tr&igrave;, bảo dưỡng c&aacute;c tiểu cảnh.</p>
<p><img class="wp-image-1715 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-300x225.jpg" sizes="(max-width: 639px) 100vw, 639px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian.jpg 1024w" alt="Mẫu hồ c&aacute; Koi đơn giản, hiện đại" width="639" height="479" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/thi-cong-ho-ca-koi-don-gian.jpg 1024w"></p>
<p>Tiếp theo, về&nbsp;<a href="https://hocakoi.vn/chi-phi-thi-cong-ho-ca-koi-chuan-nhat/">chi ph&iacute; thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật</a>, c&oacute; thể n&oacute;i, ng&acirc;n s&aacute;ch để x&acirc;y dựng hồ vốn kh&ocirc;ng hề nhỏ. Ngo&agrave;i ra c&ograve;n c&oacute; một loạt c&aacute;c chi ph&iacute; d&agrave;nh cho việc đầu tư c&aacute; Koi, cho bảo dưỡng hồ thường xuy&ecirc;n c&ugrave;ng c&aacute;c vật liệu m&aacute;y m&oacute;c, đ&oacute; l&agrave; chưa kể chi ph&iacute; trang tr&iacute;. Nếu c&oacute; thể tối ưu h&oacute;a trang tr&iacute; hồ c&aacute; Koi cho đơn giản th&igrave; chi ph&iacute; n&agrave;y c&oacute; thể giảm đi đ&aacute;ng kể. B&ecirc;n cạnh đ&oacute;, vốn dĩ hồ c&aacute; Koi đẹp ở việc những ch&uacute; c&aacute; đầy sắc m&agrave;u bơi lội, v&igrave; vậy nếu tiểu cảnh đơn giản sẽ l&agrave;m nổi bật vẻ đẹp tự nhi&ecirc;n của hồ. Kh&ocirc;ng chỉ vậy, với một hồ c&aacute; Koi đơn giản, bạn cũng dễ d&agrave;ng vệ sinh, chăm s&oacute;c hơn.</p>
<h2><span id="Nhung_dieu_can_luu_y_khi_xay_ho_ca_Koi_don_gian"><strong>Những điều cần lưu &yacute; khi x&acirc;y hồ c&aacute; Koi đơn giản</strong></span></h2>
<h3><span id="Khong_toi_gian_cac_thiet_bi_quan_trong_va_he_thong_loc"><em>Kh&ocirc;ng tối giản c&aacute;c thiết bị quan trọng v&agrave; hệ thống lọc</em></span></h3>
<p>Mặc d&ugrave; việc x&acirc;y hồ c&aacute; Koi đơn giản l&agrave; điều n&ecirc;n l&agrave;m, tuy nhi&ecirc;n kh&ocirc;ng phải chỗ n&agrave;o, hạng mục n&agrave;o cũng c&oacute; thể t&ugrave;y tiện cắt bớt, đặc biệt l&agrave; c&aacute;c thiết bị cần thiết v&agrave; hệ thống lọc cho hồ c&aacute; Koi. Việc duy tr&igrave; c&aacute;c thiết bị quan trọng trong vận h&agrave;nh hồ c&aacute; Koi như bơm nước, ống nước, bộ sục kh&iacute; oxy, hệ thống gi&agrave;n lọc mưa hay trống lọc&hellip;l&agrave; điều chắc chắn bạn cần đảm bảo để hoạt động của hồ được b&igrave;nh thường. Nếu bạn muốn tiết kiệm, tối ưu h&oacute;a chi ph&iacute; cho c&aacute;c thiết bị, bộ phận n&agrave;y th&igrave; phải lựa chọn sản phẩm đ&uacute;ng c&ocirc;ng suất với hồ v&agrave; thiết kế bộ lọc đ&aacute;p ứng đủ nhu cầu của hồ ch&iacute;nh thay v&igrave; sử dụng những thiết bị kh&ocirc;ng ph&ugrave; hợp.</p>
<p>Ngo&agrave;i ra bạn c&oacute; thể c&acirc;n nhắc c&oacute; hay kh&ocirc;ng sử dụng c&aacute;c thiết bị như m&aacute;y sưởi, đ&egrave;n UV diệt tảo&hellip;để thay bằng c&aacute;c giải ph&aacute;p kh&aacute;c c&oacute; chi ph&iacute; thấp hơn.</p>
<div>&nbsp;</div>
<h3><span id="Ho_ca_Koi_don_gian_o_cac_canh_quan_nhung_van_phai_co_tinh_tham_my"><em>Hồ c&aacute; Koi đơn giản ở c&aacute;c cảnh quan nhưng vẫn phải c&oacute; t&iacute;nh thẩm mỹ</em></span></h3>
<p><img class="wp-image-1712 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-300x225.jpg" sizes="(max-width: 632px) 100vw, 632px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian.jpg 1600w" alt="Hồ c&aacute; Koi đơn giản trong s&acirc;n vườn" width="632" height="474" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/ho-ca-koi-don-gian.jpg 1600w"></p>
<p>Khi nhắc đến việc x&acirc;y dựng hồ c&aacute; ch&eacute;p Nhật đơn giản th&igrave; chắc hẳn bạn sẽ nghĩ ngay đến việc lược bỏ bớt c&aacute;c hạng mục trang tr&iacute; xung quanh. Điều n&agrave;y l&agrave; đ&uacute;ng tuy nhi&ecirc;n, việc tối ưu h&oacute;a cảnh quan trang tr&iacute; cho hồ c&aacute; Koi n&ecirc;n được c&acirc;n nhắc sao cho thể hiện được phong c&aacute;ch, n&eacute;t độc đ&aacute;o ri&ecirc;ng m&agrave; kh&ocirc;ng bị qu&aacute; đơn điệu, kh&ocirc;ng c&oacute; điểm nhấn. Trang tr&iacute; c&aacute;c tiểu cảnh n&ecirc;n được sắp xếp theo phong c&aacute;ch, h&agrave;i h&ograve;a với kh&ocirc;ng gian chung chứ kh&ocirc;ng n&ecirc;n chỉ đặt một v&agrave;i chậu hoa, một v&agrave;i c&acirc;y cảnh để đơn giản h&oacute;a h&igrave;nh thức nhưng lại kh&ocirc;ng mang đến hiệu ứng thị gi&aacute;c tốt. Điều n&agrave;y cần phải c&oacute; được sự tư vấn từ c&aacute;c chuy&ecirc;n gia d&agrave;y dạn kinh nghiệm, trong đ&oacute; c&oacute; đội ngũ kiến tr&uacute;c sư của Hocakoi.vn lu&ocirc;n sẵn s&agrave;ng tư vấn thiết kế hồ c&aacute; Koi chuẩn Nhật.</p>
<h3><span id="Goi_dich_vu_thi_cong_ho_ca_Koi_Can_ban_cua_Hocakoivn"><em>G&oacute;i dịch vụ thi c&ocirc;ng hồ c&aacute; Koi Căn bản của Hocakoi.vn</em></span></h3>
<p>Hiện nay Hocakoi.vn đang triển khai dịch vụ thi c&ocirc;ng hồ c&aacute; Koi Nhật trọn g&oacute;i với g&oacute;i dịch vụ Căn Bản (Basic). Trong g&oacute;i dịch vụ n&agrave;y, bạn sẽ được trải nghiệm to&agrave;n bộ qu&aacute; tr&igrave;nh tư vấn, thiết kế, thi c&ocirc;ng chất lượng theo ti&ecirc;u chuẩn Nhật Bản, được thực hiện bởi nh&acirc;n sự của Hocakoi.vn. G&oacute;i dịch vụ Căn bản gi&uacute;p bạn tiết kiệm chi ph&iacute; với những c&ocirc;ng tr&igrave;nh hồ c&aacute; Koi cỡ nhỏ cho đến trung b&igrave;nh trong c&aacute;c ng&ocirc;i nh&agrave; c&oacute; diện t&iacute;ch s&acirc;n vườn kh&ocirc;ng qu&aacute; lớn hoặc muốn x&acirc;y dựng một tiểu cảnh hồ Koi đơn giản theo xu hướng. G&oacute;i dịch vụ Căn bản n&agrave;y sẽ đảm bảo mức&nbsp;<a href="https://hocakoi.vn/chi-phi-thi-cong-ho-ca-koi-chuan-nhat/">chi ph&iacute; thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật</a> c&acirc;n đối với ng&acirc;n s&aacute;ch của bạn. Trong g&oacute;i dịch vụ đ&atilde; bao gồm c&aacute;c hạng mục cơ bản nhất của một tiểu cảnh hồ c&aacute; Koi như ho&agrave;n thiện hồ ch&iacute;nh v&agrave; bể lọc, c&aacute;c tiểu cảnh trang tr&iacute; độc đ&aacute;o như k&egrave; đ&aacute; cuội v&acirc;n m&acirc;y 1 lớp, ghềnh th&aacute;c đ&aacute; cổ thạch &ndash; Tuyết sơn hay c&aacute;c loại hoa v&agrave; bụi c&acirc;y cơ bản.</p>',
N'Published'),

(N'BL002',N'Top 10 Mẫu hồ cá Koi giá rẻ',N'https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-768x512.jpg',
N'<h2><span id="Nhung_vi_tri_thich_hop_de_dat_ho_ca_Koi"><strong>Những vị tr&iacute; th&iacute;ch hợp để đặt hồ c&aacute; Koi</strong></span></h2>
<p>Điều quan trọng nhất đối với việc&nbsp;<a href="https://hocakoi.vn/thi-cong-ho-ca-koi-ha-noi-chuan-nhat-gia-re/">thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật gi&aacute; rẻ</a>&nbsp;l&agrave; việc x&aacute;c định vị tr&iacute; lắp đặt th&iacute;ch hợp. Với một vị tr&iacute; thuận lợi cho nước chảy, ph&ugrave; hợp cho việc thải nước bẩn của hồ c&aacute;, thuận lợi cho việc lắp đặt, thi c&ocirc;ng&hellip;th&igrave; bạn đ&atilde; c&oacute; thể tiết kiệm được kha kh&aacute; số tiền cho việc x&acirc;y dựng &ndash; bảo dưỡng, phụ kiện cho hồ rồi. Sau đ&acirc;y Hocakoi.vn sẽ c&ugrave;ng bạn xem x&eacute;t từng vị tr&iacute; lắp đặt hồ c&aacute; Koi để xem với những mẫu hồ c&aacute; Koi gi&aacute; rẻ th&igrave; n&ecirc;n đặt hồ ở đ&acirc;u l&agrave; th&iacute;ch hợp nh&eacute;.</p>
<p>Đầu ti&ecirc;n l&agrave; đặt hồ c&aacute; Koi s&acirc;n vườn nơi bạn c&oacute; thể c&oacute; nhiều kh&ocirc;ng gian để lựa chọn v&agrave; cũng l&agrave; vị tr&iacute; đắc địa nhất cho những ng&ocirc;i nh&agrave; c&oacute; cảnh quan s&acirc;n vườn lớn. Ở vị tr&iacute; n&agrave;y bạn c&oacute; thể lợi dụng cảnh quan tự nhi&ecirc;n sẵn c&oacute; trở th&agrave;nh tiểu cảnh trang tr&iacute; cho hồ m&agrave; kh&ocirc;ng cần phải mất th&ecirc;m chi ph&iacute; trang tr&iacute;. Hơn nữa, bạn c&oacute; thể thoải m&aacute;i lắp đặt, đi đường ống, xả thải hay lấy nguồn nước phục vụ cho hồ c&aacute; Koi. Chi ph&iacute; x&acirc;y dựng thi c&ocirc;ng hồ Koi Nhật ở s&acirc;n vườn sẽ thấp hơn cả so với những vị tr&iacute; m&agrave; Hocakoi.vn đưa ra sau đ&acirc;y. Do đ&oacute;, ưu ti&ecirc;n h&agrave;ng đầu l&agrave; bạn n&ecirc;n thi c&ocirc;ng hồ trong s&acirc;n vườn.</p>
<p><img class="wp-image-1676 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-300x200.jpg" sizes="(max-width: 711px) 100vw, 711px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat.jpg 1200w" alt="Mẫu hồ c&aacute; Koi tận dụng cảnh quan s&acirc;n vườn gi&aacute; rẻ" width="711" height="474" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-300x200.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-chuan-nhat.jpg 1200w"></p>
<p>Tiếp theo, một vị tr&iacute; cũng được rất nhiều người sử dụng khi x&acirc;y dựng hồ c&aacute; Koi l&agrave; trong nh&agrave;. Hồ c&aacute; koi trong nh&agrave; ph&ugrave; hợp với những căn hộ hiện đại kh&ocirc;ng c&oacute; s&acirc;n vườn đủ rộng để thi c&ocirc;ng hơn l&agrave; những ng&ocirc;i nh&agrave; s&acirc;n vườn rộng. Bởi chi ph&iacute; cho việc l&agrave;m hồ Koi trong nh&agrave; cao hơn nhiều do phải c&oacute; kĩ thuật chống thấm cao hơn, việc thiết kế, lắp đặt, x&acirc;y dựng cũng phức tạp hơn v&igrave; c&ograve;n phải c&acirc;n nhắc đến c&aacute;c chi tiết, kết cấu của ng&ocirc;i nh&agrave; c&oacute; sẵn. Hơn nữa tiểu cảnh cho hồ c&aacute; cũng sẽ hạn chế hơn.</p>
<p>V&agrave; cuối c&ugrave;ng l&agrave; kiểu hồ c&aacute; Koi x&acirc;y tr&ecirc;n s&acirc;n thượng &ndash; loại hồ c&aacute; th&iacute;ch hợp cho những ng&ocirc;i nh&agrave; c&oacute; ban c&ocirc;ng hay s&acirc;n thượng rộng, kh&ocirc;ng gian trong nh&agrave; hạn chế hoặc kh&ocirc;ng c&oacute; s&acirc;n vườn. Kiểu hồ n&agrave;y tốn kh&aacute; nhiều chi ph&iacute; so với hai loại hồ trước do vừa phải x&acirc;y dựng ở tr&ecirc;n cao m&agrave; c&ograve;n phải c&acirc;n nhắc th&ecirc;m về kĩ thuật chống thấm, đường đi nước xả thải, hạn chế về kết cấu, x&acirc;y dựng. Do đ&oacute; m&agrave; bạn n&ecirc;n hạn chế vị tr&iacute; n&agrave;y nếu muốn x&acirc;y dựng hồ c&aacute; Koi gi&aacute; thấp.</p>
<div>&nbsp;</div>
<h2><span id="Nhung_dieu_can_thiet_cho_mot_ho_ca_Koi_re_nhung_dam_bao_chat_luong"><strong>Những điều cần thiết cho một hồ c&aacute; Koi rẻ nhưng đảm bảo chất lượng</strong></span></h2>
<p>Để&nbsp;<a href="https://hocakoi.vn/thi-cong-ho-ca-koi-ha-noi-chuan-nhat-gia-re/">thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật gi&aacute; rẻ</a>&nbsp;th&igrave; c&oacute; một số nguy&ecirc;n tắc m&agrave; bạn n&ecirc;n lưu &yacute; để tối ưu chi ph&iacute;. Điều quan trọng nhất m&agrave; bạn n&ecirc;n biết đ&oacute; l&agrave; thay v&igrave; tự l&ecirc;n kế hoạch thi c&ocirc;ng hồ c&aacute; Koi khi chưa c&oacute; đủ kinh nghiệm, hiểu biết th&igrave; bạn n&ecirc;n lựa chọn dịch vụ thi c&ocirc;ng hồ c&aacute; Koi trọn g&oacute;i. Điều n&agrave;y sẽ tiết kiệm thời gian, c&ocirc;ng sức v&agrave; tiền bạc hơn nhiều so với việc bạn tự t&iacute;nh to&aacute;n v&igrave; đội ngũ thi c&ocirc;ng c&oacute; nhiều kinh nghiệm, am hiểu về việc x&acirc;y dựng hồ Koi v&agrave; c&oacute; thể hạch to&aacute;n chi ph&iacute;, đưa ra giải ph&aacute;p tiết kiệm cho c&ocirc;ng tr&igrave;nh. Ngo&agrave;i ra, đội ngũ thi c&ocirc;ng sẽ đảm bảo được chất lượng c&ocirc;ng tr&igrave;nh chuẩn Nhật v&agrave; c&oacute; cả ch&iacute;nh s&aacute;ch bảo h&agrave;nh đi k&egrave;m gi&uacute;p bạn kh&ocirc;ng phải lo lắng khi c&oacute; sự cố xảy ra.</p>
<p>Khi x&acirc;y hồ, bạn cũng n&ecirc;n định h&igrave;nh trước k&iacute;ch thước để ước t&iacute;nh chi ph&iacute; th&iacute;ch hợp. D&ugrave; x&acirc;y hồ c&aacute; k&iacute;ch thước lớn hay nhỏ th&igrave; bạn cũng n&ecirc;n ch&uacute; &yacute; độ s&acirc;u tối thiểu của hồ l&agrave; 0,9m. Nếu muốn tiết kiệm chi ph&iacute; sưởi cho m&ugrave;a đ&ocirc;ng hoặc ở những nơi kh&iacute; hậu lạnh, bạn c&oacute; thể đ&agrave;o hồ s&acirc;u hơn một ch&uacute;t để tr&aacute;nh sự thay đổi nhiệt độ đột ngột, ảnh hưởng đến sức khỏe c&aacute; Koi. Bạn cũng n&ecirc;n t&iacute;nh to&aacute;n kh&ocirc;ng gian hợp l&iacute; sao cho mật độ c&aacute; trong hồ kh&ocirc;ng vượt qu&aacute; 1m3 cho một con c&aacute; Koi cỡ trung b&igrave;nh. Mật độ c&aacute; qu&aacute; d&agrave;y sẽ l&agrave;m hồ nhanh ch&oacute;ng &ocirc; nhiễm, tăng khả năng nhiễm bệnh trong khi mật độ qu&aacute; thưa sẽ l&agrave;m giảm phản xạ của c&aacute;.</p>
<p><img class="wp-image-1560 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-300x225.jpg" sizes="(max-width: 604px) 100vw, 604px" srcset="https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat.jpg 1600w" alt="Hồ c&aacute; Koi k&iacute;ch thước nhỏ nhưng sinh động để tối ưu chi ph&iacute;" width="604" height="453" data-src="https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/toi-uu-van-hanh-ho-ca-koi-nhat.jpg 1600w"></p>
<p>Khi&nbsp;<a href="https://hocakoi.vn/thi-cong-ho-ca-koi-ha-noi-chuan-nhat-gia-re/">thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật gi&aacute; rẻ</a>, trong c&ocirc;ng đoạn đổ b&ecirc; t&ocirc;ng l&ograve;ng hồ v&agrave; cạnh sườn th&igrave; bạn c&oacute; thể c&acirc;n nhắc sử dụng kĩ thuật trải bạt PVC hiện đại gi&uacute;p giảm bớt chi ph&iacute;. Việc l&agrave;m hồ c&aacute; Koi trải bạt cũng gi&uacute;p m&ocirc;i trường nước được c&acirc;n bằng v&agrave; bạn kh&ocirc;ng cần tốn nhiều c&ocirc;ng chăm s&oacute;c trong giai đoạn đầu khi mới nu&ocirc;i c&aacute;. Đối với những hồ c&aacute; Koi cỡ nhỏ th&igrave; bạn c&oacute; thể tham khảo hệ thống lọc gi&agrave;n lọc mưa đơn giản chứ kh&ocirc;ng cần đến c&aacute;c th&ugrave;ng lọc cao cấp, tuy nhi&ecirc;n phải vệ sinh hồ c&aacute; Koi định k&igrave; v&igrave; khả năng lọc triệt để của gi&agrave;n lọc đơn giản l&agrave; kh&ocirc;ng cao, l&acirc;u ng&agrave;y dễ để lại cặn bẩn, mọc r&ecirc;u hay nổi v&aacute;ng d&agrave;y. Hơn nữa bạn n&ecirc;n ch&uacute; &yacute; rằng c&aacute;c thiết bị lọc sẽ phải hoạt động với c&ocirc;ng suất lớn n&ecirc;n để tr&aacute;nh hư hỏng g&acirc;y tổn hại nhiều chi ph&iacute; th&igrave; n&ecirc;n đầu tư loại chất lượng tốt nhất ngay từ đầu.</p>
<p>Ngo&agrave;i ra, đối với tiểu cảnh trang tr&iacute;, bạn c&oacute; thể sử dụng những bụi c&acirc;y, hoa, cỏ đơn giản, trải đ&aacute;, ph&ugrave; hợp với k&iacute;ch cỡ của hồ c&aacute; hay tận dụng ch&iacute;nh khung cảnh tự nhi&ecirc;n. V&agrave; một điều quan trọng kh&ocirc;ng k&eacute;m l&agrave; để cho chi ph&iacute; hồ c&aacute; Koi kh&ocirc;ng qu&aacute; nặng nề, việc thường xuy&ecirc;n theo d&otilde;i, chăm s&oacute;c v&agrave; tự bảo dưỡng hồ c&aacute; Koi cũng như c&aacute;c phụ kiện sẽ gi&uacute;p &iacute;ch rất nhiều cho bạn đấy!</p>
<h2><span id="Top_10_mau_ho_ca_Koi_gia_re_tham_khao"><strong>Top 10 mẫu hồ c&aacute; Koi gi&aacute; rẻ tham khảo</strong></span></h2>
<p>Dưới đ&acirc;y, Hocakoi.vn sẽ gợi &yacute; cho bạn 10 mẫu hồ c&aacute; Koi gi&aacute; rẻ để bạn tham khảo. Ch&uacute;ng t&ocirc;i đ&atilde; từng&nbsp;<a href="https://hocakoi.vn/thi-cong-ho-ca-koi-ha-noi-chuan-nhat-gia-re/">thi c&ocirc;ng hồ c&aacute; Koi chuẩn Nhật gi&aacute; rẻ</a>&nbsp;cho nhiều ng&ocirc;i nh&agrave; v&agrave; những mẫu hồ dưới đ&acirc;y đều rất được ưa chuộng. Ch&uacute;ng ph&ugrave; hợp với những gia đ&igrave;nh c&oacute; kinh ph&iacute; kh&ocirc;ng qu&aacute; cao nhưng vẫn đảm bảo được t&iacute;nh thẩm mỹ v&agrave; chất lượng vận h&agrave;nh.</p>
<p><img class="wp-image-1682 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-300x200.jpg" sizes="(max-width: 610px) 100vw, 610px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re.jpg 1200w" alt="Mẫu hồ c&aacute; Koi Nhật tự nhi&ecirc;n, gi&aacute; rẻ" width="610" height="407" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-300x200.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-nhat-re.jpg 1200w"></p>
<p><img class="wp-image-1681 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-300x225.jpg" sizes="(max-width: 604px) 100vw, 604px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-2048x1536.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-600x450.jpg 600w" alt="Mẫu hồ c&aacute; Koi gi&aacute; rẻ chuẩn Nhật sinh động, độc đ&aacute;o" width="604" height="453" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-2048x1536.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-chuan-nhat-600x450.jpg 600w"></p>
<p><img class="wp-image-1680 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-300x192.jpg" sizes="(max-width: 604px) 100vw, 604px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-300x192.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-1024x656.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-768x492.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-600x385.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re.jpg 1200w" alt="Mẫu hồ c&aacute; Koi gi&aacute; rẻ với tiểu cảnh bụi c&acirc;y hoa cỏ" width="604" height="387" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-300x192.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-300x192.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-1024x656.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-768x492.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re-600x385.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-gia-re.jpg 1200w"></p>
<p><img class="wp-image-1679 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-300x200.jpg" sizes="(max-width: 600px) 100vw, 600px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat.jpg 612w" alt="Mẫu hồ c&aacute; Koi chuẩn Nhật h&igrave;nh tr&ograve;n gi&aacute; rẻ" width="600" height="400" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-300x200.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-koi-chuan-nhat.jpg 612w"></p>
<p><img class="wp-image-1678 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-300x225.jpg" sizes="(max-width: 598px) 100vw, 598px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re.jpg 1280w" alt="Mẫu hồ c&aacute; Koi Nhật mini gi&aacute; rẻ, dễ chăm s&oacute;c" width="598" height="449" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-re.jpg 1280w"></p>
<p><img class="wp-image-1677 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-300x225.jpg" sizes="(max-width: 592px) 100vw, 592px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re.jpg 2048w" alt="Mẫu hồ c&aacute; Koi Nhật gi&aacute; rẻ đơn giản" width="592" height="444" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-nhat-gia-re.jpg 2048w"></p>
<p><img class="wp-image-1675 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-300x225.jpg" sizes="(max-width: 596px) 100vw, 596px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-2048x1536.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-600x450.jpg 600w" alt="Mẫu hồ c&aacute; koi c&oacute; tiểu cảnh gi&aacute; rẻ chuẩn Nhật" width="596" height="447" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-2048x1536.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-gia-re-600x450.jpg 600w"></p>
<p><img class="wp-image-1674 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-300x225.jpg" sizes="(max-width: 593px) 100vw, 593px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re.jpg 1600w" alt="Mẫu hồ c&aacute; Koi chuẩn Nhật gi&aacute; rẻ n&ecirc;n tham khảo" width="593" height="445" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-1024x768.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-768x576.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-1536x1152.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re-600x450.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-re.jpg 1600w"></p>
<p><img class="wp-image-1673 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re-300x225.jpg" sizes="(max-width: 591px) 100vw, 591px" srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re.jpg 533w" alt="Mẫu hồ c&aacute; Koi mini chuẩn Nhật gi&aacute; rẻ" width="591" height="443" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/04/mau-ho-ca-koi-chuan-nhat-gia-re.jpg 533w"></p>
<p><img class="wp-image-1567 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-300x200.jpg" sizes="(max-width: 593px) 100vw, 593px" srcset="https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-1536x1024.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi.jpg 1600w" alt="Thiết kế hồ c&aacute; Koi đơn giản với th&aacute;c nước" width="593" height="395" loading="lazy" data-src="https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-300x200.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-300x200.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-1024x683.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-768x512.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-1536x1024.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi-600x400.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/thac-nuoc-ho-ca-koi.jpg 1600w"></p>',N'Published'),

(N'BL003',N'Những điều cần biết khi xây hồ cá Koi trong nhà',N'https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-768x485.jpg',
N'<h2><span id="Dien_tich_xay_dung_phong_thuy_han_che"><strong>Diện t&iacute;ch x&acirc;y dựng, phong thủy hạn chế?</strong></span></h2>
<p>Nếu như khi x&acirc;y hồ c&aacute; Koi ngo&agrave;i trời, trong s&acirc;n vườn th&igrave; bạn c&oacute; nhiều diện t&iacute;ch, kh&ocirc;ng gian v&agrave; vị tr&iacute; để đặt hồ th&igrave; khi x&acirc;y hồ c&aacute; Koi trong nh&agrave;, c&aacute;c yếu tố như diện t&iacute;ch v&agrave; phong thủy sẽ hạn chế hơn rất nhiều. Diện t&iacute;ch của căn nh&agrave; ngo&agrave;i việc ph&acirc;n bổ cho c&aacute;c ph&ograve;ng chức năng c&ograve;n đặt nhiều đồ đạc v&agrave; nội thất, v&igrave; vậy diện t&iacute;ch để chứa một bể c&aacute; l&agrave; kh&ocirc;ng nhiều. Th&ecirc;m v&agrave;o đ&oacute;, trong&nbsp;<a href="https://hocakoi.vn/cac-buoc-thi-cong-ho-ca-koi-chuan-nhat/">c&aacute;c bước thi c&ocirc;ng hồ c&aacute; Koi</a>, gia chủ thường phải xem x&eacute;t đến yếu tố phong thủy để hợp mệnh, hợp tuổi t&aacute;c để quyết định đến vị tr&iacute;, hướng đặt hồ Koi. Tuy nhi&ecirc;n kh&ocirc;ng phải vị tr&iacute; n&agrave;o th&iacute;ch hợp với phong thủy cũng c&oacute; thể đặt ngay hồ c&aacute; v&agrave;o được m&agrave; c&ograve;n cần t&iacute;nh to&aacute;n để hợp với kết cấu của ng&ocirc;i nh&agrave;.</p>
<p><img class="wp-image-1629 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-300x189.jpg" sizes="(max-width: 703px) 100vw, 703px" srcset="https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-300x189.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-1024x647.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-768x485.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-1536x970.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-2048x1293.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-600x379.jpg 600w" alt="Hồ c&aacute; Koi được đặt trong một g&oacute;c nh&agrave;" width="703" height="443" data-src="https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-300x189.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-300x189.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-1024x647.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-768x485.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-1536x970.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-2048x1293.jpg 2048w, https://hocakoi.vn/wp-content/uploads/2020/03/thi-cong-ho-koi-nhat-trong-nha-600x379.jpg 600w"></p>
<p>Nhưng kh&ocirc;ng phải v&igrave; những yếu tố n&agrave;y m&agrave; kh&ocirc;ng thể x&acirc;y dựng hồ Koi trong nh&agrave;. C&oacute; rất nhiều gia đ&igrave;nh được Hocakoi.vn tư vấn v&agrave; c&oacute; được những bể c&aacute; Koi sinh động, mang đến gi&aacute; trị cho gia chủ. B&iacute; quyết của Hocakoi.vn cho điều n&agrave;y l&agrave; tối ưu h&oacute;a tối đa k&iacute;ch thước x&acirc;y dựng hồ. Kh&ocirc;ng cần một hồ c&aacute; Koi qu&aacute; lớn bạn mới tận hưởng được vẻ đẹp của ch&uacute;ng, miễn l&agrave; l&agrave;m sao ch&uacute;ng hợp l&yacute; với diện t&iacute;ch của căn nh&agrave; v&agrave; được trang tr&iacute; hợp phong c&aacute;ch, &yacute; th&iacute;ch của chủ nh&acirc;n l&agrave; được. B&ecirc;n cạnh đ&oacute;, lựa chọn số lượng v&agrave; loại c&aacute; Koi ph&ugrave; hợp với diện t&iacute;ch của hồ để đảm bảo sự sinh trưởng, ph&aacute;t triển của ch&uacute;ng tốt nhất.</p>
<h2><span id="Chu_trong_den_cac_yeu_to_ki_thuat"><strong>Ch&uacute; trọng đến c&aacute;c yếu tố kĩ thuật</strong></span></h2>
<p>Đối với việc x&acirc;y hồ c&aacute; Koi trong nh&agrave; th&igrave; c&aacute;c yếu tố thi c&ocirc;ng sẽ đ&ograve;i hỏi phức tạp hơn nhiều khi&nbsp;<a href="https://hocakoi.vn/cac-buoc-thi-cong-ho-ca-koi-chuan-nhat/">thi c&ocirc;ng hồ Koi</a>&nbsp;ngo&agrave;i trời. Cụ thể l&agrave;:</p>
<h3><span id="Xay_dung_ho_chinh_va_he_thong_be_lang_loc"><em>X&acirc;y dựng hồ ch&iacute;nh v&agrave; hệ thống bể lắng lọc</em></span></h3>
<p>Việc đặt hồ c&aacute; Koi trong nh&agrave; sẽ đưa ra hai vấn đề m&agrave; bạn c&oacute; thể nh&igrave;n thấy được đ&oacute; l&agrave; c&oacute; n&ecirc;n đ&agrave;o hồ hay n&ecirc;n x&acirc;y hồ trong nh&agrave;? Th&ocirc;ng thường với những ng&ocirc;i nh&agrave; đang x&acirc;y dựng, việc đ&agrave;o hồ dễ d&agrave;ng hơn khi được t&iacute;nh to&aacute;n c&ugrave;ng với c&ocirc;ng tr&igrave;nh tổng thể. Ngược lại đối với những ng&ocirc;i nh&agrave; đ&atilde; ho&agrave;n thiện ki&ecirc;n cố, việc đ&agrave;o hồ trong nh&agrave; c&oacute; nhiều bất lợi v&agrave; kh&oacute; thực hiện, rất dễ ảnh hưởng đến phong thủy, v&igrave; vậy n&ecirc;n x&acirc;y hồ hoặc đặt bể th&igrave; sẽ thuận tiện hơn.</p>
<div>&nbsp;</div>
<p><img class="wp-image-1473 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-300x224.jpg" sizes="(max-width: 652px) 100vw, 652px" srcset="https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-300x224.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-1024x765.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-768x574.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-1536x1147.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-600x448.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat.jpg 1920w" alt="Một hệ thống lọc hồ Koi mini căn bản" width="652" height="487" data-src="https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-300x224.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-300x224.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-1024x765.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-768x574.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-1536x1147.jpg 1536w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat-600x448.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/he-loc-ho-koi-nhat.jpg 1920w"></p>
<p>B&ecirc;n cạnh kết cấu của hồ ch&iacute;nh th&igrave; hệ thống hồ lắng lọc cũng l&agrave; một điều cần được quan t&acirc;m. Vị tr&iacute; đặt hồ lắng lọc thường l&agrave; đi c&ugrave;ng với bể nu&ocirc;i c&aacute; ch&iacute;nh, v&igrave; vậy sẽ đ&ograve;i hỏi sự logic khi đi đường ống trong hồ c&ugrave;ng với c&aacute;c thiết bị, phụ kiện của qu&aacute; tr&igrave;nh lọc sao cho hợp l&iacute; với nguồn nước, kh&ocirc;ng bị cồng kềnh m&agrave; vẫn c&oacute; hoạt động hiệu quả. Đối với c&aacute;c hồ c&aacute; trong nh&agrave; th&igrave; thường l&agrave; loại mini n&ecirc;n c&oacute; thể sử dụng bộ lắng lọc All-in-one, c&aacute;c th&ugrave;ng lọc cỡ vừa v&agrave; nhỏ hoặc c&aacute;c phụ kiện lắng lọc cần thiết ri&ecirc;ng rẽ. Bởi thể t&iacute;ch hồ kh&ocirc;ng qu&aacute; lớn n&ecirc;n kh&ocirc;ng đ&ograve;i hỏi c&ocirc;ng suất cao, thuận tiện cho việc lắp đặt. Một điều cần lưu &yacute; l&agrave; khi đặt bể c&aacute; Koi trong nh&agrave;, tiếng ồn m&aacute;y bơm hay tiếng ồn của m&aacute;y oxy cũng c&oacute; thể ảnh hưởng đến gia đ&igrave;nh, v&igrave; vậy n&ecirc;n lựa chọn c&aacute;c loại phụ kiện &iacute;t g&acirc;y tiếng ồn hoặc thiết kế vị tr&iacute; đặt kh&aacute;c.</p>
<h3><span id="Ky_thuat_chong_tham"><em>Kỹ thuật chống thấm</em></span></h3>
<p>Một yếu tố h&agrave;ng đầu kh&ocirc;ng thể thiếu trong&nbsp;<a href="https://hocakoi.vn/cac-buoc-thi-cong-ho-ca-koi-chuan-nhat/">c&aacute;c bước thi c&ocirc;ng hồ c&aacute; Koi</a>&nbsp;cần được đặc biệt quan t&acirc;m l&agrave; kỹ thuật chống thấm. Việc nước trong hồ ngấm ra nền nh&agrave;, tường nh&agrave;, trước mắt sẽ g&acirc;y n&ecirc;n mất thẩm mỹ v&agrave; sự kh&oacute; chịu. Về l&acirc;u về d&agrave;i, nước trong hồ ngấm ra sẽ dễ g&acirc;y r&ecirc;u mốc, nấm, hiện tượng b&agrave;o m&ograve;n ảnh hưởng đến kết cấu trung của ng&ocirc;i nh&agrave;. Do đ&oacute;, việc xử l&yacute; chống thấm đ&ograve;i hỏi kỹ thuật cao v&agrave; nghi&ecirc;m ngặt hơn nhiều trong việc x&acirc;y hồ c&aacute; Koi trong nh&agrave;.</p>
<p><img class="wp-image-1363 aligncenter lazy-load-active" src="https://hocakoi.vn/wp-content/uploads/2020/03/13.2-300x225.jpg" sizes="(max-width: 628px) 100vw, 628px" srcset="https://hocakoi.vn/wp-content/uploads/2020/03/13.2-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-1024x767.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-768x575.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-600x449.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2.jpg 1179w" alt="X&acirc;y dựng hồ ch&iacute;nh v&agrave; hồ lắng lọc của bể c&aacute; Koi" width="628" height="471" data-src="https://hocakoi.vn/wp-content/uploads/2020/03/13.2-300x225.jpg" data-srcset="https://hocakoi.vn/wp-content/uploads/2020/03/13.2-300x225.jpg 300w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-1024x767.jpg 1024w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-768x575.jpg 768w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2-600x449.jpg 600w, https://hocakoi.vn/wp-content/uploads/2020/03/13.2.jpg 1179w"></p>
<p>Tại Hocakoi.vn, khi thi c&ocirc;ng c&aacute;c c&ocirc;ng tr&igrave;nh hồ c&aacute; Koi trong nh&agrave;, ch&uacute;ng t&ocirc;i đặc biệt ch&uacute; trọng đến c&aacute;c loại vật liệu chống thấm chất lượng cao cho đ&aacute;y hồ v&agrave; th&agrave;nh hồ b&ecirc;n cạnh việc đổ b&ecirc; t&ocirc;ng v&agrave; tr&aacute;ng xi măng theo quy tr&igrave;nh th&ocirc;ng thường. Ngo&agrave;i ra trong qu&aacute; tr&igrave;nh thi c&ocirc;ng, việc lu l&egrave;n đất đ&aacute;, kỹ thuật l&agrave;m vữa, b&ecirc; t&ocirc;ng v&agrave; x&acirc;y dựng cũng hết sức được ch&uacute; trọng để hạn chế nhất t&igrave;nh trạng thấm nước.</p>
<h3><span id="He_thong_xa_thai_chong_tran_va_ve_sinh_ho"><em>Hệ thống xả thải, chống tr&agrave;n v&agrave; vệ sinh hồ</em></span></h3>
<p>Đối với hồ c&aacute; Koi, trong qu&aacute; tr&igrave;nh lắng lọc th&igrave; việc thiết lập hệ thống xả thải v&agrave; chống tr&agrave;n cũng rất quan trọng. Nếu đối với s&acirc;n vườn th&igrave; vị tr&iacute; xả thải c&oacute; thể thoải m&aacute;i miễn l&agrave; thuận tiện với sự bố tr&iacute; của hồ hay cảnh quan chung th&igrave; hệ thống xả thải trong nh&agrave; c&oacute; phần rắc rối v&igrave; kh&ocirc;ng thể xả chất thải bừa b&atilde;i. Điều n&agrave;y c&oacute; thể hạn chế bằng c&aacute;ch thiết lập đường ống d&agrave;i hoặc c&oacute; c&aacute;c th&ugrave;ng đựng chất thải ri&ecirc;ng v&agrave; c&oacute; thời gian lắng lọc hồ cố định. Th&ecirc;m v&agrave;o đ&oacute; hồ c&aacute; Koi trong nh&agrave; n&ecirc;n c&oacute; hệ thống chống tr&agrave;n để tr&aacute;nh t&igrave;nh trạng nước trong hồ tr&agrave;n ra ngo&agrave;i.</p>',N'Published');