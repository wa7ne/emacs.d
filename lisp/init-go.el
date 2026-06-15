;;

(require-package 'lsp-mode)
(require-package 'lsp-ui)     ;; 可选，提供 sideline、flycheck 集成等
(require-package 'company)    ;; 确保你已安装 company，lsp 会使用 company-capf



;; lsp-mode 基础配置
(after-load 'lsp-mode
  ;; 自动猜测项目根目录（基于 go.mod / .git 等）
  (setq lsp-auto-guess-root t)
  ;; 启用 lsp-ui（如果有的话）
  ;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

  ;; Go 专用分析器
  (setq lsp-go-analyses '((shadow . t)
                          (unusedparams . t)
                          (unusedvariable . t)
                          (unusedtype . t)))
  ;; 使用 gofumpt 格式化（可选，如果服务器上有 gofumpt 且你希望用）
  (setq lsp-go-use-gofumpt nil)   ;; 因为你已经有 gofmt-before-save

  ;; 远端 PATH 扩展（如果 tramp-remote-path 没生效，也可在这里强制）
  ;; (setq lsp-go-gopls-server-args '("-remote=auto")) ;; 不需要特殊参数
  )

;; 可选：lsp-ui 的侧边栏和文档
(after-load 'lsp-ui
  ;; 浮动文档
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-delay 1.5
        lsp-ui-doc-position 'bottom)
  ;; 侧边线
  (setq lsp-ui-sideline-enable t
        lsp-ui-sideline-show-hover t))


(provide 'init-go)
