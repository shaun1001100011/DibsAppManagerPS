# DibsAppManager

Powershell class to handle installation of software silently.

## Getting Started

These instructions will get you a copy of the script up and running on your local machine.

### Prerequisites

The only thing you need to run the script is Powershell 5.1.

### Installing

To utilize the script just include it in your own script using dot sourcing.

Examples:
	. "$PSScriptRoot\DibsAppManager.ps1"
	$sevenZipInstaller = New-Object -TypeName DibsAppManager -ArgumentList "7-Zip", "19.0", "c:\media\7zip.exe", "/S", "c:\program files\7-Zip\7z.exe"
	$sevenZipInstallerResult = $sevenZipInstaller.AddApp($true)

## Built With

* Powershell 5.1

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* Shaun Crawford - *Initial work* - [DibsTech](https://dibs.tech)

See also the list of [contributors](https://github.com/your/project/contributors) who participated in this project.

## License

This project is licensed under the GNU v3 License - see the [LICENSE.md](LICENSE.md) file for details


