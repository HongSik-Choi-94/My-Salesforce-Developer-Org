({
    doInit : function(component, event, helper) {
        const searchTextValue = "TV OLED";
        const content = ['[TV] OLED 고치는방법' , 'OLED 고치기', '[TV] tv보는방법'];

        const keywords = searchTextValue.split(' ').filter(Boolean);

        const escapedKeywords = keywords.map(keyword => keyword.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&'));
        const regex = new RegExp(`(${escapedKeywords.join('|')})`, 'gi');
        
        const contentList = [];
        content.forEach(item => {
            const obj = {
                content : item.replace(regex, "<span class='highlight'>$1</span>")
            }
            contentList.push(obj);
        });
        component.set('v.contentList' , contentList);

    }
})
