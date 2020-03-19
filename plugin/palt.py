from os import path


def alternate_file(filepath: str) -> str:
    prefix = "test_"
    folders = ["tests", "test"]

    # return first that exists
    for folder in folders:
        alt = path.join(path.abspath(filepath), folder, prefix + path.basename(filepath))
        if path.exists(alt):
            return alt

    # or return best convention (tests)
    return path.join(path.dirname(filepath), "tests", prefix + path.basename(filepath))
