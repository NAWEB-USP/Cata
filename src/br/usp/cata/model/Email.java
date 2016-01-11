package br.usp.cata.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;


public class Email implements Serializable {

    private static final long serialVersionUID = 943210483745020L;

    private String subject;
    private String body;
    private String hostname;
    private String port;
    private String user;
    private String password;
    private String fromAddress;
    private List<String> toAddresses;
    private String fromPersonal;

    public Email() {
        this.toAddresses = new ArrayList<String>();
    }

    public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getHostname() {
		return hostname;
	}

	public void setHostname(String hostname) {
		this.hostname = hostname;
	}

	public String getPort() {
		return port;
	}

	public void setPort(String port) {
		this.port = port;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFromAddress() {
		return fromAddress;
	}

	public void setFromAddress(String fromAddress) {
		this.fromAddress = fromAddress;
	}

	public List<String> getToAddresses() {
		return toAddresses;
	}

	public void setToAddresses(List<String> toAddresses) {
		this.toAddresses = toAddresses;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public void addReceiver(String receiverEmail) {
        this.toAddresses.add(receiverEmail);
    }
	
	public String getFromPersonal() {
		return fromPersonal;
	}

	public void setFromPersonal(String fromPersonal) {
		this.fromPersonal = fromPersonal;
	}
	
}
