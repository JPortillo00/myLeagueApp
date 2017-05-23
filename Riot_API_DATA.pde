String api_key = "RGAPI-98669181-5605-4dad-ba61-49b4a2b22c2c";
String previous_patch;
String current_patch;
boolean update = false;


void initChampList(){
  ArrayList<Integer> champID = new ArrayList<Integer>();
  ArrayList<String> champName = new ArrayList<String>();
  JSONObject ChampList = loadJSONObject("https://na1.api.riotgames.com/lol/platform/v3/champions?api_key=" + api_key);
  JSONArray list = ChampList.getJSONArray("champions");
  for(int i = 0; i < list.size();i++){
    int temp = list.getJSONObject(i).getInt("id");
    champID.add(temp);     
    delay(1000);
    JSONObject champInfo = loadJSONObject("https://na1.api.riotgames.com/lol/static-data/v3/champions/" + str(temp) + "?api_key=" + api_key);
    champName.add(champInfo.getString("name"));
    println(str(i + 1) + ": (" + temp + ") " + champInfo.getString("name"));    
  }
  JSONArray Champions = new JSONArray();
  for(int i = 0; i < champID.size();i++){
    JSONObject temp = new JSONObject();
    temp.setInt("id",champID.get(i));
    temp.setString("name",champName.get(i));
    
    Champions.setJSONObject(i,temp);
    
  } 
  saveJSONArray(Champions,"ChampionList");
  println(Champions);
}

void initMasteryList(){
  JSONObject masterList = loadJSONObject("https://na1.api.riotgames.com/lol/static-data/v3/masteries?api_key=" + api_key).getJSONObject("data");
  JSONArray Masteries = new JSONArray();  
  Object [] masterkeys = masterList.keys().toArray();
  //println(masterList);
  for (int i = 0; i < masterkeys.length;i++){
    JSONObject temp = masterList.getJSONObject(masterkeys[i].toString());
    JSONObject tmp = new JSONObject();
    tmp.setInt("id",temp.getInt("id"));
    tmp.setString("name",temp.getString("name"));
    tmp.setJSONArray("description",temp.getJSONArray("description"));
    Masteries.setJSONObject(i,tmp);
    //println(temp);
    //println(masterkeys[i].toString());
      
  }
  saveJSONArray(Masteries,"MasteryList");
  //println(Masteries);
}

void initRunesList(){
  
  JSONObject runeList = loadJSONObject("https://na1.api.riotgames.com/lol/static-data/v3/runes?api_key=" + api_key).getJSONObject("data");
  JSONArray Runes = new JSONArray();  
  Object [] runekeys = runeList.keys().toArray();
  //println(masterList);
  for (int i = 0; i < runekeys.length;i++){
    JSONObject temp = runeList.getJSONObject(runekeys[i].toString());
    JSONObject tmp = new JSONObject();
    tmp.setInt("id",temp.getInt("id"));
    tmp.setString("name",temp.getString("name"));
    tmp.setString("description",temp.getString("description"));
    Runes.setJSONObject(i,tmp);
    //println(temp);
    //println(masterkeys[i].toString());
      
  }
  saveJSONArray(Runes,"RunesList");
  //println(Runes);
}