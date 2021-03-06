/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sse.bank.business;

import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.apache.commons.codec.digest.DigestUtils;
import sse.bank.db.access.bean.gen.AccountFacade;
import sse.bank.db.access.bean.gen.CustomerFacade;
import sse.bank.db.domain.Account;
import sse.bank.db.domain.Customer;

/**
 *
 * @author Raghunath
 */
@Stateless
public class UserAccountBusinessBean {

    @PersistenceContext(unitName = "org.glassfish-samples_sse-secure-bank_war_4.0-SNAPSHOTPU")
    private EntityManager em;

    @EJB
    AccountFacade accountFacade;

    @EJB
    CustomerFacade customerFacade;

   

    /**
     * 
     * @param userId
     * @param password
     * @return 
     */
    public Customer validate(String userId, String password) {

        Customer cus = customerFacade.find(userId);
        try {
            if (cus != null && (cus.getCustomerId().equals(userId)
                    || //<=== Change to &&
                    cus.getPassword().equals(hashAndSetPassword(password)))) {
                return cus;
            }
//          Dummy Code for Testing
        } catch (Exception ex) {
            Logger.getLogger(UserAccountBusinessBean.class.getName()).log(Level.SEVERE, null, ex);
        }

        return null;
    }

    public String hashAndSetPassword(String plainPassword) throws Exception {
        if (plainPassword == null) {
            throw new Exception("Password not specified");
        }
        if (plainPassword.equals("")) {
            throw new Exception("Password blank");
        }
        String hashedPassword = DigestUtils.md5Hex(plainPassword);
        return hashedPassword;
    }

    public void resetPassword(){
        
    }
}
