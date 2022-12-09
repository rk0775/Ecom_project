/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package HelperClasses;

/**
 *
 * @author Rohit
 */
public class StringOperation {
    static public String shortDisProvider(String dis,int count){
        String shortDisArr[]=dis.split(" ");
        String shortDis="";
        if(shortDisArr.length>count){
            for(int i=0;i<count;i++){
                shortDis +=" "+shortDisArr[i];
            }
            return shortDis+" ...";
        }else{
            return dis+"...";
        }
        
    }
}
