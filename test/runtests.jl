using KeywordConstructor
using Base.Test

immutable Foo
    a :: Float64
    b
end

@keyword_constructor Foo

obj = Foo(b=4, a=2)
@test obj.a == 2
@test obj.b == 4
