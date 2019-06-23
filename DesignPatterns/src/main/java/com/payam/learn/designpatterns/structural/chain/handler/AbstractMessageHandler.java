package com.payam.learn.designpatterns.structural.chain.handler;

import com.payam.learn.designpatterns.structural.chain.Message;

public  abstract  class AbstractMessageHandler {
    private final AbstractMessageHandler nextHandler;

    protected AbstractMessageHandler(AbstractMessageHandler nextHandler) {
        this.nextHandler = nextHandler;
    }
    public  void handle(Message message){
        send(message);
        if(nextHandler!=null){
            nextHandler.handle(message);
        }
    }
    protected abstract void send(Message message);
}
