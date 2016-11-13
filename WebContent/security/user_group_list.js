/**
 * Created by IntelliJ IDEA.
 * User: Md Dablu Hossain
 * Date: 7/19/12
 * Time: 12:12 PM
 * To change this template use File | Settings | File Templates.
 */


var allowanceDataStore;
var checkBoxSelMod;
var allowanceListingEditorGrid;
var confirmationMessage;

var checkBoxSelModForGroupAssignment;
var groupListingEditorGridForAssignment;
var allowanceGroupStore;



Ext.onReady(function(){

    allowanceDataStore = new Ext.data.Store({
        id: "allowanceDataStore",
        url: 'componentJsonData.buet',
        reader: new Ext.data.JsonReader({
            root: 'componentList',
            totalProperty: 'totalCount',
            id: 'id'
        },[
            {name: 'componentId', type: 'int', mapping: 'componentId'},
            {name: 'componentName', type: 'string', mapping: 'componentName'},
            {name: 'description', type: 'string', mapping: 'description'}

        ]),
        autoLoad : true
    })

    checkBoxSelMod = new Ext.grid.CheckboxSelectionModel();
    allowanceListingEditorGrid = new Ext.grid.EditorGridPanel({
        id: "allowanceListingEditorGrid",
        store : allowanceDataStore,
        selModel : checkBoxSelMod,
        clicksToEdit: 2,
        renderTo: "user_group_list",
        width: 560,
        height: 300,
        columns : [
            {
                dataIndex: 'componentId',
                header: 'ID',
                width: 80,
                sortable: true
            },{
                dataIndex: 'componentName',
                header: 'Component Name',
                sortable: true,
                width:200,
                editable: false
            },{
                dataIndex: 'description',
                header: 'Description',
                sortable: true,
                width: 75
            }
        ],
        stripeRows : true,
        bbar: new Ext.PagingToolbar({
            store : allowanceDataStore,
            pageSize : 15,
            displayInfo : true,
            displaymsg : 'Displaying {0} - {1} of {2}',
            emptyMsg : "No records found"
        }),
        tbar: [{
            xtype: "button",
            text: "Add Component",
            iconCls: "addRecord",
            handler:function(){
                window.location="createComponent.buet"
            }

        }]
    });
    allowanceDataStore.load({params: {start: 0, limit: 15}});

})