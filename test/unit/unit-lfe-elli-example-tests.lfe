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

(deftest index-status
  (application:start 'lfe-elli-example)
  (inets:start)
  (let (((tuple 'ok (tuple (tuple _ status _) headers body))
         (httpc:request "http://localhost:3000")))
    (application:stop 'lfe-elli-example)
    (is-equal status 200)))
