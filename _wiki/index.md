---
layout  : wikiindex
title   : Wiki
toc     : true
public  : true
comment : false
regenerate: true
---

## </dev>
* [[programming]]
* [[tech]]
* [[Useful-sites]]

## Study
* [[mathematics]]
    *  [[exponentiation]]
## Life
* [[life-log]]
    * [[diary-2021]]
    * [[books-2021]]
    * [[news-2021]]
* [[life-guide]]
    * [[life-cheatsheet]]

---
## Blog posts
<div>
    <ul>
{% for post in site.posts %}
    {% if post.public != false %}
        <li>
            <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">
                {{ post.title }}
            </a>
        </li>
    {% endif %}
{% endfor %}
    </ul>
</div>

