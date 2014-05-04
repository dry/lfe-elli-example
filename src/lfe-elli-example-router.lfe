(defmodule lfe-elli-example-router
  (behaviour elli_handler)
  (export (handle 2)
          (handle_event 3)))

(include-lib "elli/include/elli.hrl")

(defun handle (req args)
  (let ( (path (elli_request:path req))
         (method (req-method req)))
    (route method path req) ))

(defun handle_event (event data args)
  'ok)

(defun route
  ([GET' '[] req]
   (lfe-elli-example-handler-index:init req))

  ([method path req]
   (tuple 404 '[] (binary "Not Found"))))
