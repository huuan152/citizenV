export const ListCitizensTitles = [
    "Số CMND/CCCD",
    "Họ và tên",
    "Ngày sinh",
    "Giới tính",
    "Dân tộc",
    "Tôn giáo",
    "Trình độ học vấn",
    "Nghề nghiệp",
    "Quê quán",
    "Địa chỉ thường trú",
    "Địa chỉ tạm trú"
];

export const citizen_columns = [
    {id: "id_number",  label:"Số CMND/CCCD", minWidth: "125px"},
    {id: "name",  label:"Họ và tên", minWidth: "200px"},
    {id: "dob",  label:"Ngày sinh", minWidth: "75px"},
    {id: "gender",  label:"Giới tính", minWidth: "100px"},
    {id: "ethnic",  label:"Dân tộc", minWidth: "75px"},
    // {id: "religion",  label:"Tôn giáo"},
    // {id: "educational",  label:"Trình độ học vấn"},
    // {id: "occupations",  label:"Nghề nghiệp"},
    // {id: "home_town",  label:"Quê quán"},
    // {id: "address_line1",  label:"Địa chỉ thường trú"},
    // {id: "address_line2",  label:"Địa chỉ tạm trú"},
];

export const citizen_columns_full = [
    {id: "id_number",  label:"Số CMND/CCCD", minWidth: "125px"},
    {id: "name",  label:"Họ và tên", minWidth: "150px"},
    {id: "dob",  label:"Ngày sinh", minWidth: "75px"},
    {id: "gender",  label:"Giới tính", minWidth: "80px"},
    {id: "ethnic",  label:"Dân tộc"},
    {id: "religion",  label:"Tôn giáo"},
    {id: "educational",  label:"Trình độ học vấn"},
    {id: "occupations",  label:"Nghề nghiệp"},
    {id: "village_id",  label:"Thôn/Bản/Tổ"},
    {id: "home_town",  label:"Quê quán"},
    {id: "address_line1",  label:"Địa chỉ thường trú"},
    {id: "address_line2",  label:"Địa chỉ tạm trú"},
];

export const searchByCitizen = [
    {value: "id_number",  label:"Số CMND/CCCD"},
    {value: "name",  label:"Họ và tên"},
    {value: "dob",  label:"Ngày sinh"},
    // {value: "gender",  label:"Giới tính"},
    {value: "ethnic",  label:"Dân tộc"},
    /* {value: "religion",  label:"Tôn giáo"}, */
    // {value: "educational",  label:"Trình độ học vấn"},
    // {value: "occupations",  label:"Nghề nghiệp"},
    // {value: "home_town",  label:"Quê quán"},
    // {value: "address_line1",  label:"Địa chỉ thường trú"},
    // {value: "address_line2",  label:"Địa chỉ tạm trú"},
];

export const LearningLevels = [
    {value: 'none', name:"Không"},
    {value: 'primary', name:"Tiểu học"},
    {value: 'secondary', name:"Trung học cơ sở"},
    {value: 'high', name:"Trung học phổ thông"},
    {value: 'university', name:"Cao đẳng / Đại học"},
    {value: 'master', name:"Sau đại học"}
    // "Tiểu học",
    // "Trung học cơ sở",
    // "Trung học phổ thông",
    // "Cao đẳng / Đại học",
    // "Sau đại học",
];

export const educational = {
    none: "Không",
    primary: "Tiểu học",
    secondary: "Trung học cơ sở",
    high: "Trung học phổ thông",
    university: "Cao đẳng / Đại học",
    master: "Sau đại học"
}

export const gender = {
    male: "Nam",
    female: "Nữ"
} 

export const Ethnics = [
    "Kinh",
    "Ba-na",
    "Bố Y",
    "Brâu",
    "Bru-Vân Kiều",
    "Chăm",
    "Chơ-ro",
    "Chu-ru",
    "Chứt",
    "Co",
    "Cống",
    "Cơ-ho",
    "Cơ Lao",
    "Cơ-tu",
    "Dao",
    "Ê-đê",
    "Giáy",
    "Gia-rai",
    "Gié-Triêng",
    "Hà nhì",
    "Hoa",
    "Hrê",
    "Hmông",
    "Kháng",
    "Khơ-me",
    "Khơ-mú",
    "La Chí",
    "La Ha",
    "La Hủ",
    "Lào",
    "Lô lô",
    "Lự",
    "Mạ",
    "Mảng",
    "Mường",
    "Mnông",
    "Ngái",
    "Nùng",
    "Ơ Đu",
    "Pà Thẻn",
    "Phù Lá",
    "Pu Péo",
    "Ra-glai",
    "Rơ-măm",
    "Sán Chay",
    "Sán Dìu",
    "Si La",
    "Tày",
    "Tà-ôi",
    "Thái",
    "Thổ",
    "Xinh-mun",
    "Xơ-đăng",
    "Xtiêng"
];

export const Religions = [
    "Không",
    "Bà-la-môn giáo", 
    "Baha’I", 
    "Bửu Sơn Kỳ Hương",
    "Cao đài", 
    "Công giáo", 
    "Cơ đốc Phục lâm", 
    "Hồi giáo", 
    
    "Mặc môn", 
    "Minh lý đạo - Tam Tông Miếu", 
    "Minh Sư đạo", 
    "Phật giáo", 
    "Phật giáo Hiếu Nghĩa Tà Lơn", 
    "Phật giáo Hòa Hảo", 
    "Phật giáo Tứ Ân Hiếu nghĩa", 
    "Tịnh độ Cư sỹ Phật hội", 
    "Tin lành", 
];
export const Occupations = [
    "Công chức",
    // "Nhà chuyên môn bậc cao (đại học trở lên)",
    // "Nhà chuyên môn bậc trung (cao đẳng, trung cấp)",
    "Nhân viên văn phòng",
    "Nhân viên dịch vụ và bán hàng",
    "Lao động có kỹ năng trong nông nghiệp, lâm nghiệp và thủy sản",
    // "Lao động thủ công và các nghề nghiệp có liên quan khác",
    "Thợ lắp ráp và vận hành máy móc, thiết bị",
    "Lao động giản đơn",
    "Lực lượng vũ trang",
    "Tự do"
];

export const HomeTowns = [
    "An Giang",
    "Bà Rịa – Vũng Tàu",
    "Bạc Liêu",
    "Bắc Giang",
    "Bắc Kạn",
    "Bắc Ninh",
    "Bến Tre",
    "Bình Dương",
    "Bình Định",
    "Bình Phước",
    "Bình Thuận",
    "Cà Mau",
    "Cao Bằng",
    "Cần Thơ",
    "Đà Nẵng",
    "Đắk Lắk",
    "Đắk Nông",
    "Điện Biên",
    "Đồng Nai",
    "Đồng Tháp",
    "Gia Lai",
    "Hà Giang",
    "Hà Nam",
    "Hà Nội",
    "Hà Tĩnh",
    "Hải Dương",
    "Hải Phòng",
    "Hậu Giang",
    "Hòa Bình",
    "Hồ Chí Minh",
    "Hưng Yên",
    "Khánh Hòa",
    "Kiên Giang",
    "Kon Tum",
    "Lai Châu",
    "Lạng Sơn",
    "Lào Cai",
    "Lâm Đồng",
    "Long An",
    "Nam Định",
    "Nghệ An",
    "Ninh Bình",
    "Ninh Thuận",
    "Phú Thọ",
    "Phú Yên",
    "Quảng Bình",
    "Quảng Nam",
    "Quảng Ngãi",
    "Quảng Ninh",
    "Quảng Trị",
    "Sóc Trăng",
    "Sơn La",
    "Tây Ninh",
    "Thái Bình",
    "Thái Nguyên",
    "Thanh Hóa",
    "Thừa Thiên Huế",
    "Tiền Giang",
    "Trà Vinh",
    "Tuyên Quang",
    "Vĩnh Long",
    "Vĩnh Phúc",
    "Yên Bái",
]; 