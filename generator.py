import os
import re
from jinja2.environment import Template

def run():
    env_variables = [v for v in os.environ if v.startswith('T_')]
    variables = {}
    for e in env_variables:
        try:
            val = int(os.getenv(e))
        except ValueError:
            try:
                val = float(os.getenv(e))
            except ValueError:
                val = str(os.getenv(e))

        variables.update({re.sub(r'^T_', '', e): val})
    for file in os.scandir('./templates'):
        with open(file.path) as tf:
            template = Template(tf.read())

        with open(os.path.join('.', 'results', file.name), 'w') as f:
            f.write(template.render(variables))


if __name__ == '__main__':
    run()