import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class SupplyChainDataLoader:
    """
    Load and preprocess supply chain data from multiple sources
    """
    
    def __init__(self, data_path):
        self.data_path = data_path
        self.inventory_data = None
        self.orders_data = None
        self.logistics_data = None
        self.supplier_data = None
        
    def load_inventory_data(self, filepath):
        """Load inventory data from CSV"""
        try:
            self.inventory_data = pd.read_csv(filepath)
            logger.info(f"Loaded inventory data: {self.inventory_data.shape}")
            return self.inventory_data
        except Exception as e:
            logger.error(f"Error loading inventory data: {e}")
            raise
    
    def load_orders_data(self, filepath):
        """Load historical orders data"""
        try:
            self.orders_data = pd.read_csv(filepath)
            self.orders_data['order_date'] = pd.to_datetime(self.orders_data['order_date'])
            logger.info(f"Loaded orders data: {self.orders_data.shape}")
            return self.orders_data
        except Exception as e:
            logger.error(f"Error loading orders data: {e}")
            raise
    
    def load_logistics_data(self, filepath):
        """Load logistics and transportation data"""
        try:
            self.logistics_data = pd.read_csv(filepath)
            self.logistics_data['shipment_date'] = pd.to_datetime(self.logistics_data['shipment_date'])
            self.logistics_data['delivery_date'] = pd.to_datetime(self.logistics_data['delivery_date'])
            logger.info(f"Loaded logistics data: {self.logistics_data.shape}")
            return self.logistics_data
        except Exception as e:
            logge
