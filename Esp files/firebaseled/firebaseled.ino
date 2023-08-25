
#include <FirebaseESP8266.h>  //https://github.com/mobizt/Firebase-ESP8266
#include <ESP8266WiFi.h>


#define FIREBASE_HOST "lightapp-e11f3-default-rtdb.asia-southeast1.firebasedatabase.app"
#define FIREBASE_AUTH "BKuQxVloB8xBqlTufC2TeHWHNqq5YeJI6rSFe5YX"
#define WIFI_SSID "Last Night Playerzzz"
#define WIFI_PASSWORD "BSFNR99666"

FirebaseData firebaseData;

FirebaseJson json;


int updates;
int failedUpdates;
int pos;
int stringplace = 0;
float my_longitude=0.0;
float my_latitude=0.0;

String timeUp;
String nmea[15];
String labels[12] {"Time: ", "Status: ", "Latitude: ", "Hemisphere: ", "Longitude: ", "Hemisphere: ", "Speed: ", "Track Angle: ", "Date: "};
void wifiConnect()
{
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to Wi-Fi");
  while (WiFi.status() != WL_CONNECTED)
  {
    Serial.println("not connected");
    delay(300);
  }
  Serial.println();
  Serial.print("Connected with IP: ");
  Serial.println(WiFi.localIP());
  Serial.println();
}

void print_ok()
{
    Serial.println("------------------------------------");
    Serial.println("OK");
    Serial.println("PATH: " + firebaseData.dataPath());
    Serial.println("TYPE: " + firebaseData.dataType());
    Serial.println("ETag: " + firebaseData.ETag());
    Serial.println("------------------------------------");
    Serial.println();
}

void print_fail()
{
    Serial.println("------------------------------------");
    Serial.println("FAILED");
    Serial.println("REASON: " + firebaseData.errorReason());
    Serial.println("------------------------------------");
    Serial.println();
}

void firebaseReconnect()
{
  Serial.println("Trying to reconnect");
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}


void setup() {
  Serial.begin(9600);
  

  wifiConnect();

  Serial.println("Connecting Firebase.....");
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
  Firebase.reconnectWiFi(true);
  Serial.println("Firebase OK.");
}

void loop() {
 
  
   /* for (int i = 0; i < 9; i++) {
      Serial.print(labels[i]);
      Serial.print(nmea[i]);
      Serial.println("");
    }*/
   

//      my_latitude = 20.566;
//      my_longitude = 23.932;
//
//      if(Firebase.setFloat(firebaseData, "/GPS/f_Lat", my_latitude))
//      {
//       // print_ok();
//      
//      }
//    else
//      {
//        print_fail();}
//    //-------------------------------------------------------------
//    if(Firebase.setFloat(firebaseData, "/GPS/f_Lon", my_longitude))
//      {
//        //print_ok();
//        }
//    else
//      {print_fail();}

    String l1;
    String l2;

     //Serial.println("L1 data is:");
     Serial.printf("Get string... %s\n", Firebase.getString(firebaseData, F("/light/isOn")) ? firebaseData.to<const char *>() : firebaseData.errorReason().c_str());
      l1 = firebaseData.to<const char *>();
      Serial.print("Variable data of light is:");
      Serial.println(l1);

     // Serial.println("L2 data is:");
     Serial.printf("Get string... %s\n", Firebase.getString(firebaseData, F("/charger/isOn")) ? firebaseData.to<const char *>() : firebaseData.errorReason().c_str());
      l2 = firebaseData.to<const char *>();
      Serial.print("Variable data of charger is:");
      Serial.println(l2);
      
      
delay(5000);
  }
      

  
