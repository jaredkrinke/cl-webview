(ql:quickload '(:cffi :float-features))

(defpackage :webview
  (:documentation "Test for libwebview")
  (:use :cl
	:cffi))

(in-package :webview)

(define-foreign-library libwebview
  (t (:default "libwebview") :search-path "."))

(use-foreign-library libwebview)

(defcfun "webview_create" (:pointer :void)
  (debug :boolean)
  (window (:pointer :void)))

(defcfun "webview_destroy" :void
  (webview (:pointer :void)))

(defcfun "webview_navigate" :void
  (webview (:pointer :void))
  (url :string))

(defcfun "webview_run" :void
  (webview (:pointer :void)))

(defcfun "webview_terminate" :void
  (webview (:pointer :void)))

;; Don't raise floating point errors in Common Lisp when they're triggered (and expected) by C code...
(float-features:with-float-traps-masked t
  (let ((webview (webview-create nil (null-pointer))))
  (webview-navigate webview "https://log.schemescape.com/")
  (webview-run webview)))
