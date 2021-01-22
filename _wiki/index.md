---
layout  : wikiindex
title   : Wiki
toc     : true
public  : true
comment : false
regenerate: true
---

# </dev>
* [[programming]]
* [[tech]]

# Life
* [[life-log]]
* [[life-guide]]

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

