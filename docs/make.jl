using Documenter, WrapR

makedocs(modules = [WrapR], sitename = "WrapR.jl")

deploydocs(repo = "github.com/azev77/WrapR.jl.git")
