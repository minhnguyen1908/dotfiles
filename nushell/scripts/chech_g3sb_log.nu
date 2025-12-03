export def check-g3sb-log [] {
    let pattern = "{date} {time} {thread} {[level]}: {message}"

    ls -a .
        | where type == file
        | get name
        | each { |$file_path|
            open $file_path
        }
        | flatten
        | lines
        | parse -r $pattern
        | group-by thread
        | where { |$group|
            ($group.rows | any { |$row| ($row.message | str contains "QZ0154") })
        }
        | get rows
        | sort-by time
}
