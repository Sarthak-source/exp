import {
  StyleSheet,
  Text,
  View,
  Image,
  TextInput,
  ScrollView,
  Pressable,
  ImageBackground,
} from "react-native";
import { SliderBox } from "react-native-image-slider-box";
//import { useNavigation } from "@react-navigation/native";
import { MaterialIcons } from "@expo/vector-icons";
import React from "react";
import { AntDesign } from "@expo/vector-icons";
import Carousel from "../component/Carousel";
import FoodTypes from "../component/FoodTypes";
import MenuItem from "../component/menuItem"
import hotels from "../data/hotels";
import { Ionicons } from "@expo/vector-icons";
import QuickFood from "../component/QuickFood";
// import hotels from "../data/hotels";
// import MenuItem from "../components/MenuItem";



const HomeScreen = () => {
  const data = hotels;

  return (
    <ScrollView style={{ marginTop: 50 }}>
      {/* Search Bar  */}
      <View
        style={{
          flexDirection: "row",
          alignItems: "center",
          justifyContent: "space-between",
          borderWidth: 1,
          margin: 10,
          padding: 10,
          borderColor: "#C0C0C0",
          borderRadius: 7,
        }}
      >
        <TextInput
          style={{ fontSize: 17 }}
          placeholder="Search for Restaurant item or more"
        />
        <AntDesign name="search1" size={24} color="#E52B50" />
      </View>

      {/* Image slider Component */}
      <Carousel />

      {/* Food Item Types */}
      <FoodTypes />

      {/* Quick Food Component */}
      <QuickFood />

      {/* Filter buttons */}
      <View style={{ flexDirection: "row", alignItems: "center", justifyContent: "space-around" }}>
        <Pressable
          style={{
            marginHorizontal: 10,
            flexDirection: "row",
            alignItems: "center",
            borderWidth: 1,
            borderColor: "#D0D0D0",
            padding: 10,
            borderRadius: 20,
            width: 120,
            justifyContent: "center",
          }}
        >
          <Text style={{ marginRight: 6 }}>Filter</Text>
          <Ionicons name="filter" size={20} color="black" />
        </Pressable>

        <Pressable
          style={{
            marginHorizontal: 10,
            flexDirection: "row",
            alignItems: "center",
            borderWidth: 1,
            borderColor: "#D0D0D0",
            padding: 10,
            borderRadius: 20,
            justifyContent: "center",
            width: 120
          }}
        >
          <Text>Sort By Rating</Text>

        </Pressable>

        <Pressable
          style={{
            marginHorizontal: 10,
            flexDirection: "row",
            alignItems: "center",
            borderWidth: 1,
            borderColor: "#D0D0D0",
            padding: 10,
            borderRadius: 20,
            justifyContent: "center",
          }}
        >
          <Text>Sort By Price</Text>

        </Pressable>
      </View>
      {data.map((item, index) => (
        <MenuItem key={index} item={item} />
      ))}
    </ScrollView>
  );
};








export default HomeScreen;

const styles = StyleSheet.create({});


