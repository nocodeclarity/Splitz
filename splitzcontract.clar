;; Splitz
;; Cultivated by NoCodeClarity, Inc
;; For the creative executives of the world

(define-data-var authorized-collaborators (list (buff 20)) '(0x0123456789abcdef0123456789abcdef0123456))
(define-data-var max-royalty-amount u256 10000000000000000000)

(define-public (split-royalties royalty-amount collaborator-addresses)
  (if (authorized-collaborator?)
    (let* ((total-collaborators (length collaborator-addresses))
           (royalty-amount-per-collaborator (div royalty-amount total-collaborators)))
      (if (u256-gt royalty-amount max-royalty-amount)
        (err "Royalty amount exceeds maximum allowed")
        (let ((split-results
               (map (lambda (collaborator-address)
                      (ok (tuple collaborator-address royalty-amount-per-collaborator)))
                    collaborator-addresses)))
          (map (lambda (split-tuple)
                 (emit-royalty-split (get-block-info 'tx-sender) (list split-tuple)))
               split-results)
          (ok "Royalties split and emitted successfully")))))
    (err "Sender not authorized to split royalties"))

(define-public (set-authorized-collaborators collaborators)
  (if (authorized-collaborator?)
    (begin
      (setq authorized-collaborators collaborators)
      (ok "Authorized collaborators set successfully"))
    (err "Sender not authorized to set authorized collaborators")))

(define-public (set-max-royalty-amount amount)
  (if (authorized-collaborator?)
    (begin
      (setq max-royalty-amount amount)
      (ok "Maximum royalty amount set successfully"))
    (err "Sender not authorized to set maximum royalty amount")))

(define-private (authorized-collaborator?)
  (some (fn (c) (buff= c (get-block-info 'tx-sender))) authorized-collaborators))

(define-event royalty-split (sender-address (list (tuple address amount))))

(define-public (split-royalties-timed royalty-amount collaborator-addresses duration)
  (if (authorized-collaborator?)
    (let* ((total-collaborators (length collaborator-addresses))
           (royalty-amount-per-collaborator (div royalty-amount total-collaborators))
           (payment-interval (div duration total-collaborators)))
      (if (u256-gt royalty-amount max-royalty-amount)
        (err "Royalty amount exceeds maximum allowed")
        (let ((split-results
               (map (lambda (collaborator-address)
                      (ok (tuple collaborator-address royalty-amount-per-collaborator)))
                    collaborator-addresses)))
          (map (lambda (split-tuple)
                 (emit-royalty-split (get-block-info 'tx-sender) (list split-tuple)))
               split-results)
          (ok "Royalties split and emitted successfully")))))
    (err "Sender not authorized to split royalties")))

