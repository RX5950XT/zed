; *** Inno Setup version 6.4.0+ Chinese Traditional messages ***
;
; To download user-contributed translations of this file, go to:
;   https://jrsoftware.org/files/istrans/
;
; Note: When translating this text, do not add periods (.) to the end of
; messages that didn't have them already, because on those messages Inno
; Setup adds the periods automatically (appending a period would result in
; two periods being displayed).
;

[LangOptions]
LanguageName=繁體中文
LanguageID=$0404
LanguageCodePage=950

[Messages]

; *** 應用程式標題
SetupAppTitle=安裝
SetupWindowTitle=安裝 - %1
UninstallAppTitle=解除安裝
UninstallAppFullTitle=%1 解除安裝

; *** Misc. common
InformationTitle=資訊
ConfirmTitle=確認
ErrorTitle=錯誤

; *** SetupLdr messages
SetupLdrStartupMessage=即將安裝 %1。您想要繼續嗎？
LdrCannotCreateTemp=無法建立暫存檔案。安裝程式已中止
LdrCannotExecTemp=無法執行暫存目錄中的檔案。安裝程式已中止
HelpTextNote=

; *** 啟動錯誤訊息
LastErrorMessage=%1。%n%n錯誤 %2: %3
SetupFileMissing=安裝目錄中缺少檔案 %1。請修正此問題或取得程式的新副本。
SetupFileCorrupt=安裝檔案已損毀。請取得程式的新副本。
SetupFileCorruptOrWrongVer=安裝檔案已損毀，或與此安裝程式的版本不相容。請修正此問題或取得程式的新副本。
InvalidParameter=無效的命令列參數：%n%n%1
SetupAlreadyRunning=安裝程式正在執行中。
WindowsVersionNotSupported=此程式不支援目前電腦執行的 Windows 版本。
WindowsServicePackRequired=此程式需要 %1 Service Pack %2 或更新版本。
NotOnThisPlatform=此程式無法在 %1 上執行。
OnlyOnThisPlatform=此程式只能在 %1 上執行。
OnlyOnTheseArchitectures=此程式只能安裝至下列處理器架構的 Windows 版本中：%n%n%1
WinVersionTooLowError=此程式需要 %1 版本 %2 或更新版本。
WinVersionTooHighError=此程式無法安裝於 %1 版本 %2 或更新版本。
AdminPrivilegesRequired=安裝此程式時您必須以系統管理員身分登入。
PowerUserPrivilegesRequired=安裝此程式時您必須以系統管理員或具有權限的使用者群組身分登入。
SetupAppRunningError=安裝程式發現 %1 目前正在執行。%n%n請先關閉正在執行的程式，然後按一下「確定」繼續，或按一下「取消」結束。
UninstallAppRunningError=解除安裝程式發現 %1 目前正在執行。%n%n請先關閉正在執行的程式，然後按一下「確定」繼續，或按一下「取消」結束。

; *** 啟動問題
PrivilegesRequiredOverrideTitle=選擇安裝程式模式
PrivilegesRequiredOverrideInstruction=選擇安裝模式
PrivilegesRequiredOverrideText1=%1 可以為所有使用者安裝（需要系統管理員權限），或僅為您安裝。
PrivilegesRequiredOverrideText2=%1 只能為您安裝，或為所有使用者安裝（需要系統管理員權限）。
PrivilegesRequiredOverrideAllUsers=為所有使用者安裝(&A)
PrivilegesRequiredOverrideAllUsersRecommended=為所有使用者安裝(&A)（建議選項）
PrivilegesRequiredOverrideCurrentUser=只為我安裝(&M)
PrivilegesRequiredOverrideCurrentUserRecommended=只為我安裝(&M)（建議選項）

; *** 其他錯誤
ErrorCreatingDir=安裝程式無法建立目錄「%1」
ErrorTooManyFilesInDir=無法在目錄「%1」中建立檔案，因為其中包含太多檔案

; *** 安裝程式公共訊息
ExitSetupTitle=結束安裝程式
ExitSetupMessage=安裝程式尚未完成。如果現在結束，將不會安裝該程式。%n%n您之後可以再次執行安裝程式完成安裝。%n%n現在結束安裝程式嗎？
AboutSetupMenuItem=關於安裝程式(&A)...
AboutSetupTitle=關於安裝程式
AboutSetupMessage=%1 版本 %2%n%3%n%n%1 首頁：%n%4
AboutSetupNote=
TranslatorNote=

; *** 按鈕
ButtonBack=< 上一步(&B)
ButtonNext=下一步(&N) >
ButtonInstall=安裝(&I)
ButtonOK=確定
ButtonCancel=取消
ButtonYes=是(&Y)
ButtonYesToAll=全部是(&A)
ButtonNo=否(&N)
ButtonNoToAll=全部否(&O)
ButtonFinish=完成(&F)
ButtonBrowse=瀏覽(&B)...
ButtonWizardBrowse=瀏覽(&R)...
ButtonNewFolder=新增資料夾(&M)

; *** 「選擇語言」對話框訊息
SelectLanguageTitle=選擇安裝語言
SelectLanguageLabel=選擇安裝時使用的語言。

; *** 公共精靈文字
ClickNext=按一下「下一步」繼續，或按一下「取消」結束安裝程式。
BeveledLabel=
BrowseDialogTitle=瀏覽資料夾
BrowseDialogLabel=在下方清單中選擇一個資料夾，然後按一下「確定」。
NewFolderName=新增資料夾

; *** 「歡迎」精靈頁面
WelcomeLabel1=歡迎使用 [name] 安裝精靈
WelcomeLabel2=即將安裝 [name/ver] 到您的電腦中。%n%n建議您在繼續安裝前關閉所有其他應用程式。

; *** 「密碼」精靈頁面
WizardPassword=密碼
PasswordLabel1=此安裝程式有密碼保護。
PasswordLabel3=請輸入密碼，然後按一下「下一步」繼續。密碼有區分大小寫。
PasswordEditLabel=密碼(&P)：
IncorrectPassword=您輸入的密碼不正確，請重新輸入。

; *** 「授權合約」精靈頁面
WizardLicense=授權合約
LicenseLabel=請在繼續安裝前閱讀下列重要資訊。
LicenseLabel3=請仔細閱讀下列授權合約。在繼續安裝前您必須同意這些合約條款。
LicenseAccepted=我同意此合約(&A)
LicenseNotAccepted=我不同意此合約(&D)

; *** 「資訊」精靈頁面
WizardInfoBefore=資訊
InfoBeforeLabel=請在繼續安裝前閱讀下列重要資訊。
InfoBeforeClickLabel=準備好繼續安裝後，按一下「下一步」。
WizardInfoAfter=資訊
InfoAfterLabel=請在繼續安裝前閱讀下列重要資訊。
InfoAfterClickLabel=準備好繼續安裝後，按一下「下一步」。

; *** 「使用者資訊」精靈頁面
WizardUserInfo=使用者資訊
UserInfoDesc=請輸入您的資訊。
UserInfoName=使用者名稱(&U)：
UserInfoOrg=組織(&O)：
UserInfoSerial=序號(&S)：
UserInfoNameRequired=您必須輸入使用者名稱。

; *** 「選擇目標目錄」精靈頁面
WizardSelectDir=選擇目標位置
SelectDirDesc=您想將 [name] 安裝在哪裡？
SelectDirLabel3=安裝程式將安裝 [name] 到下列資料夾中。
SelectDirBrowseLabel=按一下「下一步」繼續。如果您想選擇其他資料夾，請按一下「瀏覽」。
DiskSpaceGBLabel=至少需要 [gb] GB 的可用磁碟空間。
DiskSpaceMBLabel=至少需要 [mb] MB 的可用磁碟空間。
CannotInstallToNetworkDrive=安裝程式無法安裝到網路磁碟機。
CannotInstallToUNCPath=安裝程式無法安裝到 UNC 路徑。
InvalidPath=您必須輸入含磁碟機代號的完整路徑，例如：%n%nC:\APP%n%n或 UNC 路徑：%n%n\\server\share
InvalidDrive=您選定的磁碟機或 UNC 共用不存在或無法存取。請選擇其他位置。
DiskSpaceWarningTitle=磁碟空間不足
DiskSpaceWarning=安裝程式至少需要 %1 KB 的可用空間才能安裝，但選定的磁碟機只有 %2 KB 的可用空間。%n%n您確定要繼續嗎？
DirNameTooLong=資料夾名稱或路徑太長。
InvalidDirName=資料夾名稱無效。
BadDirName32=資料夾名稱不能包含下列任何字元：%n%n%1
DirExistsTitle=資料夾已存在
DirExists=資料夾：%n%n%1%n%n已經存在。您確定要安裝到此資料夾中嗎？
DirDoesntExistTitle=資料夾不存在
DirDoesntExist=資料夾：%n%n%1%n%n不存在。您想要建立此資料夾嗎？

; *** 「選擇元件」精靈頁面
WizardSelectComponents=選擇元件
SelectComponentsDesc=您想安裝哪些程式元件？
SelectComponentsLabel2=選取您想安裝的元件；取消選取您不想安裝的元件。然後按一下「下一步」繼續。
FullInstallation=完整安裝
CompactInstallation=精簡安裝
CustomInstallation=自訂安裝
NoUninstallWarningTitle=元件已存在
NoUninstallWarning=安裝程式偵測到下列元件已安裝在您的電腦中：%n%n%1%n%n取消選取這些元件不會解除安裝它們。%n%n確定要繼續嗎？
ComponentSize1=%1 KB
ComponentSize2=%1 MB
ComponentsDiskSpaceGBLabel=目前選擇的元件至少需要 [gb] GB 的磁碟空間。
ComponentsDiskSpaceMBLabel=目前選擇的元件至少需要 [mb] MB 的磁碟空間。

; *** 「選擇附加工作」精靈頁面
WizardSelectTasks=選擇附加工作
SelectTasksDesc=您想要安裝程式執行哪些附加工作？
SelectTasksLabel2=選擇您想要安裝程式在安裝 [name] 時執行的附加工作，然後按一下「下一步」。

; *** 「選擇開始功能表資料夾」精靈頁面
WizardSelectProgramGroup=選擇開始功能表資料夾
SelectStartMenuFolderDesc=安裝程式應該在哪裡放置程式的捷徑？
SelectStartMenuFolderLabel3=安裝程式將在下列「開始」功能表資料夾中建立程式的捷徑。
SelectStartMenuFolderBrowseLabel=按一下「下一步」繼續。如果您想選擇其他資料夾，請按一下「瀏覽」。
MustEnterGroupName=您必須輸入資料夾名稱。
GroupNameTooLong=資料夾名稱或路徑太長。
InvalidGroupName=無效的資料夾名稱。
BadGroupName=資料夾名稱不能包含下列任何字元：%n%n%1
NoProgramGroupCheck2=不建立開始功能表資料夾(&D)

; *** 「準備安裝」精靈頁面
WizardReady=準備安裝
ReadyLabel1=安裝程式準備就緒，現在可以開始安裝 [name] 到您的電腦。
ReadyLabel2a=按一下「安裝」繼續此安裝程式。如果您想重新考慮或修改任何設定，請按一下「上一步」。
ReadyLabel2b=按一下「安裝」繼續此安裝程式。
ReadyMemoUserInfo=使用者資訊：
ReadyMemoDir=目標位置：
ReadyMemoType=安裝類型：
ReadyMemoComponents=已選擇的元件：
ReadyMemoGroup=開始功能表資料夾：
ReadyMemoTasks=附加工作：

; *** TExtractionWizardPage wizard page and Extract7ZipArchive
ExtractionLabel=正在解壓縮附加檔案...
ButtonStopExtraction=停止解壓縮(&S)
StopExtraction=您確定要停止解壓縮嗎？
ErrorExtractionAborted=解壓縮已中止
ErrorExtractionFailed=解壓縮失敗：%1

; *** TDownloadWizardPage wizard page and DownloadTemporaryFile
DownloadingLabel=正在下載附加檔案...
ButtonStopDownload=停止下載(&S)
StopDownload=您確定要停止下載嗎？
ErrorDownloadAborted=下載已中止
ErrorDownloadFailed=下載失敗：%1 %2
ErrorDownloadSizeFailed=取得下載大小失敗：%1 %2
ErrorProgress=無效的進度：%1 / %2
ErrorFileSize=檔案大小錯誤：預期 %1，實際 %2

; *** 「正在準備安裝」精靈頁面
WizardPreparing=正在準備安裝
PreparingDesc=安裝程式正在準備安裝 [name] 到您的電腦。
PreviousInstallNotCompleted=先前的程式安裝或解除安裝未完成，您需要重新啟動電腦才能完成。%n%n重新啟動電腦後，再次執行安裝程式以完成 [name] 的安裝。
CannotContinue=安裝程式無法繼續。請按一下「取消」結束。
ApplicationsFound=以下應用程式正在使用將由安裝程式更新的檔案。建議您允許安裝程式自動關閉這些應用程式。
ApplicationsFound2=以下應用程式正在使用將由安裝程式更新的檔案。建議您允許安裝程式自動關閉這些應用程式。安裝完成後，安裝程式將嘗試重新啟動這些應用程式。
CloseApplications=自動關閉應用程式(&A)
DontCloseApplications=不要關閉應用程式(&D)
ErrorCloseApplications=安裝程式無法自動關閉所有應用程式。建議您在繼續之前，關閉所有正在使用需要由安裝程式更新之檔案的應用程式。
PrepareToInstallNeedsRestart=安裝程式必須重新啟動您的電腦。電腦重新啟動後，請再次執行安裝程式以完成 [name] 的安裝。%n%n是否立即重新啟動？

; *** 「正在安裝」精靈頁面
WizardInstalling=正在安裝
InstallingLabel=安裝程式正在安裝 [name] 到您的電腦，請稍候。

; *** 「安裝完成」精靈頁面
FinishedHeadingLabel=[name] 安裝完成
FinishedLabelNoIcons=安裝程式已在您的電腦中安裝了 [name]。
FinishedLabel=安裝程式已在您的電腦中安裝了 [name]。您可以透過已安裝的捷徑執行此應用程式。
ClickFinish=按一下「完成」結束安裝程式。
FinishedRestartLabel=為完成 [name] 的安裝，安裝程式必須重新啟動您的電腦。要立即重新啟動嗎？
FinishedRestartMessage=為完成 [name] 的安裝，安裝程式必須重新啟動您的電腦。%n%n要立即重新啟動嗎？
ShowReadmeCheck=是，我想查閱讀我檔案
YesRadio=是，立即重新啟動電腦(&Y)
NoRadio=否，稍後再重新啟動電腦(&N)
; used for example as 'Run MyProg.exe'
RunEntryExec=執行 %1
; used for example as 'View Readme.txt'
RunEntryShellExec=查閱 %1

; *** 「安裝程式需要下一張磁片」提示
ChangeDiskTitle=安裝程式需要下一張磁片
SelectDiskLabel2=請插入磁片 %1 並按一下「確定」。%n%n如果此磁片中的檔案可以在下列資料夾以外的資料夾中找到，請輸入正確的路徑或按一下「瀏覽」。
PathLabel=路徑(&P)：
FileNotInDir2=在「%2」中找不到檔案「%1」。請插入正確的磁片或選擇其他資料夾。
SelectDirectoryLabel=請指定下一張磁片的位置。

; *** 安裝狀態訊息
SetupAborted=安裝程式未完成安裝。%n%n請修正此問題並重新執行安裝程式。
AbortRetryIgnoreSelectAction=選擇操作
AbortRetryIgnoreRetry=重試(&T)
AbortRetryIgnoreIgnore=忽略錯誤並繼續(&I)
AbortRetryIgnoreCancel=關閉安裝程式

; *** 安裝狀態訊息
StatusClosingApplications=正在關閉應用程式...
StatusCreateDirs=正在建立目錄...
StatusExtractFiles=正在解壓縮檔案...
StatusCreateIcons=正在建立捷徑...
StatusCreateIniEntries=正在建立 INI 項目...
StatusCreateRegistryEntries=正在建立登錄檔項目...
StatusRegisterFiles=正在登錄檔案...
StatusSavingUninstall=正在儲存解除安裝資訊...
StatusRunProgram=正在完成安裝...
StatusRestartingApplications=正在重新啟動應用程式...
StatusRollback=正在復原變更...

; *** 其他錯誤
ErrorInternal2=內部錯誤：%1
ErrorFunctionFailedNoCode=%1 失敗
ErrorFunctionFailed=%1 失敗；錯誤代碼 %2
ErrorFunctionFailedWithMessage=%1 失敗；錯誤代碼 %2.%n%3
ErrorExecutingProgram=無法執行檔案：%n%1

; *** 登錄檔錯誤
ErrorRegOpenKey=開啟登錄機碼時出錯：%n%1\%2
ErrorRegCreateKey=建立登錄機碼時出錯：%n%1\%2
ErrorRegWriteKey=寫入登錄機碼時出錯：%n%1\%2

; *** INI 錯誤
ErrorIniEntry=在檔案「%1」中建立 INI 項目時出錯。

; *** 檔案複製錯誤
FileAbortRetryIgnoreSkipNotRecommended=略過此檔案(&S)（不建議）
FileAbortRetryIgnoreIgnoreNotRecommended=忽略錯誤並繼續(&I)（不建議）
SourceIsCorrupted=來源檔案已損毀
SourceDoesntExist=來源檔案「%1」不存在
ExistingFileReadOnly2=無法取代現有檔案，它是唯讀的。
ExistingFileReadOnlyRetry=移除唯讀屬性並重試(&R)
ExistingFileReadOnlyKeepExisting=保留現有檔案(&K)
ErrorReadingExistingDest=嘗試讀取現有檔案時出錯：
FileExistsSelectAction=選擇操作
FileExists2=檔案已經存在。
FileExistsOverwriteExisting=覆寫現有的檔案(&O)
FileExistsKeepExisting=保留現有的檔案(&K)
FileExistsOverwriteOrKeepAll=對所有衝突的檔案執行此操作(&D)
ExistingFileNewerSelectAction=選擇操作
ExistingFileNewer2=現有的檔案比安裝程式將要安裝的檔案還要新。
ExistingFileNewerOverwriteExisting=覆寫現有的檔案(&O)
ExistingFileNewerKeepExisting=保留現有的檔案(&K)（建議）
ExistingFileNewerOverwriteOrKeepAll=對所有衝突的檔案執行此操作(&D)
ErrorChangingAttr=嘗試變更下列現有檔案的屬性時出錯：
ErrorCreatingTemp=嘗試在目標目錄中建立檔案時出錯：
ErrorReadingSource=嘗試讀取下列來源檔案時出錯：
ErrorCopying=嘗試複製下列檔案時出錯：
ErrorReplacingExistingFile=嘗試取代現有檔案時出錯：
ErrorRestartReplace=重新啟動並取代失敗：
ErrorRenamingTemp=嘗試重新命名下列目標目錄中的檔案時出錯：
ErrorRegisterServer=無法登錄 DLL/OCX：%1
ErrorRegSvr32Failed=RegSvr32 失敗；結束代碼 %1
ErrorRegisterTypeLib=無法登錄型別程式庫：%1

; *** 解除安裝顯示名稱標記
; used for example as 'My Program (32-bit)'
UninstallDisplayNameMark=%1 (%2)
; used for example as 'My Program (32-bit, All users)'
UninstallDisplayNameMarks=%1 (%2, %3)
UninstallDisplayNameMark32Bit=32 位元
UninstallDisplayNameMark64Bit=64 位元
UninstallDisplayNameMarkAllUsers=所有使用者
UninstallDisplayNameMarkCurrentUser=目前使用者

; *** 安裝後錯誤
ErrorOpeningReadme=嘗試開啟讀我檔案時出錯。
ErrorRestartingComputer=安裝程式無法重新啟動電腦，請手動重新啟動。

; *** 解除安裝訊息
UninstallNotFound=檔案「%1」不存在。無法解除安裝。
UninstallOpenError=檔案「%1」無法開啟。無法解除安裝。
UninstallUnsupportedVer=此版本的解除安裝程式無法識別解除安裝記錄檔「%1」的格式。無法解除安裝
UninstallUnknownEntry=解除安裝記錄中遇到未知的項目 (%1)
ConfirmUninstall=您確認要完全移除 %1 及其所有元件嗎？
UninstallOnlyOnWin64=僅允許在 64 位元 Windows 中解除安裝此程式。
OnlyAdminCanUninstall=僅具有系統管理員權限的使用者才能完成此解除安裝。
UninstallStatusLabel=正在從您的電腦中移除 %1，請稍候。
UninstalledAll=已順利從您的電腦中移除 %1。
UninstalledMost=%1 解除安裝完成。%n%n有部分內容未能被刪除，但您可以手動刪除它們。
UninstalledAndNeedsRestart=為完成 %1 的解除安裝，需要重新啟動您的電腦。%n%n立即重新啟動電腦嗎？
UninstallDataCorrupted=檔案「%1」已損毀。無法解除安裝

; *** 解除安裝狀態訊息
ConfirmDeleteSharedFileTitle=刪除共用的檔案嗎？
ConfirmDeleteSharedFile2=系統顯示下列共用的檔案已不再有其他程式使用。您希望解除安裝程式刪除這些共用的檔案嗎？%n%n如果刪除這些檔案，但仍有程式在使用這些檔案，則這些程式可能出現異常。如果您不確定，請選擇「否」，在系統中保留這些檔案以免引發問題。
SharedFileNameLabel=檔案名稱：
SharedFileLocationLabel=位置：
WizardUninstalling=解除安裝狀態
StatusUninstalling=正在解除安裝 %1...

; *** Shutdown block reasons
ShutdownBlockReasonInstallingApp=正在安裝 %1。
ShutdownBlockReasonUninstallingApp=正在解除安裝 %1。

; *** File verification messages (6.4+)
VerificationKeyNotFound=找不到驗證金鑰
VerificationSignatureDoesntExist=驗證簽章不存在
VerificationSignatureInvalid=驗證簽章無效
VerificationFileNameIncorrect=驗證檔案名稱不正確
VerificationFileSizeIncorrect=驗證檔案大小不正確
VerificationFileHashIncorrect=驗證檔案雜湊值不正確
VerificationFileTagIncorrect=驗證檔案標記不正確
VerificationSourceFailed=驗證來源失敗: %1 %2
SourceVerificationFailed=驗證來源失敗: %1 %2
ArchiveIncorrectPassword=封存密碼不正確
ArchiveIsCorrupted=封存已損毀
ArchiveUnsupportedFormat=不支援的封存格式

; *** Download/Extract messages (6.4+)
DownloadingLabel2=正在下載 %1...
ErrorDownloading=下載時出錯：%1 %2
ErrorExtracting=解壓縮時出錯：%1
ExtractingLabel=正在解壓縮 %1...
StatusDownloadFiles=正在下載檔案...

; *** Retry/Cancel messages
RetryCancelSelectAction=選擇操作
RetryCancelRetry=重試(&T)
RetryCancelCancel=取消

[CustomMessages]

NameAndVersion=%1 版本 %2
AdditionalIcons=附加捷徑：
CreateDesktopIcon=建立桌面捷徑(&D)
CreateQuickLaunchIcon=建立快速啟動列捷徑(&Q)
ProgramOnTheWeb=%1 網站
UninstallProgram=解除安裝 %1
LaunchProgram=執行 %1
