require_relative 'tsv_buddy'

class FlipFlap
  # Do NOT create an initialize method
def take_yaml(yml)
    require 'yaml'
    @data = YAML::load(yml)
end

def to_yaml
    @data.to_yaml
end
end
