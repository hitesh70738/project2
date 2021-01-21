from unittest.mock import patch
from flask import url_for 
from flask_testing import TestCase


from application import app


class TestBase(TestCase):
    def create_app(self):
        return app


class TestResponse(TestBase):

    def test_Ford1(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Ford', 'car_colour':'red'})
        self.assertEqual(b'30000', response.data)
            

    def test_Nissan1(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Nissan', 'car_colour':'blue'})
        self.assertEqual(b'25000', response.data)
    

    def test_Toyota1(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Toyota', 'car_colour':'yellow'})
        self.assertEqual(b'27000', response.data)
            

    def test_BMW1(self): 
        response = self.client.get(url_for('price'), json={'car_make':'BMW', 'car_colour':'black'})
        self.assertEqual(b'35000', response.data)

    def test_Audi1(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Audi', 'car_colour':'white'})
        self.assertEqual(b'40000', response.data)


    def test_Ford2(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Ford', 'car_colour':'blue'})
        self.assertEqual(b'26000', response.data)

    def test_Nissan2(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Nissan', 'car_colour':'yellow'})
        self.assertEqual(b'23500', response.data)

    def test_Toyota2(self): 
        response = self.client.get(url_for('price'), json={'car_make':'Toyota', 'car_colour':'red'})
        self.assertEqual(b'28000', response.data)

    def test_BMW2(self): 
        response = self.client.get(url_for('price'), json={'car_make':'BMW', 'car_colour':'red'})
        self.assertEqual(b'32000', response.data)     