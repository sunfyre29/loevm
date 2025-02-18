sap.ui.define([
    "sap/m/MessageToast"
], function(MessageToast) {
    'use strict';

    return {
        resetDeleteFlag: function(oEvent) {
            MessageToast.show("Custom handler invoked.");
        }
    };
});
