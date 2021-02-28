##############################################################################
#                                                                            #
#     ____  _ _        _____         _                                       #
#    |  _ \(_) |__  __|_   _|__  ___| |__                                    #
#    | | | | | '_ \/ __|| |/ _ \/ __| '_ \                                   #
#    | |_| | | |_) \__ \| |  __/ (__| | | |                                  #
#    |____/|_|_.__/|___/|_|\___|\___|_| |_|                                  #
#                                                                            #
#    DibsTech App Manager                                                    #
#                                                                            #
##############################################################################
# 
# This Powershell class automates installation tasks for an software
# that supports installation from a command prompt or Powershell. 
# If you use this tool for interactive installs this class will 
# simply launch the installation.
# 
# Powershell-Version: 5.1
# Script-Version: 0.0.1
# 
# File   : DibsAppManager.ps1  
# Author : Shaun Crawford <shaun@crawford.ws>
# Created: February 26, 2020
# Repo   : 
# 
# Dibs App Manager
#
# Copyright (c) 2021 Shaun Crawford & DibsTech LLC
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see the LICENSE.txt or 
# visit <https://www.gnu.org/licenses/gpl-3.0.html>.
# 
##############################################################################





class DibsAppManager {
    #
    # Properties
    #

    # Holds the title of the application to install
    [String] $title

    # Holds the version fo the application to install
    [String] $version

    # Holds the full file path and name  of the installer
    [String] $fullInstallFile

    # Holds the arguments being passed to the installer (e.g. --quiet --passive)
    [String] $installFileArguments

    # Holds the install location and executable of the application being installed (e.g. C:\Program Files\7-Zip\7z.exe)
    [String] $appProgramExecutable




    #
    # Constructor
    # 
    DibsAppManager ([String] $Title, [String] $Version, [String] $InstallFile, [String] $InstallArguments, [String] $AppProgramExecutable) {
        $this.title = $Title
        $this.version = $Version
        $this.fullInstallFile = $InstallFile
        $this.installFileArguments = $InstallArguments
        $this.appProgramExecutable = $AppProgramExecutable
    }



    #
    # Public Methods 
    #
    [int32] AddApp([bool] $beVerbose=$false) {
        if ($beVerbose) {
            Write-Verbose "`nSetup $($this.title)"
        
            Write-Verbose "  Preparing... " -NoNewline
        }

        if ([System.IO.File]::Exists($this.appProgramExecutable)) {
            #Remove-Item $appProgramExecutable  -Recurse -ErrorAction Ignore
            
            Write-Verbose "success" -ForegroundColor Green
            
            Write-Verbose "  $($this.title) is already installed!"
        }else {
            if ($beVerbose) {
                Write-Verbose "success" -ForegroundColor Green

               Write-Verbose "  Installing version $($this.version)... " -NoNewline
            }
               
            start-process -FilePath $this.fullInstallFile -ArgumentList $this.installFileArguments -wait

            if ($beVerbose) {
                Write-Verbose "success" -ForegroundColor Green
            }
        }

        return 1

    }



    # 
    # Install an application by copying the contents to the installation directory.
    # 
    [int32] AddByCopy([bool] $beVerbose=$false) {
        Write-Verbose "`nSetup $($this.title)"
                
        if ($beVerbose) {
            Write-Verbose "  Preparing... " -NoNewline
        }

        if ([System.IO.File]::Exists($this.appProgramExecutable)) {
            if ($beVerbose) {
                Write-Verbose "success" -ForegroundColor Green

                Write-Verbose "  $($this.title) is already installed!"
            }
        }else {
            if ($beVerbose) {
                Write-Verbose "success" -ForegroundColor Green

                Write-Verbose "  Installing version $($this.version)... " -NoNewline
            }

            Copy-Item -Path $this.fullInstallFile -Destination $this.appProgramExecutable

            if ($beVerbose) {
                Write-Verbose "success" -ForegroundColor Green
            }
        }


        return 1
    }



}






