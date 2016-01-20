(el-get-bundle! python-mode)
(el-get-bundle! ac-python)
(el-get-bundle! company-jedi in tkf/emacs-jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
