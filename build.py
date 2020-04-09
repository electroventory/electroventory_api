from pybuilder.core import use_plugin, init

use_plugin('python.core')
use_plugin('python.install_dependencies')

default_task = ['install_dependencies', ]

@init
def set_properties(project):
    project.depends_on_requirements("requirements.txt")
