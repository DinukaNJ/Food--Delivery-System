/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author kcrdi
 */
public class option {

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    public option(){}
   
   
    public String getType() {
        return type;
    }


    public void setType(String type) {
        this.type = type;
    }

 
    public String getOptions() {
        return options;
    }

    
    public void setOptions(String options) {
        this.options = options;
    }

    public String getPrice() {
        return price;
    }
    
    public void setPrice(String price) {
        this.price = price;
    }
    
    private String type;
    private String options;
    private String price;
    
    
    
    private String id;
    
    
}
