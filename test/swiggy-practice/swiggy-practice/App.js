import { StyleSheet } from "react-native";
import StackNavigator from "./navigation";
import { Provider } from "react-redux";
import store from "./store";


export default function App() {
  return (
    <Provider store={store}>
      <StackNavigator/>
    </Provider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#fff",
  },
});

