<%@page contentType="text/html"%>
<%@page pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
            <title>New SavingsAccount</title>
            <link rel="stylesheet" type="text/css" href="/sse-secure-bank-duplicate/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New SavingsAccount</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{savingsAccount.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Interest:"/>
                    <h:inputText id="interest" value="#{savingsAccount.savingsAccount.interest}" title="Interest" />
                    <h:outputText value="AccountNumber:"/>
                    <h:inputText id="accountNumber" value="#{savingsAccount.savingsAccount.accountNumber}" title="AccountNumber" required="true" requiredMessage="The accountNumber field is required." />
                    <h:outputText value="Account:"/>
                    <h:selectOneMenu id="account" value="#{savingsAccount.savingsAccount.account}" title="Account" required="true" requiredMessage="The account field is required." >
                        <f:selectItems value="#{account.accountItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{savingsAccount.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{savingsAccount.listSetup}" value="Show All SavingsAccount Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
