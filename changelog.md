---
title: pages.changelog

namespace: changelog

layout: page
permalink:   /changelog
permalink_de:   /changelog
---

{%- for version in site.changelog -%}
<section class="app_version">
  {%- assign date_format = site.date_format | default: "%Y-%m-%d" -%}
  <h2 id="version{{ version.slug }}">
      {{ version.title | escape }}
      <small class="text-muted">{{ version.date | date: date_format }}</small>
  </h2>
  {{ version.content }}
</section>
{%- endfor -%}
