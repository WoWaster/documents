try:
    from project.taskN import some_func
except ImportError:
    pytestmark = pytest.mark.skip("Task N is not ready to test!")
