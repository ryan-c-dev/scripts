import xml.etree.ElementTree as ET
import sys

# Get the input and output file paths from the command-line arguments
if len(sys.argv) != 3:
    print(f"Usage: {sys.argv[0]} INPUT_FILE OUTPUT_FILE")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

# Read all lines from the input file
with open(input_file, 'r', encoding='utf-8') as f:
    lines = f.readlines()

# Create the OPML root element
opml = ET.Element("opml", version="2.0")
body = ET.SubElement(opml, "body")

# Create an OPML outline element for each URL
category = ""
for line in lines:
    line = line.strip()
    if line.startswith('" "'):
        continue
    elif line.startswith('"---'):
        category = line.strip('"- ')
        category_outline = ET.SubElement(body, "outline", text=category, title=category)
    elif line:
        url, *name = line.rsplit(' ', 1)
        name = name[0] if name else ""
        name = name.strip('"~ ')
        attributes = {"text": name, "type": "rss", "xmlUrl": url}
        if name:
            attributes["title"] = name
        ET.SubElement(category_outline, "outline", **attributes)

# Write the OPML tree to the output file
tree = ET.ElementTree(opml)
tree.write(output_file, xml_declaration=True, encoding='utf-8')
