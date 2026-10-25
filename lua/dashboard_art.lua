-- Max Payne character art, without the wordmark below it.
local original = [[
                         ..sSs$$$$$$b.
                       .$$$$$$$$$$$$$$$.
                    .$$$$$$$$$$$$$$$$$$$$$b.
                  .$$$$$$$$$$$$$$$$$$$$$$$$$
                 $$$$$$$$$$$$$$$$$S'   `$$$$
                 $$$$$$$$$$$$$$S'        $$$
                 $$$$$$$$$$$$$'          `$$.
                 `$$$$$$$$$$$$$           `$$$.
                   `$$$$$$$$$'       .s$$$ $$ $
                     $$$$$$$$$.sSs .s$$s"   s s
                      $$$$$$$$$$$$           $P
                      `$$$$$$$$$$$s          $
                        $$$$$$$$$$$.    ",
                        `$$$$$$$$$$sS$
        s$$$.            `$$$$$$$$$$$$.s"'   .$.
        $$$$$.              `$$$$$$$$$$.    .$$$Ss.s$s.
         $$$$$.              `$$$$$$$$$P   .$$$$$$$$$$$$.
         $$$$$$.               `$$$$$$$' .$$$$$$$$$$$$$$$$.
         `$$$$$$.                 $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$s.
           $$$$$$.                `$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$s.
         .s$$$$$$$.                 `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.
         s  $$$$$$$.                .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.
         `$$$$$$$$$$.             .$$$' $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.
          `$$$$$$$$$$.           s$'   $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$.
          $$$$$$$$$$$$e         $$$     `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        .' $$$$$$$$$$7         $$$$       `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
       "   `$$$$$$$$7         $$$$$       .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      $$Ss..$$$$$$$7        $$$$$$$    .s$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
       $$$$$$$$$$$$        $$$$$$$$ .s$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
        $$$$$$$$$$$     .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      .$$$$$$$$$$$$$   .$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      $$$$$$$$$$$$$$  .$$$$$$$$$$$ $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      $$$$$$$$$$$$$$ .$$$$$$$$$$$' `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
      $$$$$$$$$$$$$$ $$$$$$$$$$$$   `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
]]

-- Scale to two-thirds size while keeping the punctuation texture.
local lines = vim.split(original:sub(2, -2), "\n")
local compact = {}


for row, line in ipairs(lines) do
	lines[row] = (line .. string.rep(" ", 76)):sub(1, 76)
end

for row = 1, 23 do
	local pixels = {}
	local first_row = math.floor((row - 1) * 1.5) + 1
	local last_row = math.min(34, math.max(first_row, math.floor(row * 1.5)))
	for col = 1, 51 do
		local first_col = math.floor((col - 1) * 1.5) + 1
		local last_col = math.min(76, math.max(first_col, math.floor(col * 1.5)))
		local character = " "
		for source_row = first_row, last_row do
			for source_col = first_col, last_col do
				local sample = lines[source_row]:sub(source_col, source_col)
				if sample ~= " " then
					character = sample
					break
				end
			end
			if character ~= " " then
				break
			end
		end
		pixels[#pixels + 1] = character
	end
	compact[#compact + 1] = table.concat(pixels)
end

return compact
