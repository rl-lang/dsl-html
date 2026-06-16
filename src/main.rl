get html_tags::tags
get println from std::display

fn main() {
    // ---- nav ----
    dec string nav_home = generic_tag("li", null, null, "Home")
    dec string nav_about = generic_tag("li", null, null, "About")
    dec string nav_contact = generic_tag("li", null, null, "Contact")
    dec string nav_list = generic_tag("ul", ["nav"], "site-nav", nav_home.concat(nav_about).concat(nav_contact))
    dec string nav = generic_tag("nav", ["site-header"], null, nav_list)

    // ---- hero section ----
    dec string heading = generic_tag("h1", null, "title", "Welcome to my site")
    dec string subheading = generic_tag("h2", ["muted"], null, "A simple page generated with rl")
    dec string hero = generic_tag("section", ["hero"], null, heading.concat(subheading))

    // ---- main content ----
    dec string para1 = generic_tag("p", ["text-large", "highlight"], "intro", "This is the first paragraph of the page.")
    dec string para2 = generic_tag("p", null, null, "This one has no class and no id at all, just plain text.")
    dec string link = generic_tag("a", ["link"], "main-link", "Learn more")
    dec string content = generic_tag("div", ["container"], "main", para1.concat(para2).concat(link))

    // ---- footer ----
    dec string footer_text = generic_tag("p", ["muted", "small"], null, "© 2026 my-site. all rights reserved.")
    dec string footer = generic_tag("footer", ["site-footer"], null, footer_text)

    // ---- assemble page ----
    dec string body_content = nav.concat(hero).concat(content).concat(footer)
    dec string body = generic_tag("body", [], "", body_content)
    dec string html = generic_tag("html", [], "", body)

    dec string page = "<!DOCTYPE html>".concat(html)

    println(page)
}

main()
