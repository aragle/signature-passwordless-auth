import React from "react";
import { StatusBar } from "expo-status-bar";
import { SafeAreaView, StyleSheet, Text, View } from "react-native";
import {
  AntDesign,
  Entypo,
  Ionicons,
  EvilIcons,
  Octicons,
} from "@expo/vector-icons";

const gray = "#91a1bd";

export default function App() {
  return (
    <View style={styles.container}>
      <SafeAreaView
        style={{ alignSelf: "stretch", backgroundColor: "#B5C7CC" }}
      >
        <View style={[styles.header, styles.headerBottomShadow]}>
          <View style={{ marginHorizontal: 24, marginTop: 24 }}>
            <View style={styles.topContainer}>
              {/* <Entypo name="lock" size={24} color={gray} /> */}
              <Octicons name="shield-check" size={20} color={gray} />
              {/* <AntDesign name="qrcode" size={24} color={gray} /> */}
              <View>
                <Text style={styles.title}>Signature</Text>
              </View>
              {/* <Entypo name="gear" size={24} color={gray} /> */}
              <EvilIcons name="gear" size={24} color={gray} />
            </View>
          </View>
        </View>
        <View style={styles.headerRect}>
          <Text style={styles.headerText}>Authentication History</Text>
        </View>
      </SafeAreaView>
      <StatusBar style="auto" />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: "#DEE9FD",
    alignItems: "center",
  },
  topContainer: {
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
  },
  header: {
    backgroundColor: "#DEE9FD",
    borderBottomColor: "#B5C7CC",
    borderBottomWidth: 0.1,
    marginTop: 25,
    paddingBottom: 10,
    borderBottomStartRadius: 20,
    borderBottomEndRadius: 20,
  },
  headerRect: {
    backgroundColor: "#DEE9FD",
    padding: 1,
    borderTopLeftRadius: 20,
    borderTopRightRadius: 20,
    borderBottomColor: "#DEE9FD",
    marginTop: 0,
    width: 330,
    height: 30,
    alignSelf: "center",
  },
  headerBottomShadow: {
    shadowOffset: {
      width: -6,
      height: -6,
    },
    shadowOpacity: 1,
    shadowRadius: 6,
    shadowColor: "#B7C4DD",
  },
  headerText: {
    color: "#91a1bd",
    fontSize: 16,
    fontWeight: "200",
    alignSelf: "center",
    textAlign: "center",
    padding: 2,
  },
  title: {
    fontSize: 20,
    fontWeight: "800",
    fontFamily: "Roboto",
    fontVariant: ["small-caps"],
    color: "gray",
  },
});
