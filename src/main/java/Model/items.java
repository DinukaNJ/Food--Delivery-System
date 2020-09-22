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
public class items {

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

    public String getPimgpath() {
        return pimgpath;
    }

   
    public void setPimgpath(String pimgpath) {
        this.pimgpath = pimgpath;
    }

    public items(){}


    public String getName() {
        return name;
    }


    public void setName(String name) {
        this.name = name;
    }

    
    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

   
    public double getPrice() {
        return price;
    }

    
    public void setPrice(double price) {
        this.price = price;
    }

  
    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }

   
    public String getCat() {
        return cat;
    }

  
    public void setCat(String cat) {
        this.cat = cat;
    }

   
    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
    
    
    
    private String name;
    private String des;
    private double price;
    private String type;
    private String cat;
    private String period;
    private String pimgpath;
    private String id;
    
}
