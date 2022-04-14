# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 100.times do |n|
#   User.create(title: "test{n}人目", content:"test！#{n}回目")
# end

users = [
  { id: 1, name: "管理者", role: 1, email: "networthtokyo.2020@gmail.com", password: "nwadmin" },
  { id: 2, name: "小林響平", role: 2, email: "k1022kobayashi.nw@gmail.com", password: "Cp3v7tPfZPx3qjF", password_confirmation: "Cp3v7tPfZPx3qjF" },
  { id: 3, name: "樋口悠馬", role: 2, email: "user3@mail", password: "password" },
  { id: 4, name: "三浦旭", role: 2, email: "user4@mail", password: "password" },
  { id: 5, name: "川眞田紘子", role: 3, email: "comucoco0715@gmail.com", password: "password" },
  { id: 6, name: "山根陽一", role: 3, email: "nyjrpk105@gmail.com", password: "password" },
  { id: 7, name: "宮田", role: 3, email: "chaaam4c@gmail.com", password: "password" },
  { id: 8, name: "宮森", role: 3, email: "k289miyamori.nw@gmail.com", password: "password" },
  { id: 9, name: "松原", role: 3, email: "a293matsubara.nw@gmail.com", password: "password" },
  { id: 10, name: "宮下", role: 4, email: "e294miyashita.nw@gmail.com", password: "password" },
  { id: 11, name: "矢萩", role: 4, email: "k292yahagi.nw@gmail.com", password: "password" },
  { id: 12, name: "松尾", role: 4, email: "k2016matsuo.nw@gmail.com", password: "password" },
  { id: 13, name: "天水颯太", role: 4, email: "s2012tensui.nw@gmail.com", password: "password" },
  { id: 14, name: "吉道弘晃", role: 4, email: "h2015yoshimichi.nw@gmail.com", password: "password" },
  { id: 15, name: "山本大勝", role: 4, email: "h2013yamamoto.nw@gmail.com", password: "password" },
  { id: 16, name: "菅家寿紀", role: 4, email: "t2014kanke@gmail.com", password: "password" },
  { id: 17, name: "植原由佳", role: 4, email: "y2017uehara.nw@gmail.com", password: "password" }
]

users.each do |user|
  User.create(user)
end

souces = [
  { id: 1, name: "営業新規", description: "営業活動の際に自分で発見したもの", approval: false, user_id: 7 },
  { id: 2, name: "紹介", description: "見込み客、協力者、顧客から紹介してもらったもの", approval: false, user_id: 7 },
  { id: 3, name: "レントラックス", description: "アフィリエイト/LPを使って集客", approval: true, user_id: 3 },
  { id: 4, name: "もしもアフィリエイト", description: "アフィリエイト/LPを使って集客", approval: true, user_id: 3 },
  { id: 5, name: "A8.net", description: "アフィリエイト/LPを使って集客", approval: true, user_id: 3 },
  { id: 6, name: "Oh!Ya", description: "不動産投資専門集客媒体", approval: true, user_id: 3 },
  { id: 7, name: "アットセミナー", description: "マネーセミナー専門の媒体　投資に興味がある人が多い", approval: true, user_id: 2 },
  { id: 8, name: "セミナー情報.com", description: "セミナー情報掲載サイト", approval: false, user_id: 3 },
  { id: 9, name: "セミナーズ", description: "セミナー情報掲載サイト", approval: false, user_id: 3 },
  { id: 10, name: "Peatix", description: "セミナー情報掲載サイト", approval: false, user_id: 3 },
  { id: 11, name: "アクセストレード", description: "アフィリエイト/LPを使って集客", approval: true, user_id: 3 },
  { id: 12, name: "connpass", description: "セミナー情報掲載サイト", approval: false, user_id: 3 },
  { id: 13, name: "Instagram", description: "川眞田社長のインスタからの流入、インスタグラム用フォーム", approval: false, user_id: 4 },
  { id: 14, name: "ホームページ", description: "ホームページからの電話やメールでの問い合わせ、無料", approval: false, user_id: 4 }
]

souces.each do |souce|
  Source.create(souce)
end

sales_processes = [
  { id:1, name: "日程確定", description: "説明を追加してください。" },
  { id:2, name: "セミナー参加", description: "説明を追加してください。" },
  { id:3, name: "個別面談", description: "説明を追加してください。" },
  { id:4, name: "挨拶", description: "説明を追加してください。" },
  { id:5, name: "商談", description: "説明を追加してください。" },
  { id:6, name: "申込", description: "説明を追加してください。" },
  { id:7, name: "契約", description: "説明を追加してください。" },
  { id:8, name: "金消", description: "説明を追加してください。" },
  { id:9, name: "決済", description: "説明を追加してください。" }
]

sales_processes.each do |sales_process|
  SalesProcess.create(sales_process)
end

seminars = [
  { id: 1, title: "FPが解説‼　初心者が損しないための資産運用術！", format: 1, instructor: "川眞田さん", start_date_time: "2021-05-08 04:00", end_date_time: "2021-05-08 06:00", description: "不動産投資", url: "" },
  { id: 2, title: "税理士✖️FPが解説‼　初心者が損しないための資産運用術！", format: 1, instructor: "川眞田さん", start_date_time: "2021-05-22 04:00", end_date_time: "2021-05-22 06:00", description: "不動産投資", url: "" },
  { id: 3, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-09 09:00", end_date_time: "2021-06-09 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0tdeyoqzwsGNOUKUi_3-teV6sRSSw30gcQ" },
  { id: 4, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-12 04:00", end_date_time: "2021-06-12 05:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAvceGopjgpHNQHjfEsHnFgO3aDV1WK2Eox" },
  { id: 5, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-16 09:00", end_date_time: "2021-06-16 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwod-GupzgsEtejCg9JLP-QIXucNMbL6ION" },
  { id: 6, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-19 04:00", end_date_time: "2021-06-19 05:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZIkdeqqqT4iG90zC3eQIvQ3y1JppbnnQD1M" },
  { id: 7, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-23 09:00", end_date_time: "2021-06-23 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZErceigqDMjGtKnGWhmOM26kvRJoQMFnGBc" },
  { id: 8, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-26 04:00", end_date_time: "2021-06-26 05:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMvdeGtpzsvH9dr658_iAgwHiulwUOxe9d8" },
  { id: 9, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-06-30 09:00", end_date_time: "2021-06-30 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZIpceuvrjgpE9Xh_VgyH7tig8P4FRAzZVsi" },
  { id: 10, title: "FP講師が解説！初心者が損しないための資産運用術！", format: 1, instructor: "川眞田さん", start_date_time: "2021-07-03 01:00", end_date_time: "2021-07-03 03:30", description: "不動産投資、来場とオンラインどっちも実施", url: "" },
  { id: 11, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-07 09:00", end_date_time: "2021-07-07 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAtc-yrpz0tGtfgQx9C7hD67NP6wHiO66bl" },
  { id: 12, title: "90分でわかる！社会保険制度と資産の持ち方", format: 1, instructor: "山根さん", start_date_time: "2021-07-10 05:00", end_date_time: "2021-07-10 06:30", description: "不動産投資、集客できず中止", url: "" },
  { id: 13, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-14 09:00", end_date_time: "2021-07-14 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwkd-uhqDkrGdehkTY9rXh4DMxlIqUps9Bv" },
  { id: 14, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-17 01:00", end_date_time: "2021-07-17 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMrdempqTMtHdNCS3uuLuefc9IJXcJd4Dui" },
  { id: 15, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-21 09:00", end_date_time: "2021-07-21 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZIucOivrjsoHdDb7caI3A02jrA5eSkJZbCW" },
  { id: 16, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-24 01:00", end_date_time: "2021-07-24 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZErcO-qrTktG9eHGnFyX4pkZo7pU_rTkdqC" },
  { id: 17, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-28 09:00", end_date_time: "2021-07-28 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwpcOuspjooE9T6B_xxionsd3sb0_DRXYls" },
  { id: 18, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-07-31 01:00", end_date_time: "2021-07-31 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAqfumhrz8qHNN8I6r2rpNHxl4rKXPIB31a" },
  { id: 19, title: "【不動産投資セミナー】はじめの一歩をお手伝い！老後資金を作る基礎を学ぼう！", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-04 09:00", end_date_time: "2021-08-04 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZcsfu-sqz0uGddgC6Ntvc5KtGPSMpA11xJ8" },
  { id: 20, title: "90分でわかる！社会保険制度と資産の持ち方", format: 2, instructor: "山根さん", start_date_time: "2021-08-07 05:00", end_date_time: "2021-08-07 07:00", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZIvduGqrD0pE9eZPPFVArG9oaYl-G3Jre-l" },
  { id: 21, title: "周りと差がつく投資法を紹介！初心者のための不動産投資セミナー！", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-11 09:00", end_date_time: "2021-08-11 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZIldu6grDgvEtCUJRd3b2Ltg_Rnedw6HMiT" },
  { id: 22, title: "「老後不安」で済んでいるうちが吉！将来のための資産運用セミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-18 09:00", end_date_time: "2021-08-18 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0lf-qtqzMvGdB3tH9Aaglcrk3QgWNhVGL2" },
  { id: 23, title: "【限定10名】知識0から学べる資産の作り方！【WEB】", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-21 01:00", end_date_time: "2021-08-21 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAuc--tqDwoHdNuGa6LkgPJJNv8iOh10Czz" },
  { id: 24, title: "【オンライン】知識0から始める将来のための不動産投資セミナー！", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-25 09:00", end_date_time: "2021-08-25 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYocu6rqDMiGt1IPkAMQ6d9XWBlERKcG1NM" },
  { id: 25, title: "【オンラインセミナー】貯金は損⁉今だからこそ始めるべき資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-08-28 01:00", end_date_time: "2021-08-28 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0rdOuuqjwsHdS0F-8oHqJBLMahsebphO-6" },
  { id: 26, title: "【不動産投資セミナー】はじめの一歩をお手伝い！老後資金を作る基礎を学ぼう！", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-01 09:00", end_date_time: "2021-09-01 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZEsduqhqjIuHNT_J1LWDeBh9kHzb5BUrBaZ" },
  { id: 27, title: "周りと差がつく投資法を紹介！初心者のための不動産投資セミナー！", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-04 01:00", end_date_time: "2021-09-04 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYodOGgrjMqG9wDg2ni6WOHfcwsdNIoqNQT" },
  { id: 28, title: "「老後不安」で済んでいるうちが吉！将来のための資産運用セミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-08 09:00", end_date_time: "2021-09-08 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZEpd-upqjoqEtAU0eQaAW6CR7dqvxOJ3wMj" },
  { id: 29, title: "90分でわかる！社会保険制度と資産の持ち方", format: 1, instructor: "山根さん", start_date_time: "2021-09-11 05:00", end_date_time: "2021-09-11 07:00", description: "不動産投資", url: "" },
  { id: 30, title: "【限定10名】知識0から学べる資産の作り方！【WEB】", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-15 09:00", end_date_time: "2021-09-15 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMscu2trj4uH9V_SPZS8Q2dFSXuF5wzMBwy" },
  { id: 31, title: "【オンライン】知識0から始める将来のための不動産投資セミナー！", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-18 01:00", end_date_time: "2021-09-18 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZArfu-sqD0uGdZ4AFvynkq5TyUnFy73cHcR" },
  { id: 32, title: "【オンラインセミナー】貯金は損⁉今だからこそ始めるべき資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-22 09:00", end_date_time: "2021-09-22 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAkcuiopj0oHN2uVjFS2UikHgP1dHg_aOlP" },
  { id: 33, title: "【オンライン】堅実で賢い投資とは？老後資金を作るための資産運用セミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-25 01:00", end_date_time: "2021-09-25 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0rc-CuqDwsE9cbYBFxuzSojBDL2LWrYOYm" },
  { id: 34, title: "【資産運用】人生100年時代を生き抜くためのオンラインセミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-09-29 09:00", end_date_time: "2021-09-29 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0qcu2qrTspE9P0DefLs9WTXd1QN-wI1Kzb" },
  { id: 35, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-02 01:00", end_date_time: "2021-10-02 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZcoduGsqDwpHNRfao3qiQCJaUUhu7iEpbW6" },
  { id: 36, title: "【限定10名】知識0から学べる資産の作り方！【WEB】", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-06 09:00", end_date_time: "2021-10-06 10:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAlc--grTIjHdOPCOO8DxMIWa-1zlA3ZrEi" },
  { id: 37, title: "周りと差がつく投資法を紹介！初心者のための不動産投資セミナー！", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-09 01:00", end_date_time: "2021-10-09 02:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMpcuugrjIsHdHSKpqSGnvwEVM_dnmE1E2W" },
  { id: 38, title: "「老後不安」で済んでいるうちが吉！将来のための資産運用セミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-13 18:00", end_date_time: "2021-10-13 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZEkcO6sqDstEt0pLMZSKgtZYFmB23awLS6L" },
  { id: 39, title: "90分でわかる！社会保険制度と資産の持ち方", format: 1, instructor: "山根さん", start_date_time: "2021-10-16 14:00", end_date_time: "2021-10-16 16:00", description: "不動産投資", url: "" },
  { id: 40, title: "初めての資産運用で失敗しないための無料オンラインセミナー", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-20 18:00", end_date_time: "2021-10-20 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwoc-uhrzgiGN3iKdQ7NUaPrDycSr9QgHZP" },
  { id: 41, title: "【オンラインセミナー】貯金は損⁉今だからこそ始めるべき資産運用術！", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-23 10:00", end_date_time: "2021-10-23 11:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZAtce-spjgpE9QctNlu8IrHdR2Hd47WRwsB" },
  { id: 42, title: "ゼロから学ぶ資産運用の基礎セミナー【オンライン】", format: 2, instructor: "川眞田さん", start_date_time: "2021-10-27 18:00", end_date_time: "2021-10-27 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0ocOqhrjksHdGRZYc7UKPgbXnoPt1eGbBk" },
  { id: 43, title: "【資産運用】人生100年時代を生き抜くためのオンラインセミナー", format: 2, instructor: "川眞田", start_date_time: "2021-10-30 10:00", end_date_time: "2021-10-30 11:30", description: "不動産投資", url: "https://us06web.zoom.us/j/88981290918?pwd=TnFCQWRJUWlRVU1Bdmt3TW9GU0Judz09" },
  { id: 44, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-03 18:00", end_date_time: "2021-11-03 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZUtdO-urDwsHty_vpejQue0IpXwEZiJCzNx" },
  { id: 45, title: "【限定10名】知識0から学べる資産の作り方！【WEB】", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-06 10:00", end_date_time: "2021-11-06 11:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMpcO2prDIrE9Lu3C15T6-C0MJU0ivrZ479" },
  { id: 46, title: "周りと差がつく投資法を紹介！初心者のための不動産投資セミナー！", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-10 18:00", end_date_time: "2021-11-10 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZItcOmrqD4rGd2tkeIblo7RSE67P1LqHoyH" },
  { id: 47, title: "「老後不安」で済んでいるうちが吉！将来のための資産運用セミナー", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-13 10:00", end_date_time: "2021-11-13 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYude-hrDsiGNyrh-cyiYrx-rBMkuoQzNkA" },
  { id: 48, title: "初めての資産運用で失敗しないための無料オンラインセミナー", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-17 18:00", end_date_time: "2021-11-17 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwtd-CpqToiGdWwYWYaJJEHro1FrYWsXFcL" },
  { id: 50, title: "ゼロから学ぶ資産運用の基礎セミナー【オンライン】", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-24 18:00", end_date_time: "2021-11-24 19:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMtcu2uqDkiGtD0H2FVFcGVzDjEBfAJZyWI" },
  { id: 51, title: "【資産運用】人生100年時代を生き抜くためのオンラインセミナー", format: 2, instructor: "川眞田紘子", start_date_time: "2021-11-27 10:00", end_date_time: "2021-11-27 11:30", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZclceqgqTgvHdJZ1beCc1rQJ0zqcTwMCjIm" },
  { id: 52, title: "タイトル無し", format: 1, instructor: "講師無し", start_date_time: "2021-10-07 03:00", end_date_time: "2021-10-07 04:00", description: "説明無し", url: "" },
  { id: 55, title: "タイトル無し", format: 2, instructor: "講師無し", start_date_time: "2021-10-14 10:00", end_date_time: "2021-10-14 11:00", description: "宮森担当のみ", url: "" },
  { id: 56, title: "初心者が失敗しないための資産形成術", format: 2, instructor: "川眞田　紘子", start_date_time: "2021-10-16 01:00", end_date_time: "2021-10-16 02:30", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZEkc-CpqzksGtLE2ihF60j7_WgZC9PVocI0" },
  { id: 58, title: "タイトル無し", format: 2, instructor: "川眞田紘子", start_date_time: "2021-10-13 12:30", end_date_time: "2021-10-13 14:00", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwtd-CpqToiGdWwYWYaJJEHro1FrYWsXFcL" },
  { id: 59, title: "90分でわかる！社会保険制度と資産の持ち方", format: 1, instructor: "山根陽一", start_date_time: "2021-11-20 14:00", end_date_time: "2021-11-20 16:00", description: "説明無し", url: "" },
  { id: 60, title: "タイトル無し", format: 1, instructor: "講師無し", start_date_time: "2021-11-13 17:00", end_date_time: "2021-11-13 18:30", description: "説明無し", url: "" },
  { id: 61, title: "初心者が損しないための資産運用術！", format: 2, instructor: "川眞田", start_date_time: "2021-12-01 18:00", end_date_time: "2021-12-01 19:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZUoc-yopzwqHt0N5GfpxpDktOgqgdX1Bvs5" },
  { id: 62, title: "知識0から学べる資産の作り方！【WEB】", format: 2, instructor: "川眞田", start_date_time: "2021-12-04 10:00", end_date_time: "2021-12-04 11:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZAscu6qrjgoEtf7TXOWJbzm9HOv7_rInCtg" },
  { id: 63, title: "周りと差がつく投資法を紹介！初心者のための不動産投資セミナー！", format: 2, instructor: "川眞田", start_date_time: "2021-12-08 18:00", end_date_time: "2021-12-08 19:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZAqf-irrj0rG9VHH3QmTKQMl3LAFs-8ALyh" },
  { id: 64, title: "「老後不安」で済んでいるうちが吉！将来のための資産運用セミナー", format: 2, instructor: "川眞田", start_date_time: "2021-12-11 10:00", end_date_time: "2021-12-11 11:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZIqce2sqDIpEtJxZqJvHph4QCim6kTsGJ79" },
  { id: 65, title: "初めての資産運用で失敗しないための無料オンラインセミナー", format: 2, instructor: "川眞田", start_date_time: "2021-12-15 18:00", end_date_time: "2021-12-15 19:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZItde2tqDIqG92K5t8Fqo7qlUkL5EGR1PJA" },
  { id: 66, title: "【オンラインセミナー】貯金は損⁉今だからこそ始めるべき資産運用術！", format: 2, instructor: "川眞田", start_date_time: "2021-12-18 10:00", end_date_time: "2021-12-18 11:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZUvd-utpjMoHNKo_OMQ6_jg15G930IylVqT" },
  { id: 67, title: "ゼロから学ぶ資産運用の基礎セミナー【オンライン】", format: 2, instructor: "川眞田", start_date_time: "2021-12-22 18:00", end_date_time: "2021-12-22 19:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZUsduquqTksH9KPEtKnskSJpGUrSgiM8nnC" },
  { id: 68, title: "【資産運用】人生100年時代を生き抜くためのオンラインセミナー", format: 2, instructor: "川眞田", start_date_time: "2021-12-25 10:00", end_date_time: "2021-12-25 11:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZwtdeiprDovGtPdSResSyxYwhIQTxpItJQ6" },
  { id: 69, title: "タイトル無し", format: 1, instructor: "講師無し", start_date_time: "2021-11-23 16:00", end_date_time: "2021-11-23 17:30", description: "説明無し", url: "" },
  { id: 70, title: "タイトル無し", format: 2, instructor: "講師無し", start_date_time: "2021-11-20 10:00", end_date_time: "2021-11-20 11:15", description: "説明無し", url: "https://us06web.zoom.us/meeting/register/tZclceCrrjgvG9LKL5Njd1prCyoiJLaGCpTt" },
  { id: 71, title: "タイトル無し", format: 1, instructor: "講師無し", start_date_time: "2021-12-03 20:00", end_date_time: "2021-12-03 21:00", description: "説明無し", url: "" },
  { id: 72, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-01-08 10:00", end_date_time: "2022-01-08 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYtcu-oqj4qE9x94Ux2Yy2XpADs0NeqT6l_" },
  { id: 73, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-01-12 18:00", end_date_time: "2022-01-12 19:15", description: "資産運用", url: "https://us06web.zoom.us/meeting/register/tZUodu2vrjIuHNwIuzxsuU_vR5ueCHQnCLxV" },
  { id: 74, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-01-15 10:00", end_date_time: "2022-01-15 11:15", description: "資産運用", url: "https://us06web.zoom.us/meeting/register/tZYsfuiorj4qGtNHT0HteuYlGsTrVBQSlbOl" },
  { id: 75, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-01-19 18:00", end_date_time: "2022-01-19 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMrcOygqT8tHNLQE3dLbBo05MVjhFK9rZ-y" },
  { id: 76, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-01-22 10:00", end_date_time: "2022-01-22 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZEscOCorT4iHdHkZd1O8lBQeM63LVKtIbcI" },
  { id: 77, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-01-26 18:00", end_date_time: "2022-01-26 19:15", description: "資産運用", url: "https://us06web.zoom.us/meeting/register/tZwrf-ivrDsvGtKK57nZngTeBpeXY8RAgjA2" },
  { id: 79, title: "60分でわかる！年収900万円からの税金対策", format: 2, instructor: "山根陽一&正木(ゲスト)", start_date_time: "2022-01-29 15:00", end_date_time: "2022-01-29 16:40", description: "節税", url: "https://us06web.zoom.us/meeting/register/tZAod-GpqzkiGdDFd7b7mIc6epUrwlh6dx8t" },
  { id: 80, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-02-02 18:00", end_date_time: "2022-02-02 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZMpd-ChqT0oE9dcavP9mKuPFhuGKROCrLq3" },
  { id: 81, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-02-05 10:00", end_date_time: "2022-02-05 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZUlf-mhrj4pE9yiY_9XsNUpSrY_I5GH-kHD" },
  { id: 82, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-02-09 18:00", end_date_time: "2022-02-09 19:15", description: "資産形成", url: "https://us06web.zoom.us/meeting/register/tZElfuqtqz8sGtcr1w_S-sOXcyon7iOv4AxV" },
  { id: 83, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-02-12 10:00", end_date_time: "2022-02-12 11:15", description: "資産形成", url: "https://us06web.zoom.us/meeting/register/tZYlf--urDwuHtbNH8Oz0hdM8u17Zf3zCJaQ" },
  { id: 84, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-02-16 18:00", end_date_time: "2022-02-16 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZEudeyorDkiHN3qbVPr6QB6LRLdGMf38Yur" },
  { id: 85, title: "意外と知らない効率的な運用術〜自己資本と他人資本をうまく活用〜", format: 1, instructor: "山根", start_date_time: "2022-02-19 14:00", end_date_time: "2022-02-19 15:15", description: "不動産投資", url: "" },
  { id: 86, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-02-23 18:00", end_date_time: "2022-02-23 19:15", description: "資産形成", url: "https://us06web.zoom.us/meeting/register/tZ0rd--hqzspEtQAyR-m7mUiuEuXLSNOXgNA" },
  { id: 87, title: "初心者が損しないための資産形成の基礎知識", format: 2, instructor: "小林", start_date_time: "2022-02-26 10:00", end_date_time: "2022-02-26 11:15", description: "資産形成", url: "https://us06web.zoom.us/meeting/register/tZIudO-gpjorGdfp38pfwJOM2PC3hGXlu8a6" },
  { id: 88, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "川眞田　紘子", start_date_time: "2022-03-02 18:00", end_date_time: "2022-03-02 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0qce6prDstHd1Gi3ApD5X-Fn-ZukLLTyF_" },
  { id: 89, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田瑞季", start_date_time: "2022-03-05 10:00", end_date_time: "2022-03-05 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0lc-GqqTIoHtIbqwTTwdelnP5PAmqvGCUv" },
  { id: 90, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田瑞季", start_date_time: "2022-03-09 18:00", end_date_time: "2022-03-09 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYqdeChqDIjGNapJwqHVyqhhvbsLjzTfBJE" },
  { id: 91, title: "本当のところ不動産投資って何がいいの？", format: 1, instructor: "川眞田紘子", start_date_time: "2022-03-12 13:00", end_date_time: "2022-03-12 16:00", description: "不動産投資", url: "" },
  { id: 92, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田瑞季", start_date_time: "2022-03-16 18:00", end_date_time: "2022-03-16 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZclcO6hqjovGdW_zyxvE07Ml_bbVxf3Fsb4" },
  { id: 93, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田瑞季", start_date_time: "2022-03-19 10:00", end_date_time: "2022-03-19 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZ0kdu2pqjMuGtI22KeyuS9m3E1lup6QECxe" },
  { id: 94, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-03-23 18:00", end_date_time: "2022-03-23 19:15", description: "不動産投資", url: "" },
  { id: 95, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-03-26 10:00", end_date_time: "2022-03-26 11:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZYpcuCpqD4qHN1k_3lgJzXmvF5rjY05gkuK" },
  { id: 96, title: "本当のところ不動産投資って何がいいの？", format: 2, instructor: "宮田", start_date_time: "2022-03-30 18:00", end_date_time: "2022-03-30 19:15", description: "不動産投資", url: "https://us06web.zoom.us/meeting/register/tZwudeGsqTkqHd3-Ch0caN9qESGNJ9_NjgcZ" },
  { id: 97, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "講師無し", start_date_time: "2022-04-06 18:00", end_date_time: "2022-04-06 19:15", description: "説明無し", url: "" },
  { id: 98, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-09 10:00", end_date_time: "2022-04-09 11:15", description: "説明無し", url: "" },
  { id: 99, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-13 18:00", end_date_time: "2022-04-13 19:15", description: "説明無し", url: "" },
  { id: 100, title: "タイトル無し", format: 1, instructor: "山根", start_date_time: "2022-04-02 14:00", end_date_time: "2022-04-02 15:30", description: "説明無し", url: "" },
  { id: 101, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-16 10:00", end_date_time: "2022-04-16 11:15", description: "説明無し", url: "" },
  { id: 102, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-20 18:00", end_date_time: "2022-04-20 19:15", description: "説明無し", url: "" },
  { id: 103, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-23 10:00", end_date_time: "2022-04-23 11:15", description: "説明無し", url: "" },
  { id: 104, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-27 18:00", end_date_time: "2022-04-27 19:15", description: "説明無し", url: "" },
  { id: 105, title: "「本当のところ不動産投資って何がいいの？」", format: 2, instructor: "宮田", start_date_time: "2022-04-30 10:00", end_date_time: "2022-04-30 11:15", description: "説明無し", url: "" }
]

seminars.each do |seminar|
  Seminar.create(seminar)
end