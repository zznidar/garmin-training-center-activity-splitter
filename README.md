# garmin-training-center-activity-splitter
Split exported .tcx files from Garmin Training Center by activity so you can import your already-10-years-unsupported data to Garmin Connect

## Usage
1. Create a subfolder named `export` where your input file is located
2. Open one of your input files, delete everything between (including) `<Activities>...</Activities>` and save it as `template.tcx`

* Run from cmd with `powershell C:\Users\Example\Path\To\The\File\garmin_corrector.ps1 "C:\Users\Example\Path\To\The\File\inputfile.tcx"` or
* Run from PowerShell directly with `C:\Users\Example\Path\To\The\File\garmin_corrector.ps1 "C:\Users\Example\Path\To\The\File\inputfile.tcx"`

It may take some time (up to a few minutes for large files) for the script to load your input file. After that, it will start exporting your activities to the `export` subfolder. 

Exported files (split by activity) can be uploaded/imported to Garmin Connect website. 


## Tips and tricks
If you have many input files, you can drag&drop them into [Filenames tool](https://zznidar.github.io/tools/Filenames/), copy output from there, paste it to Excel to create commands to be run (with the help of autofill), then jsut copy the created commands and paste them to cmd/ps, press Enter and it will go [brrr](https://brrr.money/). 
