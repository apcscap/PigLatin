public int findFirstA(String word){
  for(int i=0;i<word.length();i++) {
    if(word.charAt(i) == 'a') {
      return i;
    }
  }
  return -1;
}

public int findFirstAorB(String word){
  for(int i=0;i<word.length();i++) {
    if(word.charAt(i) == 'b' || word.charAt(i) == 'a') {
      return i;
    }
  }
  return -1;
}

public int findFirstVowel(String word){
  char[] vowels = new char[] {'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U' };
  for(int i=0;i<word.length();i++) {
    for(int j=0;j<vowels.length;j++) {
      if(word.charAt(i) == vowels[j]) {
        return i;
      }
    }
  }
  return -1;
}

public String pigLatin(String word) {
  if(findFirstVowel(word) == -1) { return word += "ay"; }
  if(findFirstVowel(word) == 0) { return word += "way"; }
  if(word.substring(0,2).equals("qu")) { return word.substring(2,word.length()) + "quay";}
  int firstVI = findFirstVowel(word);
  return word.substring(firstVI, word.length()) + word.substring(0, firstVI) + "ay";
}

public String pigLatinTranslate(String sentence) {
  String result = "";
  String[] words = sentence.split("\\s+");
  for(int i=0;i<words.length;i++) {
    words[i] = pigLatin(words[i]);
  }
  result = String.join(" ", words); 
  return result;
}
public void setup() {
  println(pigLatinTranslate("hi Josh what is up"));
}
