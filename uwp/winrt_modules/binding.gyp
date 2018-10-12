{
  "targets": [
    {
      "include_dirs": [
        "<!(node -e \"require('nan')\")"
      ],
      "target_name": "winrt_modules",
      "libraries": ["-lruntimeobject.lib"],
      "sources": [ "main.cpp" ],
        "msvs_settings": {
          "VCCLCompilerTool": {
            "AdditionalOptions": ["/std:c++17 /EHsc"],
            "DisableSpecificWarnings": [4609]
          }
        }
  }]
}