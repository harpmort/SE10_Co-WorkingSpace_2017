/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;
import java.util.List;

public class Order {
    
    public List<String> orderMePlease(List<String> input){
        List<String> myOrder = new ArrayList<>();
        if(input == null){
            input = new ArrayList<>();
        }
        for(int i = 0; i < input.size(); i++){
            
            if(myOrder.size() == 0){
                myOrder.add(input.get(i));
                continue;
            }
            String[] timeDateSplit = input.get(i).split("-");
            String[] date = timeDateSplit[0].split("/");
            String time = timeDateSplit[1];
            for(int j = 0; j < myOrder.size(); j++){
                if(Integer.parseInt(date[2]) < Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[2])){
                    myOrder.add(j, input.get(i));
                    break;
                }else if(Integer.parseInt(date[2]) == Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[2])){
                    if(Integer.parseInt(date[1]) < Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[1])){
                    myOrder.add(j, input.get(i));
                    break;
                    }else if(Integer.parseInt(date[1]) == Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[1])){
                        if(Integer.parseInt(date[0]) < Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[0])){
                        myOrder.add(j, input.get(i));
                        break;
                        }else if(Integer.parseInt(date[0]) == Integer.parseInt(myOrder.get(j).split("-")[0].split("/")[0])){
                            if(Integer.parseInt(time.split(":")[0]) < Integer.parseInt(myOrder.get(j).split("-")[1].split(":")[0])){
                                myOrder.add(j, input.get(i));
                                break;            
                            }else if(Integer.parseInt(time.split(":")[0]) == Integer.parseInt(myOrder.get(j).split("-")[1].split(":")[0])){
                                if(Integer.parseInt(time.split(":")[1]) <= Integer.parseInt(myOrder.get(j).split("-")[1].split(":")[1])){
                                    myOrder.add(j, input.get(i));
                                    break;
                                }else{
                                    myOrder.add(j+1, input.get(i));
                                    break;
                                }
                            }
                        }
                }
                    
                }
                if(j == myOrder.size()-1){
                    myOrder.add(j+1, input.get(i));
                    break;
                }
            }
        }
        return myOrder;
    }
    
}
