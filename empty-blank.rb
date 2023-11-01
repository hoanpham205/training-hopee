Trong Ruby, có hai phương thức mà bạn thường gặp để kiểm tra xem một chuỗi hoặc mảng có rỗng hay không: `empty?` và `blank?`. 
Dưới đây là sự so sánh giữa chúng:

1. **empty?**: Phương thức `empty?` là một phương thức cơ bản của Ruby. Nó kiểm tra xem một chuỗi hoặc mảng có rỗng
 (không có phần tử) hay không. Kết quả trả về `true` nếu rỗng và `false` nếu không rỗng.

    ```ruby
    string = ""
    array = []

    string.empty?  # true
    array.empty?   # true
    ```

2. **blank?**: Phương thức `blank?` thường không có sẵn trong Ruby chuẩn mà nó thường được thêm bởi các thư viện 
như ActiveSupport trong Ruby on Rails. `blank?` kiểm tra xem một chuỗi hoặc mảng có rỗng hoặc chỉ chứa khoảng trắng 
(hoặc giá trị tương tự) hay không. Kết quả trả về `true` nếu rỗng hoặc chỉ chứa khoảng trắng và `false` nếu không.

    ```ruby
    require 'active_support/core_ext/object/blank'

    string = "   "
    array = [nil, ""]

    string.blank?  # true
    array.blank?   # true
    ```

**Lưu ý**: Để sử dụng `blank?`, bạn cần thêm thư viện ActiveSupport hoặc tương tự. Nó không có sẵn trong Ruby chuẩn.
 Nếu bạn làm việc trong môi trường Ruby on Rails, thì `blank?` là một phương thức tiện ích mạnh mẽ để kiểm tra giá trị 
 rỗng hoặc chỉ chứa khoảng trắng.