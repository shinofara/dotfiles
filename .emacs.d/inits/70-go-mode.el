(el-get-bundle! 'exec-path-from-shell)
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; go-mode
;; In advance, install godef, gocode, and goimports in $GOPATH.
;;   go get code.google.com/p/rog-go/exp/cmd/godef
;;   go get -u github.com/nsf/gocode
;;   go get code.google.com/p/go.tools/cmd/goimports
;; exec-path should include a path to ~/go/bin.
;; So DO NOT launch an emacs from App icon, DO launch an emacs from terminal (shell).
(el-get-bundle! 'go-mode)

(add-hook 'before-save-hook 'gofmt-before-save)

(el-get-bundle! 'go-autocomplete)

(add-to-list 'exec-path (expand-file-name "/usr/local/bin"))
(add-to-list 'exec-path (expand-file-name "~/go/bin"))
