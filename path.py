""" simple code to interact with the operating system on which Python is activated """
import os

"""Catching the folder's name including the file with this code, and recovering the file's absolute path"""
current_path = os.path.dirname(os.path.abspath(__file__))
print(ccurrent_path)

templates = os.path.join(current_path, "app", "templates")
print(templates)