#!/usr/bin/env python3

def dict2xml(d, root_node=None):
	wrap          =     False if None == root_node or isinstance(d, list) else True
	root          = 'objects' if None == root_node else root_node
	root_singular = root[:-1] if 's' == root[-1] and None == root_node else root
	xml           = ''
	children      = []

	if isinstance(d, dict):
		for key, value in dict.items(d):
			if isinstance(value, dict):
				children.append(dict2xml(value, key))
			elif isinstance(value, list):
				children.append(dict2xml(value, key))
			else:
				xml = xml + ' ' + key + '="' + str(value) + '"'
	else:
		for value in d:
			children.append(dict2xml(value, root_singular))

	end_tag = '>' if 0 < len(children) else '/>'

	if wrap or isinstance(d, dict):
		xml = '<' + root + xml + end_tag

	if 0 < len(children):
		for child in children:
			xml = xml + child

		if wrap or isinstance(d, dict):
			xml = xml + '</' + root + '>'

	return xml


test_case_strings = []
while True:
    try:
        line = input()
    except(EOFError):
        break

    if line.startswith("Test Case"):
        test_case_strings.append(line)

test_cases = []
for test_case_string in test_case_strings[1::2]:
    split_line = test_case_string.split(' ')
    name = split_line[3][:-2:]
    passed = True if split_line[4] == "passed" else False
    time = float(split_line[5][1::])
    test_cases.append({"name": name, "passed": passed, "time": time})

test_cases_dict = {
    "testsuite": {
        "name": "LikeTest",
        "tests": 5,
        "testcase": test_cases
    }
}

xml = '<?xml version="1.0" encoding="UTF-8"?>' + dict2xml(test_cases_dict, root_node="testsuites")

print(xml)
