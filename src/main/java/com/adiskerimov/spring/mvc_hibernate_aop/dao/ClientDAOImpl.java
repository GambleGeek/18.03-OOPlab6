package com.adiskerimov.spring.mvc_hibernate_aop.dao;

import com.adiskerimov.spring.mvc_hibernate_aop.entity.Client;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
public class ClientDAOImpl implements ClientDAO{

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Client> getAllClients() {

    Session session = sessionFactory.getCurrentSession();

    Query<Client> query = session.createQuery("from Client", Client.class);
    List<Client> allClients = query.getResultList();

        return allClients;
    }

    @Override
    public Client get(int id) {
        Session session = sessionFactory.getCurrentSession();
        Client client = session.get(Client.class, id);
        return client;
    }

    @Override
    public void saveClient(Client client) {

        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(client);
    }

    @Override
    public void deleteClient(int id){
        Session session = sessionFactory.getCurrentSession();
        Query<Client> query = session.createQuery("delete from Client " +
                "where id =:clientId");
        query.setParameter("clientId", id);
        query.executeUpdate();
    }
}
