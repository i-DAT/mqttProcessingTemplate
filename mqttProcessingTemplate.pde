//MQTT Parameters
private MQTTLib m;
private String MQTT_BROKER ="tcp://0.0.0.0:0"; // Ip adress and port number
private String CLIENT_ID = "Processing-Example"; // Unique ID
private int[] QOS = {1};
private String[] TOPICS = {"tests"}; //channels we want to subscribe to
private boolean CLEAN_START = true; //Cleans the connection (and resubscribes) when processing restarts
private short KEEP_ALIVE = 30;


void setup(){
 //set up the MQTT Client
 m = new MQTTLib(MQTT_BROKER, new MessageHandler());
 m.connect(CLIENT_ID, CLEAN_START, KEEP_ALIVE);
 m.subscribe(TOPICS, QOS);
 
}

void draw(){
  //do something cool
 
}

void keyPressed() {
  //test publishing a message
  m.publish("outTopic","Hello Processing");
}


//call back functions
private class MessageHandler implements MqttSimpleCallback {
  public void connectionLost() throws Exception {
   System.out.println( "Connection has been lost." );
  }

  public void publishArrived( String topicName, byte[] payload, int QoS, boolean retained ){
   //this is the callback function you need to deal with incoming messages
    
    //you'll need to convert the payload first
    String payloadString = new String(payload);
    //Display the string
    println(payloadString);
   } 

}
