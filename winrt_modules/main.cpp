#include <nan.h>
#include <winrt/Windows.Foundation.h>
#include <winrt/Windows.Web.Syndication.h>

// NAN_METHOD is a Nan macro enabling convenient way of creating native node functions.
// It takes a method's name as a param. By C++ convention, I used the Capital cased name.
NAN_METHOD(Hello) {
    // Create an instance of V8's String type
    auto message = Nan::New("Hello from C++/WinRT!").ToLocalChecked();
    // 'info' is a macro's "implicit" parameter - it's a bridge object between C++ and JavaScript runtimes
    // You would use info to both extract the parameters passed to a function as well as set the return value.
    info.GetReturnValue().Set(message);
}

// Module initialization logic
NAN_MODULE_INIT(Initialize) {
    winrt::init_apartment();

    // Export the `Hello` function (equivalent to `export function Hello (...)` in JS)
    NAN_EXPORT(target, Hello);
}

// Create the module called "winrt_modules" and initialize it with `Initialize` function (created with NAN_MODULE_INIT macro)
NODE_MODULE(winrt_modules, Initialize);