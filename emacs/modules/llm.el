(use-package gptel
  :ensure t
  :config
  (setf (alist-get 'markdown-mode gptel-prompt-prefix-alist) "# ")
  (setf (alist-get 'markdown-mode gptel-response-prefix-alist) "")
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*** ")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "")
  (gptel-make-openai "Inception"
    :stream nil
    :host "api.inceptionlabs.ai"
    :key (exec-path-from-shell-getenv "INCEPTION_API_KEY")
    :models '("mercury-coder"))
  (setq rc/gptel-anthropic
	(gptel-make-anthropic "Claude"
	  :stream t
	  :key (exec-path-from-shell-getenv "ANTHROPIC_API_KEY")
	  :models '("claude-sonnet-4-0")))
  (gptel-make-openai "MistralLeChat"
    :stream t
    :host "api.mistral.ai"
    :endpoint "/v1/chat/completions"
    :protocol "https"
    :key (exec-path-from-shell-getenv "MISTRAL_API_KEY")
    :models '("mistral-large-latest"))
  (gptel-make-deepseek "Deepseek"
    :stream t
    :key (exec-path-from-shell-getenv "DEEPSEEK_API_KEY")
    :models '("deepseek-chat"))
  (setq gptel-default-mode 'org-mode
	gptel-stream t
	gptel-model 'claude-sonnet-4-0
	gptel-backend rc/gptel-anthropic
	gptel-use-header-line nil))
