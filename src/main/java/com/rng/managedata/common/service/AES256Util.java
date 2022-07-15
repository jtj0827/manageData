package com.rng.managedata.common.service;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

public class AES256Util {

    /**
     * AES256암호화
     * @param key
     * @param str
     * @return
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     * @throws InvalidKeyException
     * @throws InvalidAlgorithmParameterException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
    public static String encrypt(String key, String str) throws NoSuchPaddingException
            , NoSuchAlgorithmException
            , UnsupportedEncodingException
            , InvalidKeyException
            , InvalidAlgorithmParameterException
            , IllegalBlockSizeException
            , BadPaddingException
    {
        String iv = key.substring(0, 16);
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        Key keySpec = getKeySpec(key);

        c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
        byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));

        return new String(Base64.encodeBase64(encrypted));
    }

    /**
     * AES 256 복호화
     * @param key
     * @param str
     * @return
     * @throws NoSuchPaddingException
     * @throws NoSuchAlgorithmException
     * @throws UnsupportedEncodingException
     * @throws InvalidKeyException
     * @throws InvalidAlgorithmParameterException
     * @throws IllegalBlockSizeException
     * @throws BadPaddingException
     */
    public static String decrypt(String key, String str)throws NoSuchPaddingException
            , NoSuchAlgorithmException
            , UnsupportedEncodingException
            , InvalidKeyException
            , InvalidAlgorithmParameterException
            , IllegalBlockSizeException
            , BadPaddingException
    {
        String iv = key.substring(0, 16);
        Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
        Key keySpec = getKeySpec(key);

        c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
        byte[] byteStr = Base64.decodeBase64(str.getBytes());

        return new String(c.doFinal(byteStr), "UTF-8");
    }

    /**
     * keySpec생성
     * @param key
     * @return
     * @throws UnsupportedEncodingException
     */
    public static Key getKeySpec(String key) throws UnsupportedEncodingException {
        String keyTmp = key.substring(0, 16);
        byte[] keyBytes = keyTmp.getBytes("UTF-8");
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

        return keySpec;
    }

}