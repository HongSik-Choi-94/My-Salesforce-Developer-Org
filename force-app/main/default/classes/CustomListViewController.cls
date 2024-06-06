public with sharing class CustomListViewController {
    public CustomListViewController() {}

    @AuraEnabled
    public static List<ListView> getListViewList(String targetObjectApiName){
        List<ListView> listViewList = new List<ListView>();
        try {
            listViewList = [SELECT Id, Name, SobjectType FROM ListView WHERE SobjectType =: targetObjectApiName];

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }

        return listViewList;
    }
}