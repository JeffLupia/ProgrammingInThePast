import Data.Char
import Prelude

encrypt :: String-> Integer  -> String
encrypt s shiftVal =
 
        map (\char ->
                (chr((mod((subtract 65 (ord(toUpper(char)))) + shiftVal) 26) + 65)) (s) s)
			
decrypt :: String -> Integer -> String
decrypt s shiftVal =
          map (\char ->
                (chr((mod(subtract shiftVal (subtract 65 (ord(toUpper(char))))) 26) + 65)) s) (s)
			
			
main = do
    let shiftVal = 15
    let s ="Pack my box with five dozen liquor jugs"
    print (encrypt s shiftVal)