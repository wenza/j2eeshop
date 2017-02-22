package com.worstentrepreneur.utils.jtree;

import com.fasterxml.jackson.annotation.JsonProperty;

public class JTreeState {
    @JsonProperty
    boolean selected = false;
    @JsonProperty
    boolean disabled = false;
    @JsonProperty
    boolean opened = true;

    public JTreeState(boolean selected, boolean disabled) {
        this.selected = selected;
        this.disabled = disabled;
    }

    public JTreeState(boolean selected, boolean disabled, boolean opened) {
        this.selected = selected;
        this.disabled = disabled;
        this.opened = opened;
    }

    public JTreeState() {
    }
}
