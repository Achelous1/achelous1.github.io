---
layout  : wikiindex
title   : Wiki
toc     : true
public  : true
comment : false
regenerate: true
---

## </dev>
* [[programming]]{프로그래밍}
* [[tech]]
* [[Useful-sites]]

## Life
* [[life-log]]
    * [[diary-2021]]
    * [[books-2021]]
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

