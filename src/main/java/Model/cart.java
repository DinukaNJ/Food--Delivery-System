
package Model;

/**
 *
 * @author kcrdi
 */
public class cart {

    public cart(){}
    
    /**
     * @return the pname
     */
    
    public String getPname() {
        return pname;
    }

    /**
     * @param pname the pname to set
     */
    
    public void setPname(String pname) {
        this.pname = pname;
    }

    /**
     * @return the pid
     */
    
    public int getPid() {
        return pid;
    }

    /**
     * @param pid the pid to set
     */
    
    public void setPid(int pid) {
        this.pid = pid;
    }

    /**
     * @return the uid
     */
    
    public int getUid() {
        return uid;
    }

    
    /**
     * @param uid the uid to set
     */
    
    public void setUid(int uid) {
        this.uid = uid;
    }

    /**
     * @return the odis
     */
    
    public String getOdis() {
        return odis;
    }

    /**
     * @param odis the odis to set
     */
    
    public void setOdis(String odis) {
        this.odis = odis;
    }

    /**
     * @return the total
     */
    
    public double getTotal() {
        return total;
    }
    
    
    /**
     * @param total the total to set
     */
    
    
    public void setTotal(double total) {
        this.total = total;
    }
    
    private String pname;
    private int pid;
    private int uid;
    private String odis;
    private double total;
    
    
}
