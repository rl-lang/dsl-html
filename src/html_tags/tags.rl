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
