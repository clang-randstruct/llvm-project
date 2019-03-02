//===----- RecordFieldReorganizer.cpp - Implementation for field reorder -*- C++
//-*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
//
// Contains the implementation for RecordDecl field reordering.
//
//===----------------------------------------------------------------------===//

#include "clang/AST/RandstructSeed.h"

namespace clang {
std::string RandstructSeed = "";
bool RandstructAutoSelect = false;
} // namespace clang
