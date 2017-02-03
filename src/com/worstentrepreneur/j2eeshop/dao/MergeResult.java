package com.worstentrepreneur.j2eeshop.dao;

import java.util.List;

public class MergeResult {
    public static Object entity;
    public static List<String> errors;

    public MergeResult(Object entity, List<String> errors) {
        this.entity = entity;
        this.errors = errors;
    }
}
