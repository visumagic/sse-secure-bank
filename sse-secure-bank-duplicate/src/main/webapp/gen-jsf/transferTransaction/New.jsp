<%@page contentType="text/html"%>
<%@page pageEncoding="windows-1252"%>
<%@taglib uri="http://java.sun.com/jsf/core" prefix="f" %>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h" %>
<f:view>
    <html>
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
            <title>New TransferTransaction</title>
            <link rel="stylesheet" type="text/css" href="/sse-secure-bank-duplicate/faces/jsfcrud.css" />
        </head>
        <body>
            <h:panelGroup id="messagePanel" layout="block">
                <h:messages errorStyle="color: red" infoStyle="color: green" layout="table"/>
            </h:panelGroup>
            <h1>New TransferTransaction</h1>
            <h:form>
                <h:inputHidden id="validateCreateField" validator="#{transferTransaction.validateCreate}" value="value"/>
                <h:panelGrid columns="2">
                    <h:outputText value="Amount:"/>
                    <h:inputText id="amount" value="#{transferTransaction.transferTransaction.amount}" title="Amount" />
                    <h:outputText value="TransactionId:"/>
                    <h:inputText id="transactionId" value="#{transferTransaction.transferTransaction.transactionId}" title="TransactionId" required="true" requiredMessage="The transactionId field is required." />
                    <h:outputText value="Transaction:"/>
                    <h:selectOneMenu id="transaction" value="#{transferTransaction.transferTransaction.transaction}" title="Transaction" required="true" requiredMessage="The transaction field is required." >
                        <f:selectItems value="#{transaction.transactionItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="ToAccount:"/>
                    <h:selectOneMenu id="toAccount" value="#{transferTransaction.transferTransaction.toAccount}" title="ToAccount" required="true" requiredMessage="The toAccount field is required." >
                        <f:selectItems value="#{account.accountItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>
                    <h:outputText value="FromAccount:"/>
                    <h:selectOneMenu id="fromAccount" value="#{transferTransaction.transferTransaction.fromAccount}" title="FromAccount" required="true" requiredMessage="The fromAccount field is required." >
                        <f:selectItems value="#{account.accountItemsAvailableSelectOne}"/>
                    </h:selectOneMenu>

                </h:panelGrid>
                <br />
                <h:commandLink action="#{transferTransaction.create}" value="Create"/>
                <br />
                <br />
                <h:commandLink action="#{transferTransaction.listSetup}" value="Show All TransferTransaction Items" immediate="true"/>
                <br />
                <br />
                <h:commandLink value="Index" action="welcome" immediate="true" />

            </h:form>
        </body>
    </html>
</f:view>
