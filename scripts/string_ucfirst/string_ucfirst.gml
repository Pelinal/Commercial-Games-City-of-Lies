function string_ucfirst(str) {
    var out = string_upper(string_char_at(str, 1));
    out += string_copy(str, 2, string_length(str) - 1);
    return out;
}