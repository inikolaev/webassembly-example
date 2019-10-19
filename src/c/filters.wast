(module
 (type $FUNCSIG$ff (func (param f32) (result f32)))
 (import "env" "js_exp" (func $js_exp (param f32) (result f32)))
 (import "env" "memory" (memory $0 1))
 (table 0 anyfunc)
 (data (i32.const 12) "\d0\0fI@")
 (export "rnd" (func $rnd))
 (export "min" (func $min))
 (export "max" (func $max))
 (export "wasm_invert" (func $wasm_invert))
 (export "wasm_grayscale_averaging" (func $wasm_grayscale_averaging))
 (export "wasm_grayscale_luminance" (func $wasm_grayscale_luminance))
 (export "wasm_grayscale_desaturation" (func $wasm_grayscale_desaturation))
 (export "wasm_grayscale_decomposition_min" (func $wasm_grayscale_decomposition_min))
 (export "wasm_grayscale_decomposition_max" (func $wasm_grayscale_decomposition_max))
 (export "wasm_grayscale_dithering" (func $wasm_grayscale_dithering))
 (export "wasm_gaussian_blur" (func $wasm_gaussian_blur))
 (func $rnd (param $0 f32) (result i32)
  (local $1 i32)
  (i32.add
   (f32.ge
    (f32.sub
     (get_local $0)
     (f32.convert_s/i32
      (tee_local $1
       (i32.trunc_s/f32
        (get_local $0)
       )
      )
     )
    )
    (f32.const 0.5)
   )
   (get_local $1)
  )
 )
 (func $min (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (select
   (tee_local $0
    (select
     (get_local $0)
     (get_local $1)
     (i32.lt_u
      (get_local $0)
      (get_local $1)
     )
    )
   )
   (get_local $2)
   (i32.lt_u
    (get_local $0)
    (get_local $2)
   )
  )
 )
 (func $max (param $0 i32) (param $1 i32) (param $2 i32) (result i32)
  (select
   (get_local $2)
   (tee_local $0
    (select
     (get_local $1)
     (get_local $0)
     (i32.lt_u
      (get_local $0)
      (get_local $1)
     )
    )
   )
   (i32.lt_u
    (get_local $0)
    (get_local $2)
   )
  )
 )
 (func $wasm_invert (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (i32.xor
      (i32.load8_u
       (get_local $1)
      )
      (i32.const -1)
     )
    )
    (i32.store8
     (tee_local $4
      (i32.add
       (get_local $1)
       (i32.const 1)
      )
     )
     (i32.xor
      (i32.load8_u
       (get_local $4)
      )
      (i32.const -1)
     )
    )
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $1)
       (i32.const 2)
      )
     )
     (i32.xor
      (i32.load8_u
       (get_local $1)
      )
      (i32.const -1)
     )
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_averaging (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (tee_local $1
      (i32.div_u
       (i32.add
        (i32.add
         (i32.load8_u
          (tee_local $4
           (i32.add
            (get_local $1)
            (i32.const 1)
           )
          )
         )
         (i32.load8_u
          (get_local $1)
         )
        )
        (i32.load8_u
         (tee_local $5
          (i32.add
           (get_local $1)
           (i32.const 2)
          )
         )
        )
       )
       (i32.const 3)
      )
     )
    )
    (i32.store8
     (get_local $4)
     (get_local $1)
    )
    (i32.store8
     (get_local $5)
     (get_local $1)
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_luminance (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (tee_local $1
      (i32.trunc_u/f64
       (f64.add
        (f64.add
         (f64.mul
          (f64.convert_u/i32
           (i32.load8_u
            (get_local $1)
           )
          )
          (f64.const 0.3)
         )
         (f64.mul
          (f64.convert_u/i32
           (i32.load8_u
            (tee_local $4
             (i32.add
              (get_local $1)
              (i32.const 1)
             )
            )
           )
          )
          (f64.const 0.59)
         )
        )
        (f64.mul
         (f64.convert_u/i32
          (i32.load8_u
           (tee_local $5
            (i32.add
             (get_local $1)
             (i32.const 2)
            )
           )
          )
         )
         (f64.const 0.11)
        )
       )
      )
     )
    )
    (i32.store8
     (get_local $4)
     (get_local $1)
    )
    (i32.store8
     (get_local $5)
     (get_local $1)
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_desaturation (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (tee_local $1
      (i32.shr_u
       (i32.add
        (select
         (tee_local $9
          (select
           (tee_local $4
            (i32.load8_u
             (get_local $1)
            )
           )
           (tee_local $6
            (i32.load8_u
             (tee_local $5
              (i32.add
               (get_local $1)
               (i32.const 1)
              )
             )
            )
           )
           (tee_local $7
            (i32.lt_u
             (get_local $4)
             (get_local $6)
            )
           )
          )
         )
         (tee_local $1
          (i32.load8_u
           (tee_local $8
            (i32.add
             (get_local $1)
             (i32.const 2)
            )
           )
          )
         )
         (i32.lt_u
          (get_local $9)
          (get_local $1)
         )
        )
        (select
         (get_local $1)
         (tee_local $4
          (select
           (get_local $6)
           (get_local $4)
           (get_local $7)
          )
         )
         (i32.lt_u
          (get_local $4)
          (get_local $1)
         )
        )
       )
       (i32.const 1)
      )
     )
    )
    (i32.store8
     (get_local $5)
     (get_local $1)
    )
    (i32.store8
     (get_local $8)
     (get_local $1)
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_decomposition_min (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (tee_local $1
      (select
       (tee_local $4
        (select
         (tee_local $4
          (i32.load8_u
           (get_local $1)
          )
         )
         (tee_local $6
          (i32.load8_u
           (tee_local $5
            (i32.add
             (get_local $1)
             (i32.const 1)
            )
           )
          )
         )
         (i32.lt_u
          (get_local $4)
          (get_local $6)
         )
        )
       )
       (tee_local $1
        (i32.load8_u
         (tee_local $6
          (i32.add
           (get_local $1)
           (i32.const 2)
          )
         )
        )
       )
       (i32.lt_u
        (get_local $4)
        (get_local $1)
       )
      )
     )
    )
    (i32.store8
     (get_local $5)
     (get_local $1)
    )
    (i32.store8
     (get_local $6)
     (get_local $1)
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_decomposition_max (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (tee_local $3
      (i32.shl
       (i32.mul
        (get_local $1)
        (get_local $2)
       )
       (i32.const 2)
      )
     )
     (i32.const 1)
    )
   )
   (set_local $2
    (i32.const 0)
   )
   (loop $label$1
    (i32.store8
     (tee_local $1
      (i32.add
       (get_local $0)
       (get_local $2)
      )
     )
     (tee_local $1
      (select
       (tee_local $7
        (i32.load8_u
         (tee_local $6
          (i32.add
           (get_local $1)
           (i32.const 2)
          )
         )
        )
       )
       (tee_local $1
        (select
         (tee_local $5
          (i32.load8_u
           (tee_local $4
            (i32.add
             (get_local $1)
             (i32.const 1)
            )
           )
          )
         )
         (tee_local $1
          (i32.load8_u
           (get_local $1)
          )
         )
         (i32.lt_u
          (get_local $1)
          (get_local $5)
         )
        )
       )
       (i32.lt_u
        (get_local $1)
        (get_local $7)
       )
      )
     )
    )
    (i32.store8
     (get_local $4)
     (get_local $1)
    )
    (i32.store8
     (get_local $6)
     (get_local $1)
    )
    (br_if $label$1
     (i32.lt_s
      (tee_local $2
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (get_local $3)
     )
    )
   )
  )
 )
 (func $wasm_grayscale_dithering (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 f32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (set_local $3
   (i32.shl
    (i32.mul
     (get_local $1)
     (get_local $2)
    )
    (i32.const 2)
   )
  )
  (set_local $11
   (i32.const 0)
  )
  (loop $label$0
   (i32.store8
    (i32.add
     (get_local $3)
     (get_local $11)
    )
    (i32.div_u
     (get_local $11)
     (i32.const 3)
    )
   )
   (br_if $label$0
    (i32.ne
     (tee_local $11
      (i32.add
       (get_local $11)
       (i32.const 1)
      )
     )
     (i32.const 766)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.lt_s
     (get_local $2)
     (i32.const 1)
    )
   )
   (br_if $label$1
    (i32.lt_s
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $4
    (i32.shl
     (get_local $1)
     (i32.const 2)
    )
   )
   (set_local $9
    (i32.add
     (get_local $0)
     (i32.const 2)
    )
   )
   (set_local $10
    (i32.const 0)
   )
   (loop $label$2
    (set_local $11
     (get_local $9)
    )
    (set_local $12
     (get_local $1)
    )
    (set_local $0
     (i32.const 0)
    )
    (loop $label$3
     (i32.store8
      (tee_local $8
       (i32.add
        (get_local $11)
        (i32.const -2)
       )
      )
      (tee_local $8
       (select
        (i32.const -1)
        (select
         (tee_local $0
          (i32.add
           (tee_local $8
            (i32.mul
             (i32.add
              (f32.ge
               (f32.sub
                (tee_local $7
                 (f32.convert_s/i32
                  (i32.div_s
                   (tee_local $6
                    (i32.add
                     (get_local $0)
                     (i32.load8_u
                      (i32.add
                       (get_local $3)
                       (i32.add
                        (i32.add
                         (i32.load8_u
                          (tee_local $5
                           (i32.add
                            (get_local $11)
                            (i32.const -1)
                           )
                          )
                         )
                         (i32.load8_u
                          (get_local $8)
                         )
                        )
                        (i32.load8_u
                         (get_local $11)
                        )
                       )
                      )
                     )
                    )
                   )
                   (i32.const 17)
                  )
                 )
                )
                (f32.convert_s/i32
                 (tee_local $0
                  (i32.trunc_s/f32
                   (get_local $7)
                  )
                 )
                )
               )
               (f32.const 0.5)
              )
              (get_local $0)
             )
             (i32.const 17)
            )
           )
           (i32.const 8)
          )
         )
         (i32.const 0)
         (i32.gt_s
          (get_local $0)
          (i32.const 0)
         )
        )
        (i32.gt_s
         (get_local $8)
         (i32.const 247)
        )
       )
      )
     )
     (i32.store8
      (get_local $5)
      (get_local $8)
     )
     (i32.store8
      (get_local $11)
      (get_local $8)
     )
     (set_local $0
      (i32.sub
       (get_local $6)
       (get_local $0)
      )
     )
     (set_local $11
      (i32.add
       (get_local $11)
       (i32.const 4)
      )
     )
     (br_if $label$3
      (tee_local $12
       (i32.add
        (get_local $12)
        (i32.const -1)
       )
      )
     )
    )
    (set_local $9
     (i32.add
      (get_local $9)
      (get_local $4)
     )
    )
    (br_if $label$2
     (i32.ne
      (tee_local $10
       (i32.add
        (get_local $10)
        (i32.const 1)
       )
      )
      (get_local $2)
     )
    )
   )
  )
 )
 (func $wasm_gaussian_blur (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 f32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 f32)
  (local $14 i32)
  (local $15 i32)
  (local $16 i32)
  (local $17 i32)
  (local $18 f32)
  (local $19 f32)
  (block $label$0
   (br_if $label$0
    (i32.lt_s
     (get_local $2)
     (i32.const 1)
    )
   )
   (br_if $label$0
    (i32.lt_s
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $3
    (f32.mul
     (f32.add
      (tee_local $18
       (f32.load offset=12
        (i32.const 0)
       )
      )
      (get_local $18)
     )
     (f32.const 4)
    )
   )
   (set_local $5
    (i32.and
     (i32.add
      (get_local $2)
      (i32.const 255)
     )
     (i32.const 255)
    )
   )
   (set_local $4
    (i32.and
     (i32.add
      (get_local $1)
      (i32.const 255)
     )
     (i32.const 255)
    )
   )
   (set_local $14
    (i32.const 0)
   )
   (loop $label$1
    (set_local $8
     (i32.add
      (get_local $14)
      (i32.const 6)
     )
    )
    (set_local $7
     (i32.mul
      (get_local $14)
      (get_local $1)
     )
    )
    (set_local $6
     (i32.add
      (get_local $14)
      (i32.const -6)
     )
    )
    (set_local $15
     (i32.const 0)
    )
    (loop $label$2
     (set_local $9
      (i32.add
       (get_local $15)
       (i32.const 6)
      )
     )
     (set_local $18
      (f32.const 0)
     )
     (set_local $16
      (get_local $6)
     )
     (set_local $19
      (f32.const 0)
     )
     (loop $label$3
      (set_local $11
       (i32.mul
        (select
         (get_local $5)
         (tee_local $17
          (i32.and
           (get_local $16)
           (i32.const 255)
          )
         )
         (i32.lt_u
          (get_local $5)
          (get_local $17)
         )
        )
        (get_local $1)
       )
      )
      (set_local $10
       (i32.mul
        (tee_local $17
         (i32.sub
          (get_local $16)
          (get_local $14)
         )
        )
        (get_local $17)
       )
      )
      (set_local $17
       (i32.const 0)
      )
      (loop $label$4
       (set_local $18
        (f32.add
         (get_local $18)
         (f32.mul
          (tee_local $13
           (f32.div
            (call $js_exp
             (f32.convert_s/i32
              (i32.div_s
               (i32.add
                (i32.mul
                 (tee_local $12
                  (i32.add
                   (get_local $17)
                   (i32.const -6)
                  )
                 )
                 (get_local $12)
                )
                (get_local $10)
               )
               (i32.const -4)
              )
             )
            )
            (get_local $3)
           )
          )
          (f32.convert_u/i32
           (i32.load8_u
            (i32.add
             (get_local $0)
             (i32.shl
              (i32.add
               (select
                (get_local $4)
                (tee_local $12
                 (i32.and
                  (i32.add
                   (i32.add
                    (get_local $15)
                    (get_local $17)
                   )
                   (i32.const -6)
                  )
                  (i32.const 255)
                 )
                )
                (i32.lt_u
                 (get_local $4)
                 (get_local $12)
                )
               )
               (get_local $11)
              )
              (i32.const 2)
             )
            )
           )
          )
         )
        )
       )
       (set_local $19
        (f32.add
         (get_local $19)
         (get_local $13)
        )
       )
       (br_if $label$4
        (i32.lt_s
         (i32.add
          (i32.add
           (get_local $15)
           (tee_local $17
            (i32.add
             (get_local $17)
             (i32.const 1)
            )
           )
          )
          (i32.const -7)
         )
         (get_local $9)
        )
       )
      )
      (set_local $17
       (i32.lt_s
        (get_local $16)
        (get_local $8)
       )
      )
      (set_local $16
       (i32.add
        (get_local $16)
        (i32.const 1)
       )
      )
      (br_if $label$3
       (get_local $17)
      )
     )
     (i32.store8
      (i32.add
       (get_local $0)
       (i32.shl
        (i32.add
         (get_local $15)
         (get_local $7)
        )
        (i32.const 2)
       )
      )
      (i32.add
       (f32.ge
        (f32.sub
         (tee_local $18
          (f32.div
           (get_local $18)
           (get_local $19)
          )
         )
         (f32.convert_s/i32
          (tee_local $17
           (i32.trunc_s/f32
            (get_local $18)
           )
          )
         )
        )
        (f32.const 0.5)
       )
       (get_local $17)
      )
     )
     (br_if $label$2
      (i32.ne
       (tee_local $15
        (i32.add
         (get_local $15)
         (i32.const 1)
        )
       )
       (get_local $1)
      )
     )
    )
    (br_if $label$1
     (i32.ne
      (tee_local $14
       (i32.add
        (get_local $14)
        (i32.const 1)
       )
      )
      (get_local $2)
     )
    )
   )
  )
 )
)
