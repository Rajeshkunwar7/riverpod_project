// const baseUrl = "https://beatsapi.altruistindia.com/";
const baseUrl = "https://beatsstagingapi.altruistindia.com/";

/// login
const loginUserUrl = "${baseUrl}auth/login";
const logoutUrl = "${baseUrl}auth/logout";

const changeDeviceIdUrl = "${baseUrl}auth/device/change/request";

const fcmTokenSendUrl = "${baseUrl}auth/fcm/save";

///// forgot / reset password
const forgotPasswordUrl = "${baseUrl}auth/forget/password";
const resetPasswordUrl = "${baseUrl}auth/reset/password";

/*  AFTER LOGIN APIS  */

/////// DASH BOARD APIS

const getProfileDetailsUrl = "${baseUrl}auth/profile";
const myActionsListUrl = "${baseUrl}expense/latest/actions";
const projectDetailsUrl = "${baseUrl}project/detail/";

//////////////  home screen apis
const getExpenseListUrl = "${baseUrl}expense/get/v2/assigned";
const getExpenseHistoryUrl = "${baseUrl}expense/history/user";

/// search screen api
const getSearchUrl = "${baseUrl}expense/search";

/// DETAIL SCREEN APIS
const detailExpenseIdUrl = "${baseUrl}expense/details";
const approveApiUrl = "${baseUrl}expense/approve";
const rejectApiUrl = "${baseUrl}expense/reject";

///// NOTIFICATION APIS
const getNotificationUrl = "${baseUrl}notifications/get";
const clearNotificationUrl = "${baseUrl}notifications/clear";

//// filter screen apis
const getAllRaisedByUserUrl = "${baseUrl}auth/users/get";
const getAllProjectListUrl = "${baseUrl}project/get";

////// user module
const getProjectHierarchyListUrl = "${baseUrl}project/hierarchy/";
const uploadUserAttachFileUrl = "${baseUrl}expense/upload/file";
const saveAllExpenseUrl = "${baseUrl}expense/add";
const userExpenseRaisedHistoryUrl = "${baseUrl}expense/get/raised";
