class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
         
         
    has_many :reviews, dependent: :destroy
    has_many :comments, dependent: :destroy
         
         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :first_name_kana, presence: true
         validates :last_name_kana, presence: true
         validates :postcode, presence: true
         validates :address, presence: true
         validates :telephone_number, presence: true
         validates :birthday, presence: true
         
         
   
    
    
    
    def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.last_name = "ゲスト"
      user.first_name = "ネーム"
      user.last_name_kana = "ゲスト"
      user.first_name_kana = "ネーム"
      user.postcode = "ゲスト住所"
      user.address = "ゲスト住所"
      user.telephone_number = "000-0000-0000"
      user.birthday = "1900年01年01日"
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
    end
    end
end
