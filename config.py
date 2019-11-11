# -*- coding: utf-8 -*-
"""
Created on Tue Nov  5 15:14:42 2019

@author: Sachi
"""

from os import environ


class Config:
    """Set Flask configuration vars from .env file."""

    # General
    TESTING = False #environ["TESTING"]
    FLASK_DEBUG = False #environ["FLASK_DEBUG"]
    SECRET_KEY = 'this-really-needs-to-be-changed' #environ.get('SECRET_KEY')

    # Database
    SQLALCHEMY_DATABASE_URI = "sqlite:///Users\\Sachi\\Homework\\GitPS\\Skin-Diary\\log_users.db" #environ.get("SQLALCHEMY_DATABASE_URI")
    SQLALCHEMY_TRACK_MODIFICATIONS = False #environ.get("SQLALCHEMY_TRACK_MODIFICATIONS") 