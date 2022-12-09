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
public class Message {
    public String messageTitle;
    public String message;
    public String type;
    public Message(String title,String msg,String type){
        messageTitle=title;
        message=msg;
        this.type=type;
    }  
}
