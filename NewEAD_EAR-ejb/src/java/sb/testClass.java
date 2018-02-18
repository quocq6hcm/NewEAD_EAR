/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sb;

import javax.ejb.EJB;

/**
 *
 * @author quocq
 */
public class testClass {
    
    @EJB 
    private sb.ProductsFacadeLocal facade;

    int count;
    
    public testClass() {
        this.count = facade.findAll().size();
    }
    
    
    public static void main(String[] args) {
        testClass exec = new testClass();
        System.out.println(exec.count);
    }
}
