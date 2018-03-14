---
title: pages.faq

namespace: faq

layout: page
permalink:   /faq
permalink_de:   /faq
---

{%- for faq in site.faqs -%}
<section class="faq_question">
  {%- assign date_format = site.date_format | default: "%Y-%m-%d" -%}
  <h2>
      {% t faq.question %}
      <small class="text-muted">{{ version.date | date: date_format }}</small>
  </h2>
  {% t faq.answer %}
</section>
{%- endfor -%}
