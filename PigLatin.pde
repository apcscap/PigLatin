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

public int findSpecialChar(String word) {
    char[] specials = new char[] {'.', ',', '!', '#', ';', ':'};
    for(int i=0;i<word.length();i++) {
        for(int j=0;j<specials.length;j++) {
            if(word.charAt(i) == specials[j]) return i;
        }
    }
    return -1;
}
public String pigLatin(String word) {
    if(word.length()==0) return "";
    int index = findSpecialChar(word);
    String specialChar = index != -1 ? word.substring(index, index+1) : "";
    word = index != -1 ? word.substring(0, index) + word.substring(index+1) : word;
  	if(findFirstVowel(word) == -1) { return word += "ay" + specialChar; }
  	if(findFirstVowel(word) == 0) { return word += "way" + specialChar; }
  	if(word.substring(0,2).equals("qu")) { return word.substring(2,word.length()) + "quay" + specialChar;}
  	int firstVI = findFirstVowel(word);
  	return word.substring(firstVI, word.length()) + word.substring(0, firstVI) + "ay" + specialChar;
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
	String[] lines = loadStrings("LowellHymn.txt");
	for(String line: lines) {
		println(pigLatinTranslate(line));
	}
	// println(pigLatinTranslate("hi Josh what is up"));
}
