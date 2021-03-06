;;; hydra-test.el --- Tests for Hydra

;; Copyright (C) 2015  Free Software Foundation, Inc.

;; Author: Oleh Krehel

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;

;;; Code:

(require 'ert)

(ert-deftest hydra-red-error ()
  (should
   (equal
    (macroexpand
     '(defhydra hydra-error (global-map "M-g")
       "error"
       ("h" first-error "first")
       ("j" next-error "next")
       ("k" previous-error "prev")))
    '(progn
      (defun hydra-error/first-error nil "Create a hydra with a \"M-g\" body and the heads:

\"h\":    `first-error',
\"j\":    `next-error',
\"k\":    `previous-error'

The body can be accessed via `hydra-error/body'.

Call the head: `first-error'."
             (interactive)
             (hydra-disable)
             (catch (quote hydra-disable)
               (condition-case err (prog1 t (call-interactively (function first-error)))
                 ((quit error) (message "%S" err)
                  (unless hydra-lv (sit-for 0.8))
                  nil))
               (when hydra-is-helpful (hydra-error/hint))
               (setq hydra-last
                     (hydra-set-transient-map
                      (setq hydra-curr-map
                            (quote (keymap (107 . hydra-error/previous-error)
                                           (106 . hydra-error/next-error)
                                           (104 . hydra-error/first-error)
                                           (kp-subtract . hydra--negative-argument)
                                           (kp-9 . hydra--digit-argument)
                                           (kp-8 . hydra--digit-argument)
                                           (kp-7 . hydra--digit-argument)
                                           (kp-6 . hydra--digit-argument)
                                           (kp-5 . hydra--digit-argument)
                                           (kp-4 . hydra--digit-argument)
                                           (kp-3 . hydra--digit-argument)
                                           (kp-2 . hydra--digit-argument)
                                           (kp-1 . hydra--digit-argument)
                                           (kp-0 . hydra--digit-argument)
                                           (57 . hydra--digit-argument)
                                           (56 . hydra--digit-argument)
                                           (55 . hydra--digit-argument)
                                           (54 . hydra--digit-argument)
                                           (53 . hydra--digit-argument)
                                           (52 . hydra--digit-argument)
                                           (51 . hydra--digit-argument)
                                           (50 . hydra--digit-argument)
                                           (49 . hydra--digit-argument)
                                           (48 . hydra--digit-argument)
                                           (45 . hydra--negative-argument)
                                           (21 . hydra--universal-argument))))
                      t (lambda nil (hydra-cleanup))))))
      (defun hydra-error/next-error nil "Create a hydra with a \"M-g\" body and the heads:

\"h\":    `first-error',
\"j\":    `next-error',
\"k\":    `previous-error'

The body can be accessed via `hydra-error/body'.

Call the head: `next-error'."
             (interactive)
             (hydra-disable)
             (catch (quote hydra-disable)
               (condition-case err (prog1 t (call-interactively (function next-error)))
                 ((quit error) (message "%S" err)
                  (unless hydra-lv (sit-for 0.8))
                  nil))
               (when hydra-is-helpful (hydra-error/hint))
               (setq hydra-last
                     (hydra-set-transient-map
                      (setq hydra-curr-map
                            (quote (keymap (107 . hydra-error/previous-error)
                                           (106 . hydra-error/next-error)
                                           (104 . hydra-error/first-error)
                                           (kp-subtract . hydra--negative-argument)
                                           (kp-9 . hydra--digit-argument)
                                           (kp-8 . hydra--digit-argument)
                                           (kp-7 . hydra--digit-argument)
                                           (kp-6 . hydra--digit-argument)
                                           (kp-5 . hydra--digit-argument)
                                           (kp-4 . hydra--digit-argument)
                                           (kp-3 . hydra--digit-argument)
                                           (kp-2 . hydra--digit-argument)
                                           (kp-1 . hydra--digit-argument)
                                           (kp-0 . hydra--digit-argument)
                                           (57 . hydra--digit-argument)
                                           (56 . hydra--digit-argument)
                                           (55 . hydra--digit-argument)
                                           (54 . hydra--digit-argument)
                                           (53 . hydra--digit-argument)
                                           (52 . hydra--digit-argument)
                                           (51 . hydra--digit-argument)
                                           (50 . hydra--digit-argument)
                                           (49 . hydra--digit-argument)
                                           (48 . hydra--digit-argument)
                                           (45 . hydra--negative-argument)
                                           (21 . hydra--universal-argument))))
                      t (lambda nil (hydra-cleanup))))))
      (defun hydra-error/previous-error nil "Create a hydra with a \"M-g\" body and the heads:

\"h\":    `first-error',
\"j\":    `next-error',
\"k\":    `previous-error'

The body can be accessed via `hydra-error/body'.

Call the head: `previous-error'."
             (interactive)
             (hydra-disable)
             (catch (quote hydra-disable)
               (condition-case err (prog1 t (call-interactively (function previous-error)))
                 ((quit error) (message "%S" err)
                  (unless hydra-lv (sit-for 0.8))
                  nil))
               (when hydra-is-helpful (hydra-error/hint))
               (setq hydra-last
                     (hydra-set-transient-map
                      (setq hydra-curr-map
                            (quote (keymap (107 . hydra-error/previous-error)
                                           (106 . hydra-error/next-error)
                                           (104 . hydra-error/first-error)
                                           (kp-subtract . hydra--negative-argument)
                                           (kp-9 . hydra--digit-argument)
                                           (kp-8 . hydra--digit-argument)
                                           (kp-7 . hydra--digit-argument)
                                           (kp-6 . hydra--digit-argument)
                                           (kp-5 . hydra--digit-argument)
                                           (kp-4 . hydra--digit-argument)
                                           (kp-3 . hydra--digit-argument)
                                           (kp-2 . hydra--digit-argument)
                                           (kp-1 . hydra--digit-argument)
                                           (kp-0 . hydra--digit-argument)
                                           (57 . hydra--digit-argument)
                                           (56 . hydra--digit-argument)
                                           (55 . hydra--digit-argument)
                                           (54 . hydra--digit-argument)
                                           (53 . hydra--digit-argument)
                                           (52 . hydra--digit-argument)
                                           (51 . hydra--digit-argument)
                                           (50 . hydra--digit-argument)
                                           (49 . hydra--digit-argument)
                                           (48 . hydra--digit-argument)
                                           (45 . hydra--negative-argument)
                                           (21 . hydra--universal-argument))))
                      t (lambda nil (hydra-cleanup))))))
      (unless (keymapp (lookup-key global-map (kbd "M-g")))
        (define-key global-map (kbd "M-g")
          nil))
      (define-key global-map [134217831 104]
       (function hydra-error/first-error))
      (define-key global-map [134217831 106]
       (function hydra-error/next-error))
      (define-key global-map [134217831 107]
       (function hydra-error/previous-error))
      (defun hydra-error/hint nil
        (if hydra-lv (lv-message (format #("error: [h]: first, [j]: next, [k]: prev." 8 9 (face hydra-face-red)
                                           20 21 (face hydra-face-red)
                                           31 32 (face hydra-face-red))))
          (message (format #("error: [h]: first, [j]: next, [k]: prev." 8 9 (face hydra-face-red)
                             20 21 (face hydra-face-red)
                             31 32 (face hydra-face-red))))))
      (defun hydra-error/body nil "Create a hydra with a \"M-g\" body and the heads:

\"h\":    `first-error',
\"j\":    `next-error',
\"k\":    `previous-error'

The body can be accessed via `hydra-error/body'."
             (interactive)
             (hydra-disable)
             (catch (quote hydra-disable)
               (when hydra-is-helpful (hydra-error/hint))
               (setq hydra-last
                     (hydra-set-transient-map
                      (setq hydra-curr-map
                            (quote
                             (keymap (107 . hydra-error/previous-error)
                                     (106 . hydra-error/next-error)
                                     (104 . hydra-error/first-error)
                                     (kp-subtract . hydra--negative-argument)
                                     (kp-9 . hydra--digit-argument)
                                     (kp-8 . hydra--digit-argument)
                                     (kp-7 . hydra--digit-argument)
                                     (kp-6 . hydra--digit-argument)
                                     (kp-5 . hydra--digit-argument)
                                     (kp-4 . hydra--digit-argument)
                                     (kp-3 . hydra--digit-argument)
                                     (kp-2 . hydra--digit-argument)
                                     (kp-1 . hydra--digit-argument)
                                     (kp-0 . hydra--digit-argument)
                                     (57 . hydra--digit-argument)
                                     (56 . hydra--digit-argument)
                                     (55 . hydra--digit-argument)
                                     (54 . hydra--digit-argument)
                                     (53 . hydra--digit-argument)
                                     (52 . hydra--digit-argument)
                                     (51 . hydra--digit-argument)
                                     (50 . hydra--digit-argument)
                                     (49 . hydra--digit-argument)
                                     (48 . hydra--digit-argument)
                                     (45 . hydra--negative-argument)
                                     (21 . hydra--universal-argument))))
                      t (lambda nil (hydra-cleanup))))
               (setq prefix-arg current-prefix-arg)))))))

(ert-deftest hydra-blue-toggle ()
  (should
   (equal
    (macroexpand
     '(defhydra hydra-toggle (:color blue)
       "toggle"
       ("t" toggle-truncate-lines "truncate")
       ("f" auto-fill-mode "fill")
       ("a" abbrev-mode "abbrev")
       ("q" nil "cancel")))
    '(progn
      (defun hydra-toggle/toggle-truncate-lines nil "Create a hydra with no body and the heads:

\"t\":    `toggle-truncate-lines',
\"f\":    `auto-fill-mode',
\"a\":    `abbrev-mode',
\"q\":    `nil'

The body can be accessed via `hydra-toggle/body'.

Call the head: `toggle-truncate-lines'."
             (interactive)
             (hydra-disable)
             (hydra-cleanup)
             (catch (quote hydra-disable)
               (call-interactively (function toggle-truncate-lines))))
      (defun hydra-toggle/auto-fill-mode nil "Create a hydra with no body and the heads:

\"t\":    `toggle-truncate-lines',
\"f\":    `auto-fill-mode',
\"a\":    `abbrev-mode',
\"q\":    `nil'

The body can be accessed via `hydra-toggle/body'.

Call the head: `auto-fill-mode'."
             (interactive)
             (hydra-disable)
             (hydra-cleanup)
             (catch (quote hydra-disable)
               (call-interactively (function auto-fill-mode))))
      (defun hydra-toggle/abbrev-mode nil "Create a hydra with no body and the heads:

\"t\":    `toggle-truncate-lines',
\"f\":    `auto-fill-mode',
\"a\":    `abbrev-mode',
\"q\":    `nil'

The body can be accessed via `hydra-toggle/body'.

Call the head: `abbrev-mode'."
             (interactive)
             (hydra-disable)
             (hydra-cleanup)
             (catch (quote hydra-disable)
               (call-interactively (function abbrev-mode))))
      (defun hydra-toggle/nil nil "Create a hydra with no body and the heads:

\"t\":    `toggle-truncate-lines',
\"f\":    `auto-fill-mode',
\"a\":    `abbrev-mode',
\"q\":    `nil'

The body can be accessed via `hydra-toggle/body'.

Call the head: `nil'."
             (interactive)
             (hydra-disable)
             (hydra-cleanup)
             (catch (quote hydra-disable)))
      (defun hydra-toggle/hint nil
        (if hydra-lv (lv-message (format #("toggle: [t]: truncate, [f]: fill, [a]: abbrev, [q]: cancel." 9 10 (face hydra-face-blue)
                                           24 25 (face hydra-face-blue)
                                           35 36 (face hydra-face-blue)
                                           48 49 (face hydra-face-blue))))
          (message (format #("toggle: [t]: truncate, [f]: fill, [a]: abbrev, [q]: cancel." 9 10 (face hydra-face-blue)
                             24 25 (face hydra-face-blue)
                             35 36 (face hydra-face-blue)
                             48 49 (face hydra-face-blue))))))
      (defun hydra-toggle/body nil "Create a hydra with no body and the heads:

\"t\":    `toggle-truncate-lines',
\"f\":    `auto-fill-mode',
\"a\":    `abbrev-mode',
\"q\":    `nil'

The body can be accessed via `hydra-toggle/body'."
             (interactive)
             (hydra-disable)
             (catch (quote hydra-disable)
               (when hydra-is-helpful (hydra-toggle/hint))
               (setq hydra-last
                     (hydra-set-transient-map
                      (setq hydra-curr-map
                            (quote
                             (keymap (113 . hydra-toggle/nil)
                                     (97 . hydra-toggle/abbrev-mode)
                                     (102 . hydra-toggle/auto-fill-mode)
                                     (116 . hydra-toggle/toggle-truncate-lines)
                                     (kp-subtract . hydra--negative-argument)
                                     (kp-9 . hydra--digit-argument)
                                     (kp-8 . hydra--digit-argument)
                                     (kp-7 . hydra--digit-argument)
                                     (kp-6 . hydra--digit-argument)
                                     (kp-5 . hydra--digit-argument)
                                     (kp-4 . hydra--digit-argument)
                                     (kp-3 . hydra--digit-argument)
                                     (kp-2 . hydra--digit-argument)
                                     (kp-1 . hydra--digit-argument)
                                     (kp-0 . hydra--digit-argument)
                                     (57 . hydra--digit-argument)
                                     (56 . hydra--digit-argument)
                                     (55 . hydra--digit-argument)
                                     (54 . hydra--digit-argument)
                                     (53 . hydra--digit-argument)
                                     (52 . hydra--digit-argument)
                                     (51 . hydra--digit-argument)
                                     (50 . hydra--digit-argument)
                                     (49 . hydra--digit-argument)
                                     (48 . hydra--digit-argument)
                                     (45 . hydra--negative-argument)
                                     (21 . hydra--universal-argument))))
                      t (lambda nil (hydra-cleanup))))
               (setq prefix-arg current-prefix-arg)))))))

(ert-deftest hydra-amaranth-vi ()
  (unless (version< emacs-version "24.4")
    (should
     (equal
      (macroexpand
       '(defhydra hydra-vi
         (:pre
          (set-cursor-color "#e52b50")
          :post
          (set-cursor-color "#ffffff")
          :color amaranth)
         "vi"
         ("j" next-line)
         ("k" previous-line)
         ("q" nil "quit")))
      '(progn
        (defun hydra-vi/next-line nil "Create a hydra with no body and the heads:

\"j\":    `next-line',
\"k\":    `previous-line',
\"q\":    `nil'

The body can be accessed via `hydra-vi/body'.

Call the head: `next-line'."
               (interactive)
               (set-cursor-color "#e52b50")
               (hydra-disable)
               (catch (quote hydra-disable)
                 (condition-case err (prog1 t (call-interactively (function next-line)))
                   ((quit error) (message "%S" err)
                    (unless hydra-lv (sit-for 0.8))
                    nil))
                 (when hydra-is-helpful (hydra-vi/hint))
                 (setq hydra-last
                       (hydra-set-transient-map
                        (setq hydra-curr-map
                              (quote
                               (keymap (7 lambda nil (interactive)
                                          (hydra-disable)
                                          (hydra-cleanup)
                                          (set-cursor-color "#ffffff"))
                                       (t lambda nil (interactive)
                                          (message "An amaranth Hydra can only exit through a blue head")
                                          (hydra-set-transient-map hydra-curr-map t)
                                          (when hydra-is-helpful (unless hydra-lv (sit-for 0.8))
                                                (hydra-vi/hint)))
                                       (113 . hydra-vi/nil)
                                       (107 . hydra-vi/previous-line)
                                       (106 . hydra-vi/next-line)
                                       (kp-subtract . hydra--negative-argument)
                                       (kp-9 . hydra--digit-argument)
                                       (kp-8 . hydra--digit-argument)
                                       (kp-7 . hydra--digit-argument)
                                       (kp-6 . hydra--digit-argument)
                                       (kp-5 . hydra--digit-argument)
                                       (kp-4 . hydra--digit-argument)
                                       (kp-3 . hydra--digit-argument)
                                       (kp-2 . hydra--digit-argument)
                                       (kp-1 . hydra--digit-argument)
                                       (kp-0 . hydra--digit-argument)
                                       (57 . hydra--digit-argument)
                                       (56 . hydra--digit-argument)
                                       (55 . hydra--digit-argument)
                                       (54 . hydra--digit-argument)
                                       (53 . hydra--digit-argument)
                                       (52 . hydra--digit-argument)
                                       (51 . hydra--digit-argument)
                                       (50 . hydra--digit-argument)
                                       (49 . hydra--digit-argument)
                                       (48 . hydra--digit-argument)
                                       (45 . hydra--negative-argument)
                                       (21 . hydra--universal-argument))))
                        t (lambda nil (hydra-cleanup))))))
        (defun hydra-vi/previous-line nil "Create a hydra with no body and the heads:

\"j\":    `next-line',
\"k\":    `previous-line',
\"q\":    `nil'

The body can be accessed via `hydra-vi/body'.

Call the head: `previous-line'."
               (interactive)
               (set-cursor-color "#e52b50")
               (hydra-disable)
               (catch (quote hydra-disable)
                 (condition-case err (prog1 t (call-interactively (function previous-line)))
                   ((quit error) (message "%S" err)
                    (unless hydra-lv (sit-for 0.8))
                    nil))
                 (when hydra-is-helpful (hydra-vi/hint))
                 (setq hydra-last
                       (hydra-set-transient-map
                        (setq hydra-curr-map
                              (quote
                               (keymap (7 lambda nil (interactive)
                                          (hydra-disable)
                                          (hydra-cleanup)
                                          (set-cursor-color "#ffffff"))
                                       (t lambda nil (interactive)
                                          (message "An amaranth Hydra can only exit through a blue head")
                                          (hydra-set-transient-map hydra-curr-map t)
                                          (when hydra-is-helpful (unless hydra-lv (sit-for 0.8))
                                                (hydra-vi/hint)))
                                       (113 . hydra-vi/nil)
                                       (107 . hydra-vi/previous-line)
                                       (106 . hydra-vi/next-line)
                                       (kp-subtract . hydra--negative-argument)
                                       (kp-9 . hydra--digit-argument)
                                       (kp-8 . hydra--digit-argument)
                                       (kp-7 . hydra--digit-argument)
                                       (kp-6 . hydra--digit-argument)
                                       (kp-5 . hydra--digit-argument)
                                       (kp-4 . hydra--digit-argument)
                                       (kp-3 . hydra--digit-argument)
                                       (kp-2 . hydra--digit-argument)
                                       (kp-1 . hydra--digit-argument)
                                       (kp-0 . hydra--digit-argument)
                                       (57 . hydra--digit-argument)
                                       (56 . hydra--digit-argument)
                                       (55 . hydra--digit-argument)
                                       (54 . hydra--digit-argument)
                                       (53 . hydra--digit-argument)
                                       (52 . hydra--digit-argument)
                                       (51 . hydra--digit-argument)
                                       (50 . hydra--digit-argument)
                                       (49 . hydra--digit-argument)
                                       (48 . hydra--digit-argument)
                                       (45 . hydra--negative-argument)
                                       (21 . hydra--universal-argument))))
                        t (lambda nil (hydra-cleanup))))))
        (defun hydra-vi/nil nil "Create a hydra with no body and the heads:

\"j\":    `next-line',
\"k\":    `previous-line',
\"q\":    `nil'

The body can be accessed via `hydra-vi/body'.

Call the head: `nil'."
               (interactive)
               (set-cursor-color "#e52b50")
               (hydra-disable)
               (hydra-cleanup)
               (catch (quote hydra-disable)
                 (set-cursor-color "#ffffff")))
        (defun hydra-vi/hint nil
          (if hydra-lv (lv-message (format #("vi: j, k, [q]: quit." 4 5 (face hydra-face-amaranth)
                                             7 8 (face hydra-face-amaranth)
                                             11 12 (face hydra-face-blue))))
            (message (format #("vi: j, k, [q]: quit." 4 5 (face hydra-face-amaranth)
                               7 8 (face hydra-face-amaranth)
                               11 12 (face hydra-face-blue))))))
        (defun hydra-vi/body nil "Create a hydra with no body and the heads:

\"j\":    `next-line',
\"k\":    `previous-line',
\"q\":    `nil'

The body can be accessed via `hydra-vi/body'."
               (interactive)
               (set-cursor-color "#e52b50")
               (hydra-disable)
               (catch (quote hydra-disable)
                 (when hydra-is-helpful (hydra-vi/hint))
                 (setq hydra-last
                       (hydra-set-transient-map
                        (setq hydra-curr-map
                              (quote
                               (keymap (7 lambda nil (interactive)
                                          (hydra-disable)
                                          (hydra-cleanup)
                                          (set-cursor-color "#ffffff"))
                                       (t lambda nil (interactive)
                                          (message "An amaranth Hydra can only exit through a blue head")
                                          (hydra-set-transient-map hydra-curr-map t)
                                          (when hydra-is-helpful (unless hydra-lv (sit-for 0.8))
                                                (hydra-vi/hint)))
                                       (113 . hydra-vi/nil)
                                       (107 . hydra-vi/previous-line)
                                       (106 . hydra-vi/next-line)
                                       (kp-subtract . hydra--negative-argument)
                                       (kp-9 . hydra--digit-argument)
                                       (kp-8 . hydra--digit-argument)
                                       (kp-7 . hydra--digit-argument)
                                       (kp-6 . hydra--digit-argument)
                                       (kp-5 . hydra--digit-argument)
                                       (kp-4 . hydra--digit-argument)
                                       (kp-3 . hydra--digit-argument)
                                       (kp-2 . hydra--digit-argument)
                                       (kp-1 . hydra--digit-argument)
                                       (kp-0 . hydra--digit-argument)
                                       (57 . hydra--digit-argument)
                                       (56 . hydra--digit-argument)
                                       (55 . hydra--digit-argument)
                                       (54 . hydra--digit-argument)
                                       (53 . hydra--digit-argument)
                                       (52 . hydra--digit-argument)
                                       (51 . hydra--digit-argument)
                                       (50 . hydra--digit-argument)
                                       (49 . hydra--digit-argument)
                                       (48 . hydra--digit-argument)
                                       (45 . hydra--negative-argument)
                                       (21 . hydra--universal-argument))))
                        t (lambda nil (hydra-cleanup))))
                 (setq prefix-arg current-prefix-arg))))))))

(ert-deftest defhydradio ()
  (should (equal
           (macroexpand
            '(defhydradio hydra-test ()
              (num [0 1 2 3 4 5 6 7 8 9 10])
              (str ["foo" "bar" "baz"])))
           '(progn
             (defvar hydra-test/num 0
               "Num")
             (put 'hydra-test/num 'range [0 1 2 3 4 5 6 7 8 9 10])
             (defun hydra-test/num ()
               (hydra--cycle-radio 'hydra-test/num))
             (defvar hydra-test/str "foo"
               "Str")
             (put 'hydra-test/str 'range ["foo" "bar" "baz"])
             (defun hydra-test/str ()
               (hydra--cycle-radio 'hydra-test/str))
             (defun hydra-test/reset-radios ()
               (setq hydra-test/num 0)
               (setq hydra-test/str "foo"))))))

(ert-deftest hydra-blue-compat ()
  (should
   (equal
    (macroexpand
     '(defhydra hydra-toggle (:color blue)
       "toggle"
       ("t" toggle-truncate-lines "truncate")
       ("f" auto-fill-mode "fill")
       ("a" abbrev-mode "abbrev")
       ("q" nil "cancel")))
    (macroexpand
     '(defhydra hydra-toggle (:exit t)
       "toggle"
       ("t" toggle-truncate-lines "truncate")
       ("f" auto-fill-mode "fill")
       ("a" abbrev-mode "abbrev")
       ("q" nil "cancel"))))))

(ert-deftest hydra-amaranth-compat ()
  (unless (version< emacs-version "24.4")
    (should
     (equal
      (macroexpand
       '(defhydra hydra-vi
         (:pre
          (set-cursor-color "#e52b50")
          :post
          (set-cursor-color "#ffffff")
          :color amaranth)
         "vi"
         ("j" next-line)
         ("k" previous-line)
         ("q" nil "quit")))
      (macroexpand
       '(defhydra hydra-vi
         (:pre
          (set-cursor-color "#e52b50")
          :post
          (set-cursor-color "#ffffff")
          :nonheads warn)
         "vi"
         ("j" next-line)
         ("k" previous-line)
         ("q" nil "quit")))))))

(ert-deftest hydra-pink-compat ()
  (should
   (equal
    (macroexpand
     '(defhydra hydra-zoom (global-map "<f2>"
                            :color pink)
       "zoom"
       ("g" text-scale-increase "in")
       ("l" text-scale-decrease "out")
       ("q" nil "quit")))
    (macroexpand
     '(defhydra hydra-zoom (global-map "<f2>"
                            :nonheads run)
       "zoom"
       ("g" text-scale-increase "in")
       ("l" text-scale-decrease "out")
       ("q" nil "quit"))))))

(ert-deftest hydra-teal-compat ()
  (should
   (equal
    (macroexpand
     '(defhydra hydra-zoom (global-map "<f2>"
                            :color teal)
       "zoom"
       ("g" text-scale-increase "in")
       ("l" text-scale-decrease "out")
       ("q" nil "quit")))
    (macroexpand
     '(defhydra hydra-zoom (global-map "<f2>"
                            :nonheads warn
                            :exit t)
       "zoom"
       ("g" text-scale-increase "in")
       ("l" text-scale-decrease "out")
       ("q" nil "quit"))))))

(ert-deftest hydra-format ()
  (should (equal
           (let ((hydra-fontify-head-function
                  'hydra-fontify-head-greyscale))
             (hydra--format
              'hydra-toggle
              nil
              "
_a_ abbrev-mode:       %`abbrev-mode
_d_ debug-on-error:    %`debug-on-error
_f_ auto-fill-mode:    %`auto-fill-function
" '(("a" abbrev-mode nil)
    ("d" toggle-debug-on-error nil)
    ("f" auto-fill-mode nil)
    ("g" golden-ratio-mode nil)
    ("t" toggle-truncate-lines nil)
    ("w" whitespace-mode nil)
    ("q" nil "quit"))))
           '(concat (format "% 3s abbrev-mode:       %S
% 3s debug-on-error:    %S
% 3s auto-fill-mode:    %S
" "{a}" abbrev-mode "{d}" debug-on-error "{f}" auto-fill-function) "[[q]]: quit"))))

(ert-deftest hydra-format-with-sexp ()
  (should (equal
           (let ((hydra-fontify-head-function
                  'hydra-fontify-head-greyscale))
             (hydra--format
              'hydra-toggle nil
              "\n_n_ narrow-or-widen-dwim %(progn (message \"checking\")(buffer-narrowed-p))asdf\n"
              '(("n" narrow-to-region nil) ("q" nil "cancel"))))
           '(concat (format "% 3s narrow-or-widen-dwim %Sasdf\n"
                     "{n}"
                     (progn
                       (message "checking")
                       (buffer-narrowed-p)))
             "[[q]]: cancel"))))

(provide 'hydra-test)

;;; hydra-test.el ends here
