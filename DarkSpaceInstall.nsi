; Script generated by the HM NIS Edit Script Wizard.

; HM NIS Edit Wizard helper defines
!define PRODUCT_NAME "DarkSpace"
!define PRODUCT_VERSION "1.704"
!define PRODUCT_PUBLISHER "Palestar Inc"
!define PRODUCT_WEB_SITE "http://www.darkspace.net"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\DarkSpace.exe"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"

; MUI 1.67 compatible ------
!include "MUI.nsh"

; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON ".\DarkSpaceClient\res\DarkSpaceClient.ico"
!define MUI_UNICON ".\DarkSpaceClient\res\DarkSpaceClient.ico"

; Welcome page
!insertmacro MUI_PAGE_WELCOME
; License page
!insertmacro MUI_PAGE_LICENSE "..\GameCQ\GCQL\Eula.txt"
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
!define MUI_FINISHPAGE_RUN "$INSTDIR\GCQL.exe"
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "..\Web\darkspace\downloads\DarkSpaceBeta.exe"
InstallDir "C:\GameCQ\"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails show
ShowUnInstDetails show

Section "MainSection" SEC01
  CreateDirectory "$SMPROGRAMS\DarkSpace"
  CreateShortCut "$SMPROGRAMS\DarkSpace\DarkSpace.lnk" "$INSTDIR\GCQL.exe"
  CreateShortCut "$DESKTOP\DarkSpace.lnk" "$INSTDIR\GCQL.exe"
  SetOutPath "$INSTDIR"
  File ".\Bin\VC_redist.x86.exe"
  ExecWait "$INSTDIR\VC_redist.x86.exe /q:a"
  File ".\Bin\ijl15.dll"
  File ".\Bin\dbghelp.dll"
  File "..\GameCQ\Bin\BCGCB70080.dll"
  File "..\GameCQ\Bin\CacheConfig.xml"
  File "..\GameCQ\Bin\GCQ.dll"
  File "..\GameCQ\Bin\GCQL.exe"
  File "..\GameCQ\Bin\Medusa.dll"
  File "..\GameCQ\Bin\Network.dll"
  File "..\GameCQ\Bin\SelfUpdate.dll"
  File "..\GameCQ\Bin\SmartUpdate.exe"
  File "..\GameCQ\GCQL\Skins\Green.skn"
  File "..\GameCQ\GCQL\Skins\Default.skn"
  File "..\GameCQ\GCQL\Skins\Blue.skn"
  File "..\GameCQ\GCQL\Skins\Red.skn"
  File "..\GameCQ\GCQL\Skins\Steel.skn"
  SetOutPath "$INSTDIR\.Cache\DarkSpace"
  SetOverwrite try
  File ".\Bin\ijl15.dll"
  File ".\Bin\dbghelp.dll"
  File ".\Bin\AudioDS.dll"
  File ".\Bin\Constants.ini"
  File ".\Bin\Version.ini"
  File ".\Bin\DarkSpace.dll"
  File ".\Bin\DarkSpaceClient.exe"
  File ".\Bin\DarkSpaceSetup.exe"
  File ".\Bin\DisplayD3D.dll"
  File ".\Bin\Gadgets.dll"
  File ".\Bin\GCQ.dll"
  File ".\Bin\GUI3D.dll"
  File ".\Bin\Interface.dll"
  File ".\Bin\locale.txt"
  File ".\Bin\LocalServer.exe"
  File ".\Bin\Medusa.dll"
  File ".\Bin\Network.dll"
  File ".\Bin\Render3D.dll"
  File ".\Bin\SelfUpdate.dll"
  File ".\Bin\SystemWin.dll"
  File ".\Bin\World.dll"
  File ".\Tools\Bin\BugReport.exe"
  SetOutPath "$INSTDIR\.Cache\DarkSpace\Data"
  File ".\Data\*.wob"
  SetOutPath "$INSTDIR\.Cache\DarkSpace\Music"
  File ".\Music\*.*"
  SetOutPath "$INSTDIR\.Cache\DarkSpace\Shaders"
  File ".\Shaders\*.*"
SectionEnd

Section -AdditionalIcons
  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateShortCut "$SMPROGRAMS\DarkSpace\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\DarkSpace\Uninstall.lnk" "$INSTDIR\uninst.exe"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\GCQL.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninst.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\GCQL.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninst.exe"
  Delete "$INSTDIR\SystemWin.dll"
  Delete "$INSTDIR\Steel.skn"
  Delete "$INSTDIR\SmartUpdate.exe"
  Delete "$INSTDIR\SelfUpdate.dll"
  Delete "$INSTDIR\Render3D.dll"
  Delete "$INSTDIR\Red.skn"
  Delete "$INSTDIR\Network.dll"
  Delete "$INSTDIR\mfc80.dll"
  Delete "$INSTDIR\msvcp80.dll"
  Delete "$INSTDIR\msvcr80.dll"
  Delete "$INSTDIR\Microsoft.VC80.CRT.manifest"
  Delete "$INSTDIR\Microsoft.VC80.MFC.manifest"
  Delete "$INSTDIR\Medusa.dll"
  Delete "$INSTDIR\ijl15.dll"
  Delete "$INSTDIR\Green.skn"
  Delete "$INSTDIR\GCQL.exe"
  Delete "$INSTDIR\GCQ.dll"
  Delete "$INSTDIR\Default.skn"
  Delete "$INSTDIR\dbghelp.dll"
  Delete "$INSTDIR\CacheConfig.xml"
  Delete "$INSTDIR\Blue.skn"
  Delete "$INSTDIR\BCGCB70080.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\World.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\SystemWin.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\SelfUpdate.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Render3D.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Network.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Music\config.ini"
  Delete "$INSTDIR\.Cache\DarkSpace\Music\Combat2.mp3"
  Delete "$INSTDIR\.Cache\DarkSpace\Music\Combat1.mp3"
  Delete "$INSTDIR\.Cache\DarkSpace\Music\Ambient2.mp3"
  Delete "$INSTDIR\.Cache\DarkSpace\Music\Ambient1.mp3"
  Delete "$INSTDIR\.Cache\DarkSpace\mfc80.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\msvcp80.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\msvcr80.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Microsoft.VC80.CRT.manifest"
  Delete "$INSTDIR\.Cache\DarkSpace\Microsoft.VC80.MFC.manifest"
  Delete "$INSTDIR\.Cache\DarkSpace\Medusa.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\LocalServer.exe"
  Delete "$INSTDIR\.Cache\DarkSpace\locale.txt"
  Delete "$INSTDIR\.Cache\DarkSpace\Interface.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\ijl15.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\GUI3D.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\GCQ.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Gadgets.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\DS.bmp"
  Delete "$INSTDIR\.Cache\DarkSpace\DisplayD3D.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\dbghelp.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Data\*.wob"
  Delete "$INSTDIR\.Cache\DarkSpace\DarkSpaceSetup.exe"
  Delete "$INSTDIR\.Cache\DarkSpace\DarkSpaceClient.exe"
  Delete "$INSTDIR\.Cache\DarkSpace\DarkSpace.dll"
  Delete "$INSTDIR\.Cache\DarkSpace\Constants.ini"
  Delete "$INSTDIR\.Cache\DarkSpace\BugReport.exe"
  Delete "$INSTDIR\.Cache\DarkSpace\AudioDS.dll"

  Delete "$SMPROGRAMS\DarkSpace\Uninstall.lnk"
  Delete "$SMPROGRAMS\DarkSpace\Website.lnk"
  Delete "$DESKTOP\DarkSpace.lnk"
  Delete "$SMPROGRAMS\DarkSpace\DarkSpace.lnk"

  RMDir "$SMPROGRAMS\DarkSpace"
  RMDir "$INSTDIR\.Cache\DarkSpace\Music"
  RMDir "$INSTDIR\.Cache\DarkSpace\Data"
  RMDir "$INSTDIR\.Cache\DarkSpace"
  RMDir "$INSTDIR"

  DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
SectionEnd