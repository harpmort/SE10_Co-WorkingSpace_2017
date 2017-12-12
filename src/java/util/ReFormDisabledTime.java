/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.util.ArrayList;
import java.util.List;

public class ReFormDisabledTime {
    
    public List<String> toSharedRoomDisabled(List<String> input){
        List<String> myDisableds = new ArrayList<>();
        for(int i = 0; i < input.size(); i++){
            if(Integer.parseInt(input.get(i).split("-")[3]) == 0){
                String myTemp = input.get(i).split("-")[0] + "-" + 
                        input.get(i).split("-")[1] + "-" + input.get(i).split("-")[2];
                myDisableds.add(myTemp);
            }
        }
        return myDisableds;
    }
    
}
