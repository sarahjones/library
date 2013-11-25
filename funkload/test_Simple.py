import unittest
from random import random
from funkload.FunkLoadTestCase import FunkLoadTestCase

class Simple(FunkLoadTestCase):
    """This test use a configuration file Simple.conf."""
    def setUp(self):
        """Setting up test."""
        self.server_url = self.conf_get('main', 'url')

    def test_simple(self):
        # The description should be set in the configuration file
        server_url = self.server_url
        # begin of test --------------------------------------------- 
        self.post(server_url+"/users/sign_in", params=[
            ['utf8', '\xe2\x9c\x93'],
            ['user[email]', 'sarah.e.p.jones+test@gmail.com'],
            ['user[password]', 'password'],
            ['user[remember_me]', '0'],
            ['commit', 'Log in']],
            description="Login")

        self.get(server_url+"/books/checkout?id=1",
            description="Check out the first book")

        self.get(server_url+"/logout",
            description="Logout")
        # end of test -----------------------------------------------

if __name__ in ('main', '__main__'):
    unittest.main()
