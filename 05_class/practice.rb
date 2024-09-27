
# create a new Class, Room, that has the following attributes:
# - name
# - description
class Room
    attr_accessor :name, :description
    
    def initialize(name, description)
      @name = name
      @description = description
    end
  end
  
  # ตัวอย่างการสร้างห้องใหม่
  room = Room.new("ห้องนั่งเล่น", "สถานที่พักผ่อนย่อนใจ")
  puts room.name          # Output: ห้องนั่งเล่น
  puts room.description   # Output: ห้องนอน
  
# create a new Class, Message, that has the following attributes:
# - user
# - room
# - content
class Message
    attr_accessor :user, :room, :content
    
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  # ตัวอย่างการสร้างข้อความใหม่
  message = Message.new("ฟิล์ม", "ห้องนั่งเล่น", "สวัสดี")
  puts message.user      
  puts message.room     
  puts message.content   
  
# add a method to user so, user can enter to a room
# user.enter_room(room)
class User
    attr_accessor :name, :current_room
    
    def initialize(name)
      @name = name
      @current_room = nil
    end
  
    def enter_room(room)
      @current_room = room
      puts "#{@name} อยู่ใน #{room.name}."
    end
  end
  
  class Room
    attr_accessor :name, :description
    
    def initialize(name, description)
      @name = name
      @description = description
    end
  end
  
  user = User.new("ฟิล์ม")
  living_room = Room.new("ห้องนั่งเล่น", "สถานที่พักผ่อนย่อนใจ")

  user.enter_room(living_room)
  puts "ห้องปัจจุบัน: #{user.current_room.name}"   

# add a method to user so, user can send a message to a room
# user.send_message(room, message)
# user.ackowledge_message(room, message)
class User
    attr_accessor :name, :current_room
    
    def initialize(name)
      @name = name
      @current_room = nil
    end
  
    def enter_room(room)
      @current_room = room
      puts "#{@name} เข้าสู่ #{room.name}."
    end
  
    def send_message(room, content)
      message = Message.new(@name, room, content)
      room.messages << message
      puts "#{@name} ส่งข้อความไปที่ #{room.name}: #{content}"
    end
  
    def acknowledge_message(room, message)
      puts "#{@name} ยืนยันข้อความ: '#{message.content}' จาก #{room.name}."
    end
  end
  
  class Room
    attr_accessor :name, :description, :messages
    
    def initialize(name, description)
      @name = name
      @description = description
      @messages = [] 
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
    
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end

  user = User.new("ฟิล์ม")
  living_room = Room.new("ห้องนั่งเล่น", "สถานที่พักผ่อนย่อนใจ.")

  user.enter_room(living_room)
  
  user.send_message(living_room, "สวัสดี")
  
  message = living_room.messages.last  
  user.acknowledge_message(living_room, message)
  

# add a method to a room, so it can broadcast a message to all users
# room.broadcast(message)

class User
    attr_accessor :name, :current_room
    
    def initialize(name)
      @name = name
      @current_room = nil
    end
  
    def enter_room(room)
      @current_room = room
      room.add_user(self)  
      puts "#{@name} เข้าสู่ #{room.name}."
    end
  
    def send_message(content)
      return unless @current_room 
      message = Message.new(@name, @current_room, content)
      @current_room.messages << message
      @current_room.broadcast(message)  
      puts "#{@name} ส่งข้อความ: #{content}"
    end
  
    def acknowledge_message(message)
      puts "#{@name} ยืนยันข้อความ: '#{message.content}'."
    end
  end
  
  class Room
    attr_accessor :name, :description, :messages, :users
    
    def initialize(name, description)
      @name = name
      @description = description
      @messages = []
      @users = []  
    end
  
    def add_user(user)
      @users << user  
    end
  
    def broadcast(message)
      @users.each do |user|
        puts "#{user.name} ได้รับข้อความใน #{name}: '#{message.content}'"
      end
    end
  end
  
  class Message
    attr_accessor :user, :room, :content
    
    def initialize(user, room, content)
      @user = user
      @room = room
      @content = content
    end
  end
  
  user1 = User.new("ฟิล์ม")
  user2 = User.new("ออมสิน")
  living_room = Room.new("ห้องนั่งเล่น", "สถานที่พักผ่อนย่อนใจ.")
  

  user1.enter_room(living_room)
  user2.enter_room(living_room)
  

  user1.send_message("สวัสดี")
  user2.send_message("สวัสดี")
  







