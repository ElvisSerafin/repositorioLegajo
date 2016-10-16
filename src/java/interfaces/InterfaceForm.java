/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Kiefer
 */
public interface InterfaceForm {
    public ArrayList<Map<String,?>> listForm();
    public boolean addform(Object o);
    public boolean editform(Object o);
    public boolean deleteform(Object o);
           
    
}
