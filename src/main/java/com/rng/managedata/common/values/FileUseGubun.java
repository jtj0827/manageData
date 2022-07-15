package com.rng.managedata.common.values;

public enum FileUseGubun {

    EDITOR("editor"),
    BOARD("board"),
    ATTACH("attach"),
    PROPOSAL("proposal"),
    THUMBNAIL("thumbnail"),
    ISSUE_FILE("issueFile"),
    BUSINESS("business"),
    SERVER_IMAGE("serverImage"),
    COMPOSITION_IMAGE("CompositionImage"),
    APPLY_FORM("applyForm"),
    DNS_RECORD("dnsRecord"),
    UNUSED_ID("unusedId"),
    DIAGRAM("diagram");



    String text;
    FileUseGubun(String text) {
        this.text = text;
    }

    public String getText() {
        return this.text;
    }

}
