package com.worstentrepreneur.utils;

import java.util.ArrayList;
import java.util.List;

public class CombinationsStr {
    private StringBuilder output = new StringBuilder();
    private List<String> result = new ArrayList<>();
    private final int[] arr;
    public CombinationsStr(final int[] ar ){
        arr= ar;
        combine(0);
    }
    private void combine(int start ){
        for( int i = start; i < arr.length; ++i ){
            output.append( arr[i] );
            //System.out.println( output );
            String res = output.toString();
            res = res.replace("", ",");
            res= res.substring(1,res.length()-1);
            System.out.println(res);
            result.add(res);
            if ( i < arr.length ) {
                combine(i + 1);
            }
            output.setLength( output.length() - 1 );
        }
    }

    public List<String> getResult() {
        return result;
    }
    public static void main (String args[]){
        CombinationsStr combobj= new CombinationsStr(new int[]{1,2,3,4,5,6,7,8,9});
    }
}
