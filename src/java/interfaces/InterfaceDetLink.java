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
 * @author Diego Arturo
 */
public interface InterfaceDetLink {
    public boolean add(Object o);
    public boolean edit(Object o);
    public boolean remove(Object o);
    public ArrayList<Map<String,?>> lista();
}

