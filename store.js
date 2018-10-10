var util = require('util');
var store = require('windows.services.store');
var context = store.StoreContext.getDefault();

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