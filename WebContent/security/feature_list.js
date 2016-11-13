/**
 * Created by IntelliJ IDEA.
 * User: Md Dablu Hossain
 * Date: 7/18/12
 * Time: 11:20 AM
 * To change this template use File | Settings | File Templates.
 */


var featureDataStore;
var checkBoxSelMod;
var featureListingEditorGrid;
var confirmationMessage;

var checkBoxSelModForGroupAssignment;
var groupListingEditorGridForAssignment;
var allowanceGroupStore;



Ext.onReady(function(){

    featureDataStore = new Ext.data.Store({
        id: "featureDataStore",
        url: 'featureJsonData.buet',
        reader: new Ext.data.JsonReader({
            root: 'featureList',
            totalProperty: 'totalCount',
            id: 'id'
        },[
            {name: 'id', type: 'int', mapping: 'id'},
            {name: 'description', type: 'string', mapping: 'description'},
            {name: 'operation', type: 'string', mapping: 'operation'},
            {name: 'componentId', type: 'boolean', mapping: 'componentId'}
        ]),
        autoLoad : true
    })

    checkBoxSelMod = new Ext.grid.CheckboxSelectionModel();
    featureListingEditorGrid = new Ext.grid.EditorGridPanel({
        id: "featureListingEditorGrid",
        store : featureDataStore,
        selModel : checkBoxSelMod,
        clicksToEdit: 2,
        renderTo: "feature_list",
        width: 860,
        height: 300,
        columns : [
            {
                dataIndex: 'id',
                header: 'ID',
                width: 80,
                sortable: true
            },{
                dataIndex: 'description',
                header: 'Description',
                sortable: true,
                width:200,
                editable: false
            },{
                dataIndex: 'operation',
                header: 'Operation',
                sortable: true,
                width: 275
            },{
                dataIndex: 'componentId',
                header: 'Component ID',
                sortable: true,
                width: 175
            }
        ],
        stripeRows : true,
        bbar: new Ext.PagingToolbar({
            store : featureDataStore,
            pageSize : 15,
            displayInfo : true,
            displaymsg : 'Displaying {0} - {1} of {2}',
            emptyMsg : "No records found"
        }),
        tbar: [{
            xtype: "button",
            text: "Add Feature",
            iconCls: "addRecord",
            handler:function(){
                window.location="createFeature.buet"
            }
        },{
            xtype: "button",
            text: "Group Assignment",
            iconCls: "assignment",
            handler:function(){
                window.location="createUser.buet"
            }
        }]
    });
    featureDataStore.load({params: {start: 0, limit: 15}});

})

