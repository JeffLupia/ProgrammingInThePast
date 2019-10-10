program CaesarCipher

    implicit none
  
    Character(len = 39) :: encryptedVal, encrypt, decrypt, decryptedVal, input
!Executable statements 

    input = 'Pack my box with five dozen liquor jugs'
    encryptedVal = encrypt(input, 1)
    decryptedVal = decrypt(encryptedVal, 1)
    print *, 'The message is: ', input
    print *, 'The encrypted message is: ', encryptedVal
    print *, 'The decrypted message is: ', decryptedVal
    call solve(input, 26)
end program CaesarCipher
 
function encrypt(input, shiftValue)
    implicit none
    
    Character(len = 39) :: encrypt 
    Character(len = *), intent(in) :: input
    integer :: shiftValue, cnt
    encrypt = input
    cnt = 1
    
    do while(cnt <= len(encrypt))
        if(encrypt(cnt:cnt) >= 'A' .and. encrypt(cnt:cnt) <= 'Z')  then
            encrypt(cnt:cnt) = achar(iachar('A') + modulo((iachar(encrypt(cnt:cnt)) - iachar('A')+ shiftValue), 26))
        else if(encrypt(cnt:cnt) >= 'a' .and. encrypt(cnt:cnt) <= 'z')  then
            encrypt(cnt:cnt) = achar(iachar('a') + modulo((iachar(encrypt(cnt:cnt)) - iachar('a')+ shiftValue), 26))
        end if
        cnt = cnt + 1
    end do
end function encrypt


function decrypt(input, shiftValue)
    implicit none
    
    Character(len = 39) :: decrypt 
    Character(len = *), intent(in) :: input
    integer :: shiftValue, cnt
    decrypt = input
    cnt = 1
    
    do while(cnt <= len(decrypt))
        if(decrypt(cnt:cnt) >= 'A' .and. decrypt(cnt:cnt) <= 'Z')  then
            decrypt(cnt:cnt) = achar(iachar('A') + modulo((iachar(decrypt(cnt:cnt)) - iachar('A')- shiftValue), 26))
       else if(decrypt(cnt:cnt) >= 'a' .and. decrypt(cnt:cnt) <= 'z')  then
        decrypt(cnt:cnt) = achar(iachar('a') + modulo((iachar(decrypt(cnt:cnt)) - iachar('a')- shiftValue), 26))
        end if
        cnt = cnt + 1
    end do
end function decrypt

subroutine solve(input, maxShiftVal)
    implicit none
    Character(len = 39) :: encrypt
    Character(len = *), intent(in) :: input
    integer :: maxShiftVal, cnt
    cnt = 0
    do while(cnt <= maxShiftVal)
        print *, 'Caesar ', (maxShiftVal - cnt), ': ', encrypt(input, cnt)
        cnt = cnt + 1
    end do
end subroutine solve

