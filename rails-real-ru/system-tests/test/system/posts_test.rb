# frozen_string_literal: true

require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one) # Предполагается, что у вас есть фикстуры или фабрики для постов
  end

  test 'создание поста' do
    visit posts_url
    click_on 'New Post'

    fill_in 'Title', with: 'Новый пост'
    fill_in 'Body', with: 'Это новый пост'
    click_on 'Create Post'

    assert_text 'Post was successfully created.'
  end

  test 'просмотр поста' do
    visit post_url(@post)

    assert_text @post.title
    assert_text @post.body
  end

  test 'редактирование поста' do
    visit edit_post_url(@post)

    fill_in 'Title', with: 'Измененный заголовок'
    fill_in 'Body', with: 'Измененный текст'
    click_on 'Update Post'

    assert_text 'Post was successfully updated.'
  end

  test 'удаление поста' do
    visit posts_url

    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Post was successfully destroyed.'
  end
end
