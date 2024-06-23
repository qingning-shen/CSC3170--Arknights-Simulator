import hashlib
from flask import Flask, redirect, render_template, request, session, jsonify, url_for
import mysql.connector
import atexit

app = Flask(__name__,static_folder='static')
app.secret_key = 'your_secret_key'

# MySQL connection parameters
config = {
    'host': '',
    'user': '',
    'password': '',
    'database': ''
}

# Connect to the database
cnx = mysql.connector.connect(**config)
cursor = cnx.cursor(buffered=True)

# Route definitions
@app.route('/')
def login():
    return render_template('login.html')

@app.route('/welcome', methods=['POST'])
def welcome():
    # 获取前端提交的用户名和密码
    username = request.form.get('username')
    password = request.form.get('password').encode('utf-8')
    password = hashlib.sha256(password).hexdigest()
   

    # 连接数据库，执行查询语句，验证用户身份并获取用户信息
    query = "SELECT * FROM users WHERE uname=%s AND pwd=%s"
    cursor.execute(query, (username, password))
    user_info = cursor.fetchone()  # 假设返回的第一条记录即为用户信息

    if user_info is not None:
        # 登录成功，渲染欢迎页面并传递用户信息
        session['user_id'] = user_info[0] 
        query = "SELECT * FROM account WHERE uid=%s"
        cursor.execute(query, (user_info[0],))
        account_info = cursor.fetchone()
        session['account_id'] = account_info[1] 
        # #获取当前关卡
        # query = "SELECT MAX(bid) FROM EVENT WHERE aid = %s AND pass_state >= 1"
        # cursor.execute(query, (account_info[1],))
        # bid_info=cursor.fetchone()

        # 第一句
        query1 = "SELECT COUNT(DISTINCT DATE(time)) AS unique_login_days FROM LOGIN WHERE uid = %s AND YEAR(time) = 2024"
        cursor.execute(query1, (user_info[0],))
        AAA=cursor.fetchone()

        # 第二句
        query2 = "SELECT COUNT(*) AS total_levels_played FROM EVENT WHERE aid = %s AND YEAR(time) = 2024"
        cursor.execute(query2, (account_info[1],))
        BBB=cursor.fetchone()

        # 第三句
        query3 = "SELECT DATE(time) FROM EVENT WHERE aid = %s GROUP BY DATE(time) ORDER BY COUNT(*) DESC LIMIT 1"
        cursor.execute(query3, (account_info[1],))
        CCC=cursor.fetchone()

        # 第四句
        query4 = "SELECT MAX(bid) FROM EVENT WHERE aid = %s AND pass_state >= 1"
        cursor.execute(query4, (account_info[1],))
        DDD=cursor.fetchone()

        #第五句
        query5 = "SELECT COUNT(c.cid) AS character_count FROM account a JOIN acc_char ac ON a.aid = ac.aid JOIN characters c ON ac.cid = c.cid WHERE a.aid = %s AND ac.clevel >= 60"
        cursor.execute(query5, (account_info[1],))
        EEE=cursor.fetchone()

        #第五句part2
        query6 = "SELECT c.cname FROM account a JOIN acc_char ac ON a.aid = ac.aid JOIN characters c ON ac.cid = c.cid WHERE a.aid = %s AND ac.clevel >= 60"
        cursor.execute(query6, (account_info[1],))
        FFF=cursor.fetchone()

        return render_template('welcome.html', 
                               username=user_info[1],
                               alevel=account_info[3],
                               reg_date=account_info[2],
                               AAA=AAA[0],
                               BBB=BBB[0],
                               CCC=CCC[0],
                               DDD=DDD[0],
                               EEE=EEE[0],
                               FFF=FFF[0],
                               
                               )
    
    else:
        # 登录失败，可以返回错误消息或重定向回登录页面
        session['username'] = None
        return 'Invalid username or password.', 401  # 返回HTTP状态码401（Unauthorized）

    # 注意：在实际应用中，应使用哈希和盐来安全地存储和验证密码，而不是直接比较明文密码


    # 注意：在实际应用中，应使用哈希和盐来安全地存储和验证密码，而不是直接比较明文密码

@app.route('/cards')
def cards():
    user_id = session.get('user_id')
    account_id = session.get('account_id')
    if not user_id:
        return redirect(url_for('login'))

    # 连接数据库，执行查询语句，获取卡牌列表
    # query = "SELECT C.*, A.aid FROM ACC_CHAR A JOIN CHARACTERS C ON A.cid = C.cid WHERE aid = %s"
    # cursor.execute(query,(account_id,))
    # card_list = cursor.fetchall()
    queryy = "SELECT ac.clevel, ac.cpotent, c.cname,c.cimg,c.sk_1, c.sk_2, c.sk_3, c.talent FROM acc_char ac JOIN account a ON ac.aid = a.aid JOIN characters c ON ac.cid = c.cid WHERE a.aid = %s"
    cursor.execute(queryy, (account_id,))
    character_list = cursor.fetchall()  # 假设所有查询结果构成了卡牌列表

    #if card_list:
    if character_list:
        # 卡牌列表非空，渲染卡牌列表页面并传递卡牌列表
        return render_template('cards.html', user_id=user_id,characters=character_list)
    else:
        # 没有卡牌数据，可以返回错误消息或处理空列表的情况
        return 'No cards found.', 404  # 返回HTTP状态码404（Not Found）

    # 注意：在实际应用中，可能需要添加分页、筛选等逻辑来处理大量卡牌数据

# @app.route('/card/<int:card_id>')
# def card(card_id):
#     # 连接数据库，执行查询语句，获取指定ID的卡牌详细信息
#     query = "SELECT * FROM characters WHERE cid=%s"
#     cursor.execute(query, (card_id,))
#     card_details = cursor.fetchone()  # 假设返回的第一条记录即为卡牌详细信息

#     if card_details is not None:dianhua 
#         # 卡牌存在，将其转换为JSON并返回
#         return jsonify({
#             'id': card_details[0],
#             'name': card_details[1],
#             'description': card_details[2],  # Assuming there's a description column
#             'image_path': card_details[3]  # Assuming thumbnail_path is also the full image path
#         })
#     else:
#         # 卡牌不存在，可以返回错误消息或HTTP状态码
#         return 'Card not found.', 404  # 返回HTTP状态码404（Not Found）

#     # 注意：在实际应用中，可能需要对卡牌详情进行适当的清洗、转换或嵌套处理，以便适合作为JSON响应

@app.route('/logout')
def logout():
    session.pop('user_id', None)  # Remove the user_id from the session
    # Optionally, clear any other session variables related to the user's session
       
    # Redirect the user to a login page or home page
    return redirect('/')

# Close the database connection when exiting the application
@atexit.register
def close_db():
    cursor.close()
    cnx.close()


if __name__ == '__main__':
    app.run(debug=True)