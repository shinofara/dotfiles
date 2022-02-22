;; \*.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)

;;; .\#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;; M-x wでコピー
(setq x-select-enable-clipboard t)

;; Ctrl-x p で逆向きへのウィンドウ移動
(global-set-key "\C-xp" (lambda () (interactive) (other-window -1)))

;;タブではなくスペースを使う
(setq-default indent-tabs-mode nil)
(setq indent-line-function 'indent-relative-maybe)

;; タブ幅をスペース2個幅に変更
(setq default-tab-width 2)

;;
;; whitespace
;; タブスペースなどを可視化
;;
(require 'whitespace)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         empty          ; 先頭/末尾の空行
                        space-mark     ; 表示のマッピング
                        tab-mark
                        ))

(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)

;; タイトルバーにファイル名表示
;(setq frame-title-format (format "%%f - Emacs@%s" (system-name)))

;;
;; Window settings
;;______________________________________________________________________

(if window-system
    (progn
      (set-frame-parameter nil 'alpha 100) ; 透明度
      (tool-bar-mode nil)                  ; ツールバー非表示
      (set-scroll-bar-mode nil)            ; スクロールバー非表示
      (setq line-spacing 0.2)              ; 行間
      (when (>= emacs-major-version 23)
        (tool-bar-mode nil)
        (set-frame-font "Menlo-12")
        (set-fontset-font (frame-parameter nil 'font)
                          'japanese-jisx0208
                          (font-spec :family "M+2VM+IPAG circle" :size 14)))
      (setq ns-pop-up-frames nil)))

;; 何文字目にいるか表示
(column-number-mode 1)

;; 行カーソル
(defface hlline-face
  '((((class color)
      (background dark))
     ;;(:background "dark state gray"))
     (:background "gray10"
                  :underline "gray24"))
    (((class color)
      (background light))
     (:background "gray24"
                  :underline nil))
    (t ()))
  "*Face used by hl-line.")
;;(setq hl-line-face 'underline)
(setq hl-line-face 'hlline-face)

;;; 現行行を目立たせる
(global-hl-line-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("9fd20670758db15cc4d0b4442a74543888d2e445646b25f2755c65dcd6f1504b" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;C-hがBackspaceになる
 (global-set-key "\C-h" 'delete-backward-char)

 ;; 'o' 次の行に挿入
 (defun edit-next-line ()
   (interactive)
     (end-of-line)
       (newline-and-indent))


;; 'O' 前の行に挿入
(defun edit-previous-line ()
  (interactive)
    (forward-line -1)
      (if (not (= (current-line) 1))
            (end-of-line))
              (newline-and-indent))

              (global-set-key (kbd "M-o") 'edit-next-line)
              (global-set-key (kbd "M-O") 'edit-previous-line)

;;(require 'evil)
;;(evil-mode 1)

;; window移動をやじるしで
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)

 ;; 動的略語展開のキー
  (global-set-key (kbd "C-<tab>") 'dabbrev-expand)
   (define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

   (defun my-next-line-n () (interactive) (next-line 10))
   (defun my-prev-line-n () (interactive) (previous-line 10))
   (global-set-key (kbd "C-<") 'my-next-line-n)
   (global-set-key (kbd "C->") 'my-prev-line-n)


