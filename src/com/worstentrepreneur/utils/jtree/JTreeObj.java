package com.worstentrepreneur.utils.jtree;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class JTreeObj {
    @JsonProperty
    int db_id = 0;
    @JsonProperty
    String icon = "";
    @JsonProperty
    String text = "";
    @JsonProperty
    JTreeState state = new JTreeState(false,false);
    @JsonProperty
    List<JTreeObj> children = new ArrayList<>();

    public JTreeObj(int db_id, String icon, String text, JTreeState state, List<JTreeObj> children) {
        this.db_id = db_id;
        this.icon = icon;
        this.text = text;
        this.state = state;
        this.children = children;
    }

    public JTreeObj() {
    }
}
