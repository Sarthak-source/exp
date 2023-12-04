import { StyleSheet } from 'react-native'
import React from 'react'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import  HomeScreen  from './pages/homePage';
import  MenuScreen  from './pages/menuPage';
import CartScreen from './pages/CartScreen';
import LoadingScreen from './pages/LoadingScreen';
import OrderScreen from './pages/OrderScreen';


const StackNavigator = () => {
  const Stack = createNativeStackNavigator();
  return (
    <NavigationContainer>
      <Stack.Navigator>
      <Stack.Screen name="Home" component={HomeScreen} options={{headerShown:false}}/>
        <Stack.Screen name="Menu" component={MenuScreen} options={{headerShown :false}}/>
        <Stack.Screen name="Cart" component={CartScreen} options={{headerShown :false}}/>
        <Stack.Screen name="Loading" component={LoadingScreen} options={{headerShown :false}}/>
        <Stack.Screen name="Order" component={OrderScreen} options={{headerShown :false}}/>
      </Stack.Navigator>
    </NavigationContainer>
  )
}


export default StackNavigator

const styles = StyleSheet.create({})