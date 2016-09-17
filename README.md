# KeywordConstructor

usage

```
type Foo
    a
    b
end

using KeywordConstructor

@keyword_constructor Foo

Foo(a=1, b=2)


```
