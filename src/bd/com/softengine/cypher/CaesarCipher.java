package bd.com.softengine.cypher;

/**
 * Created by ayatullah on 04/05/2015.
 */
public class CaesarCipher {
    static char alphabet[] = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm',
            'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};  //0-25 = 26

    public static void main(String[] args) {
        String msg = "This is me DPDC/f";
        System.out.println("msg = " + msg);
        int shift = 99;
        System.out.println("shift = " + shift);
        String encryptedMsg = encrypt(msg, shift);
        System.out.println("Encrypted Msg = " + encryptedMsg);
        String decryptedMsg = decrypt(encryptedMsg, shift);
        System.out.println("DecryptedMsg = " + decryptedMsg);
    }

    public static String encrypt(String text, int shift) {
        String enString = "";
        char[] charText = text.toCharArray();
        for (int i = 0; i < charText.length; i++) {
            char c = charText[i];
            boolean isUpper = Character.isUpperCase(c);
            int indexC = getIndex(c, isUpper);
            if (indexC != -1) {
                indexC = indexC + shift;
                if (indexC > 25)
                    indexC = indexC % 26;

                enString += getChar(indexC,isUpper);

            } else {
                enString += c;
            }
        }
        return enString;
    }

    public static String decrypt(String enText, int shift) {
        String enString = "";
        char[] charText = enText.toCharArray();
        for (int i = 0; i < charText.length; i++) {
            char c = charText[i];
            boolean isUpper = Character.isUpperCase(c);
            int indexC = getIndex(c,isUpper);
            if (indexC != -1) {
                indexC = indexC - shift;
                //if(indexC<0)indexC = (-indexC);
                if (indexC < -1){
                    int remainder = indexC%26;
                    if(remainder < 0)
                        indexC = 26 + remainder;
                    else
                        indexC = remainder;
                }
                enString += getChar(indexC, isUpper);
            } else {
                enString += c;
            }
        }
        return enString;
    }

    public static int getIndex(char c, boolean isUpper) {
        if(isUpper){
            return new String(alphabet).indexOf(Character.toLowerCase(c));
        }else {
            return new String(alphabet).indexOf(c);
        }
    }

    public static char getChar(int index, boolean isUpper) {
        if (isUpper) {
            return Character.toUpperCase(alphabet[index]);
        } else {
            return alphabet[index];
        }

    }


}
