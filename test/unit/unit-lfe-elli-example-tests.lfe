(defmodule unit-lfe-elli-example-tests
  (export all)
  (import
    (from lfeunit-util
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "deps/lfeunit/include/lfeunit-macros.lfe")

(deftest code-change
  (is-equal
    ;; XXX This unit test fails by default -- fix it!
    (tuple 'ok "state")
    (: lfe-elli-example-server code_change
       '"old version"
       '"state"
       '"extra")))
