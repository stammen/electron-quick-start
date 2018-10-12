var util = require('util');
const winrt_modules = require('./uwp/winrt_modules/build/Release/winrt_modules');

//var store = require('windows.services.store');
//var context = store.StoreContext.getDefault();

const { remote, BrowserWindow } = require('electron')
currentWindow = remote.getCurrentWindow()
console.info("HWND: " + currentWindow.getNativeWindowHandle())
console.log(winrt_modules.Hello());

/*
store.StoreRequestHelper.sendRequestAsync(context, 25, "{}",  function(err, res) {
  if (err) {
    console.error(err);
    return;
  }

  if(res)
  {
    console.info("Store extendedError:" + res.extendedError);
    console.info("Store Response:" + res.response);
  }
});
*/