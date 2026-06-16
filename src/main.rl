get html_tags::tags
get println from std::display

fn main() {
    // ---- nav ----
    dec string nav_home = li(null, null, "Home")
    dec string nav_about = li(null, null, "About")
    dec string nav_contact = li(null, null, "Contact")
    dec string nav_list = ul(["nav"], "site-nav", nav_home.concat(nav_about).concat(nav_contact))
    dec string nav = nav_tag(["site-header"], null, nav_list)

    // ---- hero section ----
    dec string heading = h1(null, "title", "Welcome to my site")
    dec string subheading = h2(["muted"], null, "A simple page generated with rl")
    dec string hero = section(["hero"], null, heading.concat(subheading))

    // ---- main content ----
    dec string para1 = p(["text-large", "highlight"], "intro", "This is the first paragraph of the page.")
    dec string para2 = p(null, null, "This one has no class and no id at all, just plain text.")
    dec string link = a(["link"], "main-link", "Learn more")
    dec string content = div(["container"], "main", para1.concat(para2).concat(link))

    // ---- footer ----
    dec string footer_text = p(["muted", "small"], null, "© 2026 my-site. all rights reserved.")
    dec string footer = footer_tag(["site-footer"], null, footer_text)

    // ---- assemble page ----
    dec string body_content = nav.concat(hero).concat(content).concat(footer)
    dec string body_html = body(null, null, body_content)
    dec string html_doc = html(null, null, body_html)
    dec string page = "<!DOCTYPE html>".concat(html_doc)

    println(page)
}

main()
