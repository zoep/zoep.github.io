---
layout: default
title: Blog
permalink: /blog/
---

# Blog

{% if site.posts.size > 0 %}
<ul class="post-list">
  {% for post in site.posts %}
  <li class="post-item">
    <div class="post-date">{{ post.date | date: "%B %d, %Y" }}</div>
    <div class="post-title"><a href="{{ post.url | relative_url }}">{{ post.title }}</a></div>
    {% if post.excerpt %}<div class="post-excerpt">{{ post.excerpt | strip_html | truncatewords: 30 }}</div>{% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
Coming soon.
{% endif %}
