get std::display::len
get format, concat from std::str
get is_null, to_string from std::types

// class builder transforms array of strings to 'class="class_1 class_2 ..."'
fn class_builder(arr[string] classes) -> string {
    // initializing the result
    dec string result = format(" class={}",'"'.to_string())
    // enumurate makeshift
    dec int max_index = classes.len() - 1
    dec int current_index = 0
    // looping throught the classes and adding 'class_1 ' if not last item
    for class in classes {
        if (current_index == max_index) {
            // if last item then add it and '"' then break the loop
            result = result.concat(class).concat('"'.to_string())
            break
        }
        // add the item with space and increase the index
        result = result.concat("{} ".format(class))
        current_index += 1
    }
    // returns the contructed class
    return result
}

fn id_builder(string id) -> string {
    return " id={}{}{}".format('"'.to_string(), id, '"'.to_string())
}

dec fn generic_tag = fn(string tag, arr[string] classes, string id, string body) -> string {
    dec string class = ""
    if (!classes.is_null()) {
        class = classes.class_builder()
    }
    dec string fid = ""
    if (!id.is_null()) {
        fid = id.id_builder()
    }
    dec string fbody = ""
    if (!body.is_null()) {
        fbody = body
    }
    return format("<{}{}{}>{}</{}>", tag, class, fid, fbody, tag)
}

dec fn p = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("p", classes, id, body)
}

dec fn div = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("div", classes, id, body)
}

dec fn h1 = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("h1", classes, id, body)
}

dec fn h2 = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("h2", classes, id, body)
}

dec fn span = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("span", classes, id, body)
}

dec fn a = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("a", classes, id, body)
}

dec fn body = fn(arr[string] classes, string id, string content) -> string {
    return generic_tag("body", classes, id, content)
}

dec fn li = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("li", classes, id, body)
}

dec fn ul = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("ul", classes, id, body)
}

dec fn nav_tag = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("nav", classes, id, body)
}

dec fn section = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("section", classes, id, body)
}

dec fn footer_tag = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("footer", classes, id, body)
}

dec fn html = fn(arr[string] classes, string id, string body) -> string {
    return generic_tag("html", classes, id, body)
}
