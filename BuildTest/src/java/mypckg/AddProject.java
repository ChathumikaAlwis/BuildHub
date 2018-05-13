/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypckg;

import java.sql.Date;

/**
 *
 * @author RavianXReaver
 */
public class AddProject 
{
    private String name, status, locationAddress, description;
    private String startDate, endDate, estStart, estEnd;
    private int owner;
    
    public AddProject(String name, String startDate, String endDate, String locationAddress, String description)
    {
        this.name               = name;
        this.owner              = owner;
        this.status             = status;
        this.startDate          = startDate;
        this.endDate            = endDate;
        this.locationAddress    = locationAddress;
        this.description        = description;
    }
    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return the locationAddress
     */
    public String getLocationAddress() {
        return locationAddress;
    }

    /**
     * @param locationAddress the locationAddress to set
     */
    public void setLocationAddress(String locationAddress) {
        this.locationAddress = locationAddress;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return the startDate
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * @param startDate the startDate to set
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * @return the endDate
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * @param endDate the endDate to set
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * @return the est_Start
     */
    public String getEstStart() {
        return estStart;
    }

    /**
     * @param est_Start the estStart to set
     */
    public void setEstStart(String estStart) {
        this.estStart = estStart;
    }

    /**
     * @return the estEnd
     */
    public String getEstEnd() {
        return estEnd;
    }

    /**
     * @param estEnd the estEnd to set
     */
    public void setEstEnd(String estEnd) {
        this.estEnd = estEnd;
    }

    /**
     * @return the owner
     */
    public int getOwner() {
        return owner;
    }

    /**
     * @param owner the owner to set
     */
    public void setOwner(int owner) {
        this.owner = owner;
    }
    
}
