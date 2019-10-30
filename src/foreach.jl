export tforeach;

"""
	tforeach(f::Function, c::AbstractArray)::Nothing

Multi-threaded version of [foreach(f, c)](https://docs.julialang.org/en/v1.2/base/collections/#Base.foreach).
"""
function tforeach(f::Function, c...)::Nothing
	ensureThreaded();
	Threads.@threads for i in minimum(eachindex.(c))
		f(getindex.(c, i)...);
	end
end
