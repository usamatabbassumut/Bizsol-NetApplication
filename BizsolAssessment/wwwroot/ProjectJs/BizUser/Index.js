$(document).ready(() => {
    BizUser.Init();
});
var BizUser = {
    Init: function () {
        BizUser.SetEvents();
        BizUser.LoadDataTable();
    },
    SetEvents: function () {
        $('#btnAdd').on('click', () => {
            BizUser.ClearForm();
        });

        $('#btnSave').on('click', () => {
            let isValidate = BizUser.ValidateForm();
            if (isValidate==true)
            BizUser.SubmitForm();
        });

        $('#customFile').on('change', () => {
            let fileName = '';
            let file = $('#customFile').get(0).files;
            fileName = file.length > 0 ? file[0].name : '';
            $('#txtCustomFile').val(fileName);
        });
    },
    ClearForm: function () {
        $('#hdnUserId,#txtUserName,#txtEmail,#txtPhone,#txtAddress').val('');
        $('#btnSave').text('Save');
        $('#customFile').val('');
        $('#txtCustomFile').val('');
        $('#img').attr('src', '/CustomUploads/user/noimage.png');

    },
    UserData:[],
    LoadDataTable: function () {

         BizUser.dataGrid=$('#myTable').DataTable({
            "autoWidth": false,
            "bLengthChange": false,
            "processing": false,
            "serverSide": false,
             "responsive": true,
             "pageLength": 5,
            "ajax": {
                "url": "/Home/GetAllUsers",
                "type": "POST",
                "datatype": "json",
            },

            "columns": [
                {
                    "data": "fileName", "class": "Acenter", "orderable": false, "render": function (data, d, r) {
                        var div = '';
                        div = '<img src="/CustomUploads/user/'+data+'" alt="" width="30" height="30">';
                        return div;
                    }
                },
                { "data": "bizUserId", "name": "bizUserId", "autoWidth": true },
                { "data": "userName", "name": "UserName", "autoWidth": true },
                { "data": "email", "name": "Email", "autoWidth": true },
                { "data": "phone", "name": "Phone", "autoWidth": true },
                { "data": "address", "name": "Address", "autoWidth": true },
                {
                    "data": "bizUserId", "width": "130px", "class": "Acenter", "orderable": false, "render": function (data, d, r) {
                        BizUser.UserData.push(r);
                        var div = '';
                        let extraAttribute = ' row-id=' + data + ' ';
                        div = '<button class="btn btn-primary btn-sm" ' + extraAttribute + ' onclick="BizUser.UpdateRow(this,event);">Edit</button>  <button class="btn btn-danger btn-sm" '+extraAttribute+' onclick="BizUser.DeleteRow(this,event);">Delete</button> ';
                        return div;
                    }
                },
            ]
        });
    },
    UpdateRow: function (CallingObj, evt) {
        evt.preventDefault();
        evt.stopImmediatePropagation();

        let selectedRowId = $(CallingObj).attr('row-id');

        BizUser.UserData = $.unique(BizUser.UserData);
        var data = $(BizUser.UserData).filter(function (idx) {
            return BizUser.UserData[idx].bizUserId == selectedRowId;
        });

        let currentRow = data[0];
        if (currentRow !== undefined) {
            $('#hdnUserId').val(currentRow.bizUserId);
            $('#txtUserName').val(currentRow.userName);
            $('#txtEmail').val(currentRow.email);
            $('#txtPhone').val(currentRow.phone);
            $('#txtAddress').val(currentRow.address);
            $('#txtCustomFile').val(currentRow.fileName);
            $('#btnSave').text('Update');

            $('#img').attr('src', '/CustomUploads/user/' + currentRow.fileName);
        }
        
    },
    DeleteRow: function (CallingObj, evt) {
        evt.preventDefault();
        evt.stopImmediatePropagation();

        let selectedRowId = $(CallingObj).attr('row-id');
        $.ajax({
            url: '/Home/DeleteUser/' + selectedRowId,
            type: 'DELETE',
            success: function (response) {
                toastr.success('User deleted successfully!');

                BizUser.ClearForm();
                BizUser.dataGrid.ajax.reload(null, false);
            },
            error: function (xhr, status, error) {
                toastr.error('Error while deleting');

            }
        });

    },
    ValidateForm: function () {
        let isValidate = true;
        let userName = $('#txtUserName').val();
        let email = $('#txtEmail').val();

        if (userName == null || userName == '') {
            toastr.error('Please enter Username.');
            isValidate= false;
        }

        else if (email == null || email == '') {
            toastr.error('Please enter Email.');
            isValidate= false;
        }

        return isValidate;
    },
    SubmitForm: function () {
        let userId = $('#hdnUserId').val();  
        let userName = $('#txtUserName').val();  
        let email = $('#txtEmail').val();  
        let phone = $('#txtPhone').val();  
        let address = $('#txtAddress').val();  
        let fileName = $('#txtCustomFile').val();

        var model = {
            BizUserId: userId,
            UserName: userName,
            Email: email,
            Phone: phone,
            Address: address,
            FileName: fileName,
        };

        $.ajax({
            url: '/Home/InsertUpdateUser',
            type: 'POST',
            data: model,
            success: function (response) {
                var file = $('#customFile').get(0).files;
                if (file.length>0)
                BizUser.UploadFile();
                toastr.success('Data saved successfully!');

                BizUser.ClearForm();
                BizUser.dataGrid.ajax.reload(null, false);
            },
            error: function (xhr, status, error) {
                toastr.error('Error while saving');
            }
        });

    },
    UploadFile: function () {
        var file = $('#customFile').get(0).files;
        var documentFile = file[0];
        var extension = $('#customFile').val().split('.').pop().toLowerCase();

        var fileData = new FormData();
        fileData.append(file.name, documentFile);
        fileData.append("DocumentName", $("#customFile").text());

        $.ajax({
            url: '/Home/UploadDocument/',
            type: 'post',
            datatype: 'json',
            contentType: false,
            processData: false,
            //async: false,
            data: fileData,
            success: function (result) {
                toastr.success('File uploaded successfully!');
            },
            error: function (err) {
                toastr.error('Something went wrong. Please contact administrator');
            }
        });

    },
}