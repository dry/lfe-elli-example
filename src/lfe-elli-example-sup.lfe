(defmodule lfe-elli-example-sup
  (behaviour supervisor)
  ;; API
  (export (start_link 0))
  ;; Supervisor callbacks
  (export (init 1)))

;; Returns tuple that defines supervisor child
(defun create-child (name type opts)
  (tuple name
         (tuple name
                'start_link
                opts)
         'permanent
         5000
         type
         (list name)))

(defun server-name ()
  'lfe-elli-example-sup)

(defun start_link ()
  (: supervisor start_link
    (tuple 'local (server-name)) (MODULE) '()))

(defun init (args)
  (let* ((server (create-child 'lfe-elli-example-server 'worker '()))
         (opts (list (tuple 'callback 'lfe-elli-example-router)
                     (tuple 'port 3000)))
         (elli (create-child 'elli 'worker (list opts)))
         (children (list server elli))
         (restart-strategy (tuple 'one_for_one 3 1)))
    (tuple 'ok (tuple restart-strategy children))))
