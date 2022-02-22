(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get を利用
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; el-get.lock ファイルにバージョン固定の指定を書き出す
(el-get-bundle tarao/el-get-lock)
(el-get-lock)

;; init-loader.el を利用して設定を分割
;; "~/.emacs.d/inits" はデフォルトのロードパス
(el-get-bundle 'init-loader)
(require 'init-loader)
(setq init-loader-byte-compile t)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")

;;; init.el ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("aed65eaa2b5e49d6743efd8056f4bf375436dba34f636dee094a62de22ce03f3" "9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
