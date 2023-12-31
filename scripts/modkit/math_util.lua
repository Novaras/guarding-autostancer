--Math utility functions.

if (modkit == nil) then modkit = {}; end

if (modkit.math == nil) then
	modkit.math = {
		--- Rounds `num` to the nearest N, depending on `numDecimalPlaces`.
		---
		--- By default, rounds to the nearest integer.
		---
		---@param num number
		---@param numDecimalPlaces? integer
		---@return number
		round = function (num, numDecimalPlaces)
			local mult = 10^(numDecimalPlaces or 0)
			return floor(num * mult + 0.5) / mult
		end,
		modulo = function (n, m)
			return n - floor(n / m) * m
		end,
		--- Raises `n` to the integer power `m`.
		---@param n number
		---@param m integer
		---@return number
		pow = function (n, m)
			local out = 1
			for i = 0, m do
				out = out * n
			end
			return out
		end
	}
	print("math_util init")
end