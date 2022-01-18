module ApplicationHelper
  def default_meta_tags
    {
      title: 'ご縁箱 - Twitterユーザー同士で楽しめる! ファンレター公開サービス',
      description: 'Twitterシェアに特化したファンレター公開サービスです。ご縁箱を2秒で開設したらMyご縁箱を共有してあなたのフォロワーからファンレターを受け取ってみましょう♪',
      keywords: 'ご縁箱,goenbako,ファンレター,twitter',
      charset: 'UTF-8',
      og: {
        title: '°˖✧ご縁箱✧˖° Twitterユーザー同士で楽しめる! ファンレター公開サービス',
        description: 'ご縁箱を2秒で開設したらMyご縁箱を共有してあなたのフォロワーからファンレターを受け取ってみましょう♪',
        type: 'website',
        url: 'https://goenbako.com',
        image: 'https://goenbako.com/img/TOP_OGP.jpg',
        locale: 'ja_JP'
      },
      twitter: {
        site: '@goenbako',
        card: 'summary_large_image'
      }
    }
  end
end
