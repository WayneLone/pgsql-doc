<head prefix="og: http://ogp.me/ns#">
  <meta charset="utf-8">
  <title>{% if page.title %}{{ page.title }} | {% endif %}{{ config.title }}</title>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Canonical links -->
  <link rel="canonical" href="{{ url }}">
  <!-- Alternative links -->
  {% if page.layout == 'page' or page.layout == 'index' %}
    {% for lang in site.data.languages %}
      <link rel="alternative" hreflang="{{ loop.key }}" href="{{ canonical_url(loop.key) }}">
    {% endfor %}
  {% endif %}
  <!-- Icon -->
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
  <!-- CSS -->
  <!-- build:css build/css/navy.css -->
  {{ css('css/navy') }}
  <!-- endbuild -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/typeface-lato@0.0.75/index.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.3.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/docsearch.js/1/docsearch.min.css">
  <!-- RSS -->
  {{ feed_tag('atom.xml') }}
  <!-- Open Graph -->
  {{ open_graph({
    fb_admins: config.fb_admins,
    twitter_site: config.twitter
  }) }}
  <!-- Google Analytics -->
  {{ partial('google_analytics') }}
  <script>
     (adsbygoogle = window.adsbygoogle || []).push({
          google_ad_client: "ca-pub-6482217598104186",
          enable_page_level_ads: true
     });
  </script>
</head>
