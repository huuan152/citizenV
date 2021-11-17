# citizenV

## Cách chạy:
### backend
```
cd backend
sudo docker-compose run citizen python manage.py migrate
docker-compose up
```

**Lưu ý:** khi muốn push code lên phải chuyển về thư mục gốc. nếu không có thể làm hỏng cấu trúc file.
ví dụ: terminal đang là: ```citizenV/frontend``` thì:
```
cd ..
git add [tên file/thư mục] # không dùng "git add ." vì có thể  làm hỏng code của thành viên còn lại
git commit -m "note"
git push -u origin [tên nhánh]
```
Mỗi người tạo một nhánh.

**A+**