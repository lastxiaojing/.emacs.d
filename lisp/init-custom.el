;; 定制
(defgroup my nil
  "Presonal Emacs configurations."
  :group 'extensions)

(defcustom my-logo (expand-file-name "logo.png" user-emacs-directory)
  "Set Centaur logo. nil means official logo."
  :type 'string)

(defcustom my-full-name "Jingzhen Zhao"
  "Set user full name."
  :type 'string)

(defcustom my-mail-address "314956355@qq.com"
  "Set user email address."
  :type 'string)

(defcustom my-proxy "127.0.0.1:1087"
  "Set network proxy."
  :type 'string)

(defcustom my-package-archives 'melpa
  "Set package archives from which to fetch."
  :type '(choice
	  (const :tag "Melpa" melpa)
	  (const :tag "Emacs-China" emacs-china)
	  (const :tag "Tuna" tuna)))

(defcustom my-theme 'default
  "Set color theme."
  :type '(choice
	  (const :tag "Default theme" default)
	  (const :tag "Dark theme" dark)
	  (const :tag "Light theme" light)
	  (const :tag "Daylight theme" daylight)))

(defcustom my-emoji-enable nil
  "Enable emoji features or not."
  :type 'boolean)

(defcustom my-benchmark-enabled nil
  "Enable the init benchmark or not."
  :type 'boolean)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(if (file-exists-p custom-file)
    (load custom-file))

(provide 'init-custom)
	  
