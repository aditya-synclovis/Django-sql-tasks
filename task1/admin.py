from django.contrib import admin
from .models import Customer, Product, Order, OrderItem

# Add this to your admin.py or urls.py
admin.site.site_header = "E-Commerce Admin"
admin.site.site_title = "E-Commerce Admin Portal"
admin.site.index_title = "Welcome to E-Commerce Administration"

# Basic registration
admin.site.register(Customer)
admin.site.register(Product)
admin.site.register(Order)
admin.site.register(OrderItem)
