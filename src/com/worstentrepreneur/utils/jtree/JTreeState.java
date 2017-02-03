package com.worstentrepreneur.utils.jtree;

import com.fasterxml.jackson.annotation.JsonProperty;

public class JTreeState {
    @JsonProperty
    boolean selected = false;
    @JsonProperty
    boolean disabled = false;

    public JTreeState(boolean selected, boolean disabled) {
        this.selected = selected;
        this.disabled = disabled;
    }

    public JTreeState() {
    }
}
