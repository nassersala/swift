// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=NIL_0 | FileCheck %s -check-prefix=NIL_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=NIL_1 | FileCheck %s -check-prefix=NIL_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=NIL_2 | FileCheck %s -check-prefix=NIL_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=BOOL_0 | FileCheck %s -check-prefix=BOOL_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=BOOL_1 | FileCheck %s -check-prefix=BOOL_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=BOOL_2 | FileCheck %s -check-prefix=BOOL_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=INT_0 | FileCheck %s -check-prefix=INT_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=INT_1 | FileCheck %s -check-prefix=INT_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=INT_2 | FileCheck %s -check-prefix=INT_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DOUBLE_0 | FileCheck %s -check-prefix=DOUBLE_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DOUBLE_1 | FileCheck %s -check-prefix=DOUBLE_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DOUBLE_2 | FileCheck %s -check-prefix=DOUBLE_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=STRING_0 | FileCheck %s -check-prefix=STRING_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=STRING_1 | FileCheck %s -check-prefix=STRING_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=STRING_2 | FileCheck %s -check-prefix=STRING_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=ARRAY_0 | FileCheck %s -check-prefix=ARRAY_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=ARRAY_1 | FileCheck %s -check-prefix=ARRAY_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=ARRAY_2 | FileCheck %s -check-prefix=ARRAY_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DICT_0 | FileCheck %s -check-prefix=DICT_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DICT_1 | FileCheck %s -check-prefix=DICT_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=DICT_2 | FileCheck %s -check-prefix=DICT_2
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=TUPLE_0 | FileCheck %s -check-prefix=TUPLE_0
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=TUPLE_1 | FileCheck %s -check-prefix=TUPLE_1
// RUN: %target-swift-ide-test -code-completion -source-filename=%s -code-completion-token=TUPLE_2 | FileCheck %s -check-prefix=TUPLE_2

struct MyNil1: NilLiteralConvertible {
  init(nilLiteral: ()) {}
}
struct MyBool1: BooleanLiteralConvertible {
  init(booleanLiteral value: Bool) {}
}
struct MyInt1: IntegerLiteralConvertible {
  init(integerLiteral value: Int) {}
}
struct MyDouble1: FloatLiteralConvertible {
  init(floatLiteral value: Double) {}
}
struct MyString1: StringLiteralConvertible {
  init(unicodeScalarLiteral value: Character) {}
  init(extendedGraphemeClusterLiteral value: String) {}
  init(stringLiteral value: String) {}
}
struct MyArray1<Element>: ArrayLiteralConvertible {
  init(arrayLiteral value: Element...) {}
}
struct MyDict1<Key, Value>: DictionaryLiteralConvertible {
  init(dictionaryLiteral elements: (Key, Value)...) {}
}

extension MyInt1: Equatable, Hashable {
  var hashValue: Int { return 1 }
}
func ==(_: MyInt1, _: MyInt1) -> Bool { return true }

func testNil0() {
  let x: Int = #^NIL_0^#
}
// NIL_0: Keyword/None: nil;

func testNil1() {
  let x: MyNil1 = #^NIL_1^#
}
// NIL_1: Keyword/None/TypeRelation[Identical]: nil[#MyNil1#];

func testNil2() {
  let x: Int? = #^NIL_2^#
}
// NIL_2: Keyword/None/TypeRelation[Identical]: nil[#Int?#];

func testBool0() {
  let x: Int = #^BOOL_0^#
}
// BOOL_0: Keyword/None: true[#Bool#];
// BOOL_0: Keyword/None: false[#Bool#];

func testBool1() {
  let x: MyBool1 = #^BOOL_1^#
}
// BOOL_1: Keyword/None/TypeRelation[Identical]: true[#MyBool1#];
// BOOL_1: Keyword/None/TypeRelation[Identical]: false[#MyBool1#];

func testBool2() {
  let x: Bool = #^BOOL_2^#
}
// BOOL_2: Keyword/None/TypeRelation[Identical]: true[#Bool#];
// BOOL_2: Keyword/None/TypeRelation[Identical]: false[#Bool#];

func testInt0() {
  let x: Bool = #^INT_0^#
}
// INT_0: Pattern/None: 0[#Int#];

func testInt1() {
  let x: MyInt1 = #^INT_1^#
}
// INT_1: Pattern/None/TypeRelation[Identical]: 0[#MyInt1#];

func testInt2() {
  let x: Int = #^INT_2^#
}
// INT_2: Pattern/None/TypeRelation[Identical]: 0[#Int#];

func testDouble0() {
  let x: Int = #^DOUBLE_0^#
}
// DOUBLE_0: Pattern/None: 0.0[#Double#];

func testDouble1() {
  let x: MyDouble1 = #^DOUBLE_1^#
}
// DOUBLE_1: Pattern/None/TypeRelation[Identical]: 0.0[#MyDouble1#];

func testDouble2() {
  let x: Double = #^DOUBLE_2^#
}
// DOUBLE_2: Pattern/None/TypeRelation[Identical]: 0.0[#Double#];

func testString0() {
  let x: Int = #^STRING_0^#
}
// STRING_0: Pattern/None: "{#text#}"[#String#];

func testString1() {
  let x: MyString1 = #^STRING_1^#
}
// STRING_1: Pattern/None/TypeRelation[Identical]: "{#text#}"[#MyString1#];

func testString2() {
  let x: String = #^STRING_2^#
}
// STRING_2: Pattern/None/TypeRelation[Identical]: "{#text#}"[#String#];

func testArray0() {
  let x: Int = #^ARRAY_0^#
}
// ARRAY_0: Pattern/None: [{#item#}][#Array#];

func testArray1() {
  let x: MyArray1<MyInt1> = #^ARRAY_1^#
}
// ARRAY_1: Pattern/None/TypeRelation[Identical]: [{#item#}][#MyArray1<MyInt1>#];

func testArray2() {
  let x: [MyInt1] = #^ARRAY_2^#
}
// ARRAY_2: Pattern/None/TypeRelation[Identical]: [{#item#}][#[MyInt1]#];

func testDict0() {
  let x: Int = #^DICT_0^#
}
// DICT_0: Pattern/None: [{#key#}: {#value#}][#Dictionary#];

func testDict1() {
  let x: MyDict1<MyInt1, MyString1> = #^DICT_1^#
}
// DICT_1: Pattern/None/TypeRelation[Identical]: [{#key#}: {#value#}][#MyDict1<MyInt1, MyString1>#];

func testDict2() {
  let x: [MyInt1: MyString1] = #^DICT_2^#
}
// DICT_2: Pattern/None/TypeRelation[Identical]: [{#key#}: {#value#}][#[MyInt1 : MyString1]#];

func testTuple0() {
  let x: Int = #^TUPLE_0^#
}
// TUPLE_0: Pattern/None: ({#item#}, {#item#});

func testTuple1() {
  let x: (MyInt1, MyString1) = #^TUPLE_1^#
}
// TUPLE_1: Pattern/None/TypeRelation[Identical]: ({#item#}, {#item#})[#(MyInt1, MyString1)#];

func testTuple2() {
  let x: (MyInt1, MyString1, MyDouble1) = #^TUPLE_2^#
}
// FIXME: should we extend the tuple to have the right number of elements?
// TUPLE_2: Pattern/None/TypeRelation[Identical]: ({#item#}, {#item#})[#(MyInt1, MyString1, MyDouble1)#];