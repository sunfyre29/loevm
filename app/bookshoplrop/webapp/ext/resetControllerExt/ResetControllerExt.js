sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        onResetFlag: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
