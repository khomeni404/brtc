/**
 * Created by IntelliJ IDEA.
 * User: ronnie
 * Date: 7/4/12
 * Time: 1:13 AM
 * To change this template use File | Settings | File Templates.
 */

var authorityDataStore;
var checkBoxSelMod;
var authorityListingEditorGrid;



Ext.onReady(function(){

    authorityDataStore = new Ext.data.Store({
        id: "authorityDataStore",
        url: 'authorityJsonData.buet',
        reader: new Ext.data.JsonReader({
            root: 'authorityList',
            totalProperty: 'totalCount',
            id: 'id'
        },[
            {name: 'id', type: 'int', mapping: 'id'},
            {name: 'authorityName', type: 'string', mapping: 'authorityName'},
            {name: 'authorityDescription', type: 'string', mapping: 'authorityDescription'}
        ]),
        autoLoad : true
    });

    checkBoxSelMod = new Ext.grid.CheckboxSelectionModel();
    authorityListingEditorGrid = new Ext.grid.EditorGridPanel({
        id: "authorityListingEditorGrid",
        store : authorityDataStore,
        selModel : checkBoxSelMod,
        clicksToEdit: 2,
        renderTo: "authority_list",
        width: 560,
        height: 300,
        columns : [
            {
                dataIndex: 'id',
                header: 'ID',
                width: 80,
                sortable: true
            },{
                dataIndex: 'authorityName',
                header: 'Authority Name',
                sortable: true,
                width:150,
                editable: false
            },{
                dataIndex: 'authorityDescription',
                header: 'Authority Description',
                sortable: true,
                width: 200
            }
        ],
        stripeRows : true,
        bbar: new Ext.PagingToolbar({
            store : authorityDataStore,
            pageSize : 15,
            displayInfo : true,
            displaymsg : 'Displaying {0} - {1} of {2}',
            emptyMsg : "No records found"
        }),
        tbar: [{
            xtype: "button",
            text: "Add Authority",
            iconCls: "addRecord",
            handler:function(){
                window.location="createAuthority.buet"
            }
        }]
    });
    authorityDataStore.load({params: {start: 0, limit: 15}});

});