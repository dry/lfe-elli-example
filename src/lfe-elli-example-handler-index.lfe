(defmodule lfe-elli-example-handler-index
  (export (init 1)))

(defun init(req)
  (let (((tuple 'ok template) (index_dtl:render)))
    (tuple 'ok '[] template)))
