from robot.libraries.BuiltIn import BuiltIn
from selenium.common.exceptions import NoSuchElementException, StaleElementReferenceException
from selenium.webdriver.support.ui import WebDriverWait


def wait_for_stable_element(locator):
    selenium = BuiltIn().get_library_instance('SeleniumLibrary')
    previous_rect = None

    def stable(driver):
        nonlocal previous_rect
        try:
            element = selenium.find_element(locator)
            if not element.is_displayed() or not element.is_enabled():
                previous_rect = None
                return False
            rect = element.rect
            ready = rect == previous_rect
            previous_rect = rect
            return ready
        except (NoSuchElementException, StaleElementReferenceException):
            previous_rect = None
            return False

    WebDriverWait(selenium.driver, 15).until(stable)
