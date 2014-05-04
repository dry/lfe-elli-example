(defmodule lfe-elli-example-app
  (behaviour application)
  (export (start 2)
          (stop 1)))

(defun start (type args)
  (let ((result (: lfe-elli-example-sup start_link)))
    (case result
      ((tuple 'ok pid)
        result)
      (_
        (tuple 'error result)))))

(defun stop (state)
  'ok)
