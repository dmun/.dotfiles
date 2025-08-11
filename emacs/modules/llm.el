(use-package gptel
  :ensure t
  :config
  (setf (alist-get 'markdown-mode gptel-prompt-prefix-alist) "# ")
  (setf (alist-get 'markdown-mode gptel-response-prefix-alist) "")
  (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "*** ")
  (setf (alist-get 'org-mode gptel-response-prefix-alist) "")
  (setq rc/gptel-inception
   (gptel-make-anthropic "Inception"
      :stream nil
      :host "api.inceptionlabs.ai"
      :key (exec-path-from-shell-getenv "INCEPTION_API_KEY")
      :models '("mercury-coder")))
  (setq rc/gptel-anthropic
   (gptel-make-anthropic "Claude"
      :stream t
      :key (exec-path-from-shell-getenv "ANTHROPIC_API_KEY")
      :models '("claude-sonnet-4-0")))
  (setq rc/gptel-mistral
   (gptel-make-openai "MistralLeChat"
      :host "api.mistral.ai"
      :stream t
      :endpoint "/v1/chat/completions"
      :protocol "https"
      :key (exec-path-from-shell-getenv "MISTRAL_API_KEY")
      :models '("mistral-large-latest")))
  (setq rc/gptel-deepseek
   (gptel-make-deepseek "Deepseek"
      :stream t
      :key (exec-path-from-shell-getenv "DEEPSEEK_API_KEY")
      :models '("deepseek-chat")))
  (setq gptel-default-mode 'org-mode
   gptel-backend rc/gptel-anthropic))
