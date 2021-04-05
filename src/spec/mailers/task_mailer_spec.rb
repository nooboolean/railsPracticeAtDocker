require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do
  let(:task) { FactoryBot.create(:task, name: 'テストタスク', description: 'テスト用タスクです')}

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end

  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe '#creation_email' do
    let(:mail) { TaskMailer.creation_email(task) }

    it '想定通りのメールが生成される' do
      expect(mail.subject).to eq('タスク作成完了メール')
      expect(mail.to).to eq(['user@example.com'])
      expect(mail.from).to eq(['taskleaf@example.com'])

      expect(text_body).to match('以下のメールの作成が完了いたしました。')
      expect(text_body).to match('テストタスク')
      expect(text_body).to match('テスト用タスクです')

      expect(html_body).to match('以下のメールの作成が完了いたしました。')
      expect(html_body).to match('テストタスク')
      expect(html_body).to match('テスト用タスクです')
    end
  end
end
