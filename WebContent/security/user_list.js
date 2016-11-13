/**
 * Created by IntelliJ IDEA.
 * User: ronnie
 * Date: 7/4/12
 * Time: 1:13 AM
 * To change this template use File | Settings | File Templates.
 */

var userDataStore;
var checkBoxSelMod;
var userListingEditorGrid;
var editUserFeature = "editUser";
var deleteUserFeature = "deleteUser";
var confirmationMessage;

var checkBoxSelModForGroupAssignment;
var groupListingEditorGridForAssignment;
var userGroupStore;


Ext.onReady(function () {

    userDataStore = new Ext.data.Store({
        id: "authorityDataStore",
        url: 'userJsonData.buet',
        reader: new Ext.data.JsonReader({
            root: 'userList',
            totalProperty: 'totalCount',
            id: 'id'
        }, [
            {name: 'id',        type: 'int',    mapping: 'id'},
            {name: 'username',  type: 'string', mapping: 'username'},
            {name: 'userType',  type: 'string', mapping: 'userType'},
            {name: 'isActive',  type: 'string', mapping: 'active'},
            {name: 'name',      type: 'string', mapping: 'name'}
        ]),
        autoLoad: true
    })

    checkBoxSelMod = new Ext.grid.CheckboxSelectionModel();
    userListingEditorGrid = new Ext.grid.EditorGridPanel({
        id: "userListingEditorGrid",
        store: userDataStore,
        selModel: checkBoxSelMod,
        clicksToEdit: 2,
        renderTo: "list_employee",
        width: 960,
        height: 600,
        columns: [
            {
                dataIndex: 'id',
                header: 'ID',
                width: 50,
                sortable: true
            },{
                dataIndex: 'username',
                header: 'Username',
                sortable: true,
                width: 100,
                editable: false
            },{
                dataIndex: 'userType',
                header: 'User Type',
                sortable: true,
                width: 150
            },{
                dataIndex: 'isActive',
                header: 'Is Active',
                sortable: true,
                width: 100,
                editable: false
            },{
                dataIndex: 'name',
                header: 'Name of owner',
                sortable: true,
                width: 400,
                editable: false
            },{
                header: 'Action',
                dataIndex: 'action',
                width: 150,
                renderer: function (v, p, record) {
                    renderText = "";
                    if (editUserFeature = "editUser") {
                        renderText = renderText + " <a href='editUser.buet?id=" + record.get('id') + "'><img title='Edit' src='../resources/images/edit.png'/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }

                    if (deleteUserFeature = "deleteUser") {
                        renderText = renderText + " <a href='deleteUser.buet?id=" + record.get('id') + "'><img title='Delete' src='../resources/images/delete.png'/></a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    }
                    return renderText;
                }

            }
        ],
        stripeRows: true,
        bbar: new Ext.PagingToolbar({
            store: userDataStore,
            pageSize: 50,
            displayInfo: true,
            displaymsg: 'Displaying {0} - {1} of {2}',
            emptyMsg: "No records found"
        }),
        tbar: [
            {
                xtype: "button",
                text: "Add User",
                iconCls: "addRecord",
                handler: function () {
                    window.location = "createUser.buet"
                }
            },
            {
                xtype: "button",
                text: "Group Assignment",
                iconCls: "assignment",
                handler: function () {
                    window.location = "createUser.buet"
                }
            }
        ]
    });
    userDataStore.load({params: {start: 0, limit: 50}});

})

