import yaml
import copy

def get_file_content():
    with open('config.yaml', 'r') as f:
        content = yaml.load(f, Loader=yaml.FullLoader)
    return content

def get_resources_from_yaml(content):
    resources = content['resources']
    for resource in content['resources']:
        value = resource.get("type", None)
        if value and 'compute.v1.firewall' == value:
            return resource
    return None


def update_yaml_file(data):
    yaml.Dumper.ignore_aliases = lambda *args : True
    with open('config.yaml', 'w') as f:
        yaml.dump(data, f, default_flow_style=False)
        return f

def main():
    content = get_file_content()
    data = get_resources_from_yaml(content)
    updated_data = copy.deepcopy(data)
    updated_data["name"] = "allow22" #"%s-%s" %(rule_name, CLUSTER_NAME.lower())
    updated_data["properties"]["sourceRanges"] = ["3.127.25.25"]
    content["resources"].append(updated_data)
    yaml_file = update_yaml_file(content)
    with open(yaml_file.name, 'r') as f:
        content = yaml.load(f, Loader=yaml.FullLoader)
    print(content)

if __name__ == '__main__':
    main()
