; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu \
; RUN:   -mcpu=pwr8 -ppc-asm-full-reg-names < %s | FileCheck %s
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu \
; RUN:   -mcpu=pwr8 -ppc-asm-full-reg-names < %s | FileCheck %s
define float @floatundisf(i64 %a) {
; CHECK-LABEL: floatundisf:
; CHECK:       # %bb.0: # %entry
; CHECK-NEXT:    xxlxor f1, f1, f1
; CHECK-NEXT:    bclr 12, 4*cr5+lt, 0
; CHECK-NEXT:  # %bb.1: # %sw.epilog
; CHECK-NEXT:    addi r3, r3, 1
; CHECK-NEXT:    li r5, 2
; CHECK-NEXT:    andis. r4, r3, 1024
; CHECK-NEXT:    li r4, 3
; CHECK-NEXT:    isel r4, r5, r4, eq
; CHECK-NEXT:    srd r3, r3, r4
; CHECK-NEXT:    rlwinm r3, r3, 0, 9, 31
; CHECK-NEXT:    mtvsrd f0, r3
; CHECK-NEXT:    xxsldwi vs0, vs0, vs0, 1
; CHECK-NEXT:    xscvspdpn f1, vs0
; CHECK-NEXT:    blr
entry:
  br i1 undef, label %return, label %sw.epilog

sw.epilog:                                        ; preds = %entry
  %or14 = or i64 0, %a
  %inc = add i64 %or14, 1
  %and16 = and i64 %inc, 67108864
  %tobool = icmp eq i64 %and16, 0
  %tmp.select.v = select i1 %tobool, i64 2, i64 3
  %tmp.select = lshr i64 %inc, %tmp.select.v
  %conv26 = trunc i64 %tmp.select to i32
  %and27 = and i32 %conv26, 8388607
  %or28 = or i32 0, %and27
  %0 = bitcast i32 %or28 to float
  br label %return

return:                                           ; preds = %sw.epilog, %entry
  %retval.0 = phi float [ %0, %sw.epilog ], [ 0.000000e+00, %entry ]
  ret float %retval.0
}
