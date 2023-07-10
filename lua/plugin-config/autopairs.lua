local present1, autopairs = pcall(require, "nvim-autopairs")
local present2, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")

if not (present1 or present2) then
    return
end

autopairs.setup({ fast_wrap = {} })
