---
title: pages.faq

namespace: faq

layout: page
permalink:   /faq
---

{% assign sorted_faqs = site.faq | sort: 'slug' %}

{%- for faq in sorted_faqs -%}
  <section class="faq_question">
    <h2 class="h3">{{ faq.title }}</h2>
    {{ faq.content }}
  </section>
{%- endfor -%}
