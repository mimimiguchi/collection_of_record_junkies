require 'rails_helper'

RSpec.describe Collection, type: :model do
  before do
    @collection_post = FactoryBot.build(:collection_post)
    @collection_sell = FactoryBot.build(:collection_sell)
  end

  describe 'collectiont投稿' do
    context 'collectionが投稿できる時' do
      it '管理状態がコレクションを選択されていれば、出品情報および販売価格が選択・入力されていなくても投稿できる' do
        expect(@collection_post).to be_valid
      end

      it 'リリース年が未入力でも投稿できる' do
        @collection_post.year = ''
        expect(@collection_post).to be_valid
      end

      it '曲の説明が未入力でも投稿できる' do
        @collection_post.description = ''
        expect(@collection_post).to be_valid
      end
    end

    context 'collectionが投稿できない時' do
      it 'レコードのジャケット画像が未選択では投稿できない' do
        @collection_post.image = nil
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("レコードのジャケット画像を入力してください")
      end

      it 'ジャンルが未選択では投稿できない' do
        @collection_post.music_id = 1 
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("ジャンルを選択してください。")
      end

      it '曲名が未入力では投稿できない' do
        @collection_post.title = ''
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("曲名を入力してください")
      end

      it 'アーティスト名が未入力では投稿できない' do
        @collection_post.artist = ''
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("アーティスト名を入力してください")
      end

      it 'リリース年が全角数字では投稿できない' do
        @collection_post.year = '２０２１'
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("リリース年は不正な値です")
      end

      it 'リリース年が半角文字では投稿できない' do
        @collection_post.year = 'ｱｱｱｱ'
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("リリース年は不正な値です")
      end

      it 'リリース年が3文字以下では投稿できない' do
        @collection_post.year = '202'
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("リリース年は不正な値です")
      end

      it 'リリース年が5文字以上では投稿できない' do
        @collection_post.year = ' 20211'
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("リリース年は不正な値です")
      end

      it 'レコードサイズが未選択では投稿できない' do
        @collection_post.size_id = 1 
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("レコードサイズを選択してください。")
      end

      it '回転数が未選択では投稿できない' do
        @collection_post.rpm_id = 1 
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("回転数を選択してください。")
      end

      it '管理状態が未選択では投稿できない' do
        @collection_post.status_id = 1 
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("管理状態を選択してください。")
      end

      it 'userが紐ついていないと投稿できない' do
        @collection_post.user = nil
        @collection_post.valid?
        expect(@collection_post.errors.full_messages).to include("Userを入力してください")
      end

    end

  end

  describe 'collectiont出品' do
    context 'collectionが出品できる時' do
      it '管理状態が出品を選択されており、且つ出品情報および販売価格が全て選択・入力されていれば出品できる' do
        expect(@collection_sell).to be_valid
      end

      it 'リリース年が未入力でも出品できる' do
        @collection_sell.year = ''
        expect(@collection_sell).to be_valid
      end

      it '曲の説明が未入力でも出品できる' do
        @collection_sell.description = ''
        expect(@collection_sell).to be_valid
      end
    end

    context 'collectionが出品できない時' do
      context 'collectionが出品できない時' do
        it 'レコードのジャケット画像が未選択では出品できない' do
          @collection_sell.image = nil
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("レコードのジャケット画像を入力してください")
        end
  
        it 'ジャンルが未選択では出品できない' do
          @collection_sell.music_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("ジャンルを選択してください。")
        end
  
        it '曲名が未入力では出品できない' do
          @collection_sell.title = ''
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("曲名を入力してください")
        end
  
        it 'アーティスト名が未入力では出品できない' do
          @collection_sell.artist = ''
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("アーティスト名を入力してください")
        end
  
        it 'リリース年が全角数字では出品できない' do
          @collection_sell.year = '２０２１'
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("リリース年は不正な値です")
        end
  
        it 'リリース年が半角文字では出品できない' do
          @collection_sell.year = 'ｱｱｱｱ'
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("リリース年は不正な値です")
        end
  
        it 'リリース年が3文字以下では出品できない' do
          @collection_sell.year = '202'
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("リリース年は不正な値です")
        end
  
        it 'リリース年が5文字以上では出品できない' do
          @collection_sell.year = ' 20211'
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("リリース年は不正な値です")
        end
  
        it 'レコードサイズが未選択では出品できない' do
          @collection_sell.size_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("レコードサイズを選択してください。")
        end
  
        it '回転数が未選択では出品できない' do
          @collection_sell.rpm_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("回転数を選択してください。")
        end
  
        it '管理状態が未選択では出品できない' do
          @collection_sell.status_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("管理状態を選択してください。")
        end

        it '配送料の負担が未選択では出品できない' do
          @collection_sell.delivery_charge_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("配送料の負担を選択してください。")
        end

        it '発送元の地域が未選択では出品できない' do
          @collection_sell.prefecture_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("発送元の地域を選択してください。")
        end

        it '発送元までの日数が未選択では出品できない' do
          @collection_sell.delivery_day_id = 1 
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("発送までの日数を選択してください。")
        end

        it '販売価格が未入力では出品できない' do
          @collection_sell.price = nil
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("販売価格を入力してください", "販売価格を整数で入力してください。")
        end

        it '販売価格が全角数字では出品できない' do
          @collection_sell.price = '１０００'
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("販売価格を整数で入力してください。")
        end
  
        it 'userが紐ついていないと投稿できない' do
          @collection_sell.user = nil
          @collection_sell.valid?
          expect(@collection_sell.errors.full_messages).to include("Userを入力してください")
        end
  
      end

    end
  end

end
