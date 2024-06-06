public with sharing class Utills {
    public Utills() {

    }

    /**
     * @param objectName
     * @param fieldName
     * @return
     * 
     * 키를 값으로, 값을 선택 목록의 레이블로 사용하여 맵을 반환합니다.
     */
    public static Map<String, String> getPicklistValuesByLabel(String objectName, String fieldName){

        Map<String, String> options = new Map<String, String>();
        
        SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
        List<Schema.PicklistEntry> picklistEntries = objectType.getDescribe().fields.getMap().get(fieldName).getDescribe().getPicklistValues();

        for (Schema.PicklistEntry entry : picklistEntries) {
            options.put(entry.getValue(), entry.getLabel());
        }

        return options;
    }

    /**
     * @param objectName
     * @param fieldName
     * @return 
     * 
     * 라벨을 키값으로, 값을 선택 목록의 값으로 사용하여 맵을 반환합니다.
     */
    public static Map<String, String> getPicklistLabelByValue(String objectName, String fieldName){
        
        Map<String, String> options = new Map<String, String>();
        
        SObjectType objectType = Schema.getGlobalDescribe().get(objectName);
        List<Schema.PicklistEntry> picklistEntries = objectType.getDescribe().fields.getMap().get(fieldName).getDescribe().getPicklistValues();

        for (Schema.PicklistEntry entry : picklistEntries) {
            options.put(entry.getLabel(), entry.getValue());
        }

        return options;
    }

}