package com.worstentrepreneur.utils;

import java.util.ArrayList;
import java.util.List;

public class Combinations_backup {
    private StringBuilder output = new StringBuilder();
    private List<int[]> result = new ArrayList<>();
    private final int[] arr;
    public Combinations_backup(final int[] ar ){
        arr= ar;
        combine(0);
    }
    private void combine(int start ){
        for( int i = start; i < arr.length; ++i ){
            output.append( arr[i] );
            //System.out.println( output );
            int[] resArr = new int[output.length()];
            for(int x = 0;x<output.length();x++){
                resArr[x]=Character.getNumericValue(output.charAt(x));
            }
            result.add(resArr);
            if ( i < arr.length ) {
                combine(i + 1);
            }
            output.setLength( output.length() - 1 );
        }
    }

    public List<int[]> getResult() {
        return result;
    }
    public static void main (String args[]){
        Combinations_backup combobj= new Combinations_backup(new int[]{1,2,3,4,5,6,7,8,9});
    }
}
