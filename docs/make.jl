using Documenter, WrappedR

makedocs(modules = [WrappedR], sitename = "WrappedR.jl")

deploydocs(repo = "github.com/azev77/WrappedR.jl.git")
