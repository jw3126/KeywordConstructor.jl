# KeywordConstructor

usage

```
julia> type Foo
    a
    b
end
julia> using KeywordConstructor
julia> @keyword_constructor Foo
Foo
julia> Foo(b=2, a=1)
Foo(1, 2)
```
