module KeywordConstructor


export @keyword_constructor

function check_same_elements(iter1, iter2)
    for e1 in iter1
        (e1 in iter2) || return false
    end
    for e2 in iter2
        (e2 in iter1) || return false
    end
    return true
end

function from_keywords{T}(::Type{T}, kw)
    fn = fieldnames(T)
    typs = T.types
    if !check_same_elements(keys(kw), fn)
        error("fieldnames($T) = $fn but keywords $(keys(kw)) were given.")
    end
    args = [S(kw[name]) for (S, name) in zip(typs, fn)]
    T(args...)
end

from_keywords{T}(::Type{T}; kw...) = from_keywords(T, Dict(kw))
# to_keywords(x) = Dict(f => getfield(x, f) for f in fieldnames(typeof(x)))


keyword_constructor_impl(T) = :( ($T)(;kw...) = KeywordConstructor.from_keywords(($T); kw...) )

macro keyword_constructor(T)
    T |> keyword_constructor_impl |> esc
end

end # module
