import subprocess
import shutil
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("tag")
args = parser.parse_args()

subprocess.call(["git", "checkout", args.tag], cwd="Sources/libwebp/libwebp")

webp_headers = ["decode.h", "encode.h", "format_constants.h", "mux.h", "mux_types.h", "types.h"]
for file in webp_headers:
    shutil.copy(f"Sources/libwebp/libwebp/src/webp/{file}", "Sources/libwebp/includes/webp/")

shutil.copy("Sources/libwebp/libwebp/sharpyuv/sharpyuv.h", "Sources/libwebp/includes/sharpyuv/")
