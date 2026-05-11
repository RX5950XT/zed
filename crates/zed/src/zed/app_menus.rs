use collab_ui::collab_panel;
use gpui::{App, Menu, MenuItem, OsAction};
use release_channel::ReleaseChannel;
use terminal_view::terminal_panel;
use zed_actions::{debug_panel, dev};

pub fn app_menus(cx: &mut App) -> Vec<Menu> {
    use zed_actions::Quit;

    let mut view_items = vec![
        MenuItem::action(
            "放大",
            zed_actions::IncreaseBufferFontSize { persist: false },
        ),
        MenuItem::action(
            "縮小",
            zed_actions::DecreaseBufferFontSize { persist: false },
        ),
        MenuItem::action(
            "重設縮放",
            zed_actions::ResetBufferFontSize { persist: false },
        ),
        MenuItem::action(
            "重設所有縮放",
            zed_actions::ResetAllZoom { persist: false },
        ),
        MenuItem::separator(),
        MenuItem::action("切換左側停靠區", workspace::ToggleLeftDock),
        MenuItem::action("切換右側停靠區", workspace::ToggleRightDock),
        MenuItem::action("切換底部停靠區", workspace::ToggleBottomDock),
        MenuItem::action("切換所有停靠區", workspace::ToggleAllDocks),
        MenuItem::submenu(Menu {
            name: "編輯器版面配置".into(),
            disabled: false,
            items: vec![
                MenuItem::action("向上分割", workspace::SplitUp::default()),
                MenuItem::action("向下分割", workspace::SplitDown::default()),
                MenuItem::action("向左分割", workspace::SplitLeft::default()),
                MenuItem::action("向右分割", workspace::SplitRight::default()),
            ],
        }),
        MenuItem::separator(),
        MenuItem::action("專案面板", zed_actions::project_panel::ToggleFocus),
        MenuItem::action("大綱面板", outline_panel::ToggleFocus),
        MenuItem::action("協作面板", collab_panel::ToggleFocus),
        MenuItem::action("終端機面板", terminal_panel::ToggleFocus),
        MenuItem::action("除錯器面板", debug_panel::ToggleFocus),
        MenuItem::separator(),
        MenuItem::action("診斷", diagnostics::Deploy),
        MenuItem::separator(),
    ];

    if ReleaseChannel::try_global(cx) == Some(ReleaseChannel::Dev) {
        view_items.push(MenuItem::action(
            "切換 GPUI 檢視器",
            dev::ToggleInspector,
        ));
        view_items.push(MenuItem::separator());
    }

    vec![
        Menu {
            name: "Zed".into(),
            disabled: false,
            items: vec![
                MenuItem::action("關於 Zed", zed_actions::About),
                MenuItem::action("檢查更新", auto_update::Check),
                MenuItem::separator(),
                MenuItem::submenu(Menu::new("設定").items([
                    MenuItem::action("開啟設定", zed_actions::OpenSettings),
                    MenuItem::action("開啟設定檔案", super::OpenSettingsFile),
                    MenuItem::action("開啟專案設定", zed_actions::OpenProjectSettings),
                    MenuItem::action("開啟專案設定檔案", super::OpenProjectSettingsFile),
                    MenuItem::action("開啟預設設定", super::OpenDefaultSettings),
                    MenuItem::separator(),
                    MenuItem::action("開啟按鍵對應", zed_actions::OpenKeymap),
                    MenuItem::action("開啟按鍵對應檔案", zed_actions::OpenKeymapFile),
                    MenuItem::action("開啟預設按鍵綁定", zed_actions::OpenDefaultKeymap),
                    MenuItem::separator(),
                    MenuItem::action(
                        "選擇主題...",
                        zed_actions::theme_selector::Toggle::default(),
                    ),
                    MenuItem::action(
                        "選擇圖示主題...",
                        zed_actions::icon_theme_selector::Toggle::default(),
                    ),
                ])),
                MenuItem::separator(),
                #[cfg(target_os = "macos")]
                MenuItem::os_submenu("服務", gpui::SystemMenuType::Services),
                MenuItem::separator(),
                MenuItem::action("擴充功能", zed_actions::Extensions::default()),
                #[cfg(not(target_os = "windows"))]
                MenuItem::action("安裝 CLI", install_cli::InstallCliBinary),
                MenuItem::separator(),
                #[cfg(target_os = "macos")]
                MenuItem::action("隱藏 Zed", super::Hide),
                #[cfg(target_os = "macos")]
                MenuItem::action("隱藏其他", super::HideOthers),
                #[cfg(target_os = "macos")]
                MenuItem::action("顯示全部", super::ShowAll),
                MenuItem::separator(),
                MenuItem::action("結束 Zed", Quit),
            ],
        },
        Menu {
            name: "檔案".into(),
            disabled: false,
            items: vec![
                MenuItem::action("新增", workspace::NewFile),
                MenuItem::action("新增視窗", workspace::NewWindow),
                MenuItem::separator(),
                #[cfg(not(target_os = "macos"))]
                MenuItem::action("開啟檔案...", workspace::OpenFiles),
                MenuItem::action(
                    if cfg!(not(target_os = "macos")) {
                        "開啟資料夾..."
                    } else {
                        "開啟…"
                    },
                    workspace::Open::default(),
                ),
                MenuItem::action(
                    "開啟最近項目...",
                    zed_actions::OpenRecent {
                        create_new_window: false,
                    },
                ),
                MenuItem::action(
                    "開啟遠端...",
                    zed_actions::OpenRemote {
                        create_new_window: false,
                        from_existing_connection: false,
                    },
                ),
                MenuItem::separator(),
                MenuItem::action("將資料夾加入專案…", workspace::AddFolderToProject),
                MenuItem::separator(),
                MenuItem::action("儲存", workspace::Save { save_intent: None }),
                MenuItem::action("另存新檔…", workspace::SaveAs),
                MenuItem::action("全部儲存", workspace::SaveAll { save_intent: None }),
                MenuItem::separator(),
                MenuItem::action(
                    "關閉編輯器",
                    workspace::CloseActiveItem {
                        save_intent: None,
                        close_pinned: true,
                    },
                ),
                MenuItem::action("關閉專案", workspace::CloseProject),
                MenuItem::action("關閉視窗", workspace::CloseWindow),
            ],
        },
        Menu {
            name: "編輯".into(),
            disabled: false,
            items: vec![
                MenuItem::os_action("還原", editor::actions::Undo, OsAction::Undo),
                MenuItem::os_action("重做", editor::actions::Redo, OsAction::Redo),
                MenuItem::separator(),
                MenuItem::os_action("剪下", editor::actions::Cut, OsAction::Cut),
                MenuItem::os_action("複製", editor::actions::Copy, OsAction::Copy),
                MenuItem::action("複製並修整", editor::actions::CopyAndTrim),
                MenuItem::os_action("貼上", editor::actions::Paste, OsAction::Paste),
                MenuItem::separator(),
                MenuItem::action("尋找", search::buffer_search::Deploy::find()),
                MenuItem::action("在專案中尋找", workspace::DeploySearch::default()),
                MenuItem::separator(),
                MenuItem::action(
                    "切換行註解",
                    editor::actions::ToggleComments::default(),
                ),
            ],
        },
        Menu {
            name: "選取".into(),
            disabled: false,
            items: vec![
                MenuItem::os_action(
                    "全選",
                    editor::actions::SelectAll,
                    OsAction::SelectAll,
                ),
                MenuItem::action("擴大選取範圍", editor::actions::SelectLargerSyntaxNode),
                MenuItem::action("縮小選取範圍", editor::actions::SelectSmallerSyntaxNode),
                MenuItem::action("選取下一個同層項目", editor::actions::SelectNextSyntaxNode),
                MenuItem::action(
                    "選取上一個同層項目",
                    editor::actions::SelectPreviousSyntaxNode,
                ),
                MenuItem::separator(),
                MenuItem::action(
                    "在上方新增游標",
                    editor::actions::AddSelectionAbove {
                        skip_soft_wrap: true,
                    },
                ),
                MenuItem::action(
                    "在下方新增游標",
                    editor::actions::AddSelectionBelow {
                        skip_soft_wrap: true,
                    },
                ),
                MenuItem::action(
                    "選取下一個相符項目",
                    editor::actions::SelectNext {
                        replace_newest: false,
                    },
                ),
                MenuItem::action(
                    "選取上一個相符項目",
                    editor::actions::SelectPrevious {
                        replace_newest: false,
                    },
                ),
                MenuItem::action("選取所有相符項目", editor::actions::SelectAllMatches),
                MenuItem::separator(),
                MenuItem::action("向上移動行", editor::actions::MoveLineUp),
                MenuItem::action("向下移動行", editor::actions::MoveLineDown),
                MenuItem::action("複製選取內容", editor::actions::DuplicateLineDown),
            ],
        },
        Menu {
            name: "檢視".into(),
            disabled: false,
            items: view_items,
        },
        Menu {
            name: "前往".into(),
            disabled: false,
            items: vec![
                MenuItem::action("返回", workspace::GoBack),
                MenuItem::action("向前", workspace::GoForward),
                MenuItem::separator(),
                MenuItem::action("指令面板...", zed_actions::command_palette::Toggle),
                MenuItem::separator(),
                MenuItem::action("前往檔案...", workspace::ToggleFileFinder::default()),
                // MenuItem::action("Go to Symbol in Project", project_symbols::Toggle),
                MenuItem::action(
                    "前往編輯器中的符號...",
                    zed_actions::outline::ToggleOutline,
                ),
                MenuItem::action("前往行/欄...", editor::actions::ToggleGoToLine),
                MenuItem::separator(),
                MenuItem::action("前往定義", editor::actions::GoToDefinition),
                MenuItem::action("前往宣告", editor::actions::GoToDeclaration),
                MenuItem::action("前往類型定義", editor::actions::GoToTypeDefinition),
                MenuItem::action(
                    "尋找所有參考",
                    editor::actions::FindAllReferences::default(),
                ),
                MenuItem::separator(),
                MenuItem::action("下一個問題", editor::actions::GoToDiagnostic::default()),
                MenuItem::action(
                    "上一個問題",
                    editor::actions::GoToPreviousDiagnostic::default(),
                ),
            ],
        },
        Menu {
            name: "執行".into(),
            disabled: false,
            items: vec![
                MenuItem::action(
                    "執行任務",
                    zed_actions::Spawn::ViaModal {
                        reveal_target: None,
                    },
                ),
                MenuItem::action("開始除錯", debugger_ui::Start),
                MenuItem::separator(),
                MenuItem::action("編輯 tasks.json...", crate::zed::OpenProjectTasks),
                MenuItem::action("編輯 debug.json...", zed_actions::OpenProjectDebugTasks),
                MenuItem::separator(),
                MenuItem::action("繼續", debugger_ui::Continue),
                MenuItem::action("逐程序", debugger_ui::StepOver),
                MenuItem::action("逐步進入", debugger_ui::StepInto),
                MenuItem::action("逐步跳出", debugger_ui::StepOut),
                MenuItem::separator(),
                MenuItem::action("切換中斷點", editor::actions::ToggleBreakpoint),
                MenuItem::action("編輯中斷點", editor::actions::EditLogBreakpoint),
                MenuItem::action("清除所有中斷點", debugger_ui::ClearAllBreakpoints),
            ],
        },
        Menu {
            name: "視窗".into(),
            disabled: false,
            items: vec![
                MenuItem::action("最小化", super::Minimize),
                MenuItem::action("縮放", super::Zoom),
                MenuItem::separator(),
            ],
        },
        Menu {
            name: "說明".into(),
            disabled: false,
            items: vec![
                MenuItem::action(
                    "在本機檢視版本說明",
                    auto_update_ui::ViewReleaseNotesLocally,
                ),
                MenuItem::action("檢視遙測資料", zed_actions::OpenTelemetryLog),
                MenuItem::action("檢視相依授權", zed_actions::OpenLicenses),
                MenuItem::action("顯示歡迎畫面", onboarding::ShowWelcome),
                MenuItem::separator(),
                MenuItem::action("回報錯誤...", zed_actions::feedback::FileBugReport),
                MenuItem::action("請求功能...", zed_actions::feedback::RequestFeature),
                MenuItem::action("寄信給我們...", zed_actions::feedback::EmailZed),
                MenuItem::separator(),
                MenuItem::action(
                    "文件",
                    super::OpenBrowser {
                        url: "https://zed.dev/docs".into(),
                    },
                ),
                MenuItem::action("Zed 儲存庫", feedback::OpenZedRepo),
                MenuItem::action(
                    "Zed Twitter",
                    super::OpenBrowser {
                        url: "https://twitter.com/zeddotdev".into(),
                    },
                ),
                MenuItem::action(
                    "加入團隊",
                    super::OpenBrowser {
                        url: "https://zed.dev/jobs".into(),
                    },
                ),
            ],
        },
    ]
}
