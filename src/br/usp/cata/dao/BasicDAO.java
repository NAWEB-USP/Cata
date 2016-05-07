package br.usp.cata.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.Criterion;


public interface BasicDAO<ID extends Serializable, T> {
	
    void save(@SuppressWarnings("unchecked") T... objs);

    void delete(@SuppressWarnings("unchecked") T... ts);

    void saveOrUpdate(@SuppressWarnings("unchecked") T... ts);

    T findByID(ID id);

    List<T> findAll();

    List<T> findByCriteria(Criterion... criterion);

    List<T> findByExample(T exampleInstance, String... excludeProperty);
    
}