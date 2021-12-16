module ApplicationHelper
  def default_meta_tags
    {
      title: "ご縁箱 - Twitterシェアに特化したファンレター公開サービス -",
      description: "Twitterシェアに特化したファンレター公開サービスです。ご縁箱をかんたん開設したらあなたのファンにTwitterでシェアしてみましょう！",
      keywords: "ご縁箱,goenbako,ファンレター,twitter",
      charset: "UTF-8",
      og: {
        title: "ご縁箱",
        description: "Twitterシェアに特化したファンレター公開サービスです。ご縁箱をかんたん開設したらあなたのファンにTwitterでシェアしてみましょう！",
        type: "website",
        url: 'https://goenbako.com',
        image: 'https://goenbako.com/img/logo.png',
        locale: "ja_JP"
      },
      twitter: {
        site: '@goenbako',
        card: 'summary_large_image',
      },
    }
  end
end
