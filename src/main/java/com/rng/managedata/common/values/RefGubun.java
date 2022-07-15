package com.rng.managedata.common.values;

public enum RefGubun {
    SERVER_INFO("serverInfo"),
    SWITCH_EQUIPMENT("switchEquipment"),
    REPLY("reply"),
    BOARD("board"),
    QUESTION("question"),
    FAQ("faq"),
    SALESDATA("salesdata");

    String text;

    RefGubun(String text) {
        this.text = text;
    }

    public String getText() {
        return this.text;
    }

}






