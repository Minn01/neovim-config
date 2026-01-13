local M = {}

function M.Detect_root(server, util)
    if server == "lua_ls" then
        return util.root_pattern(".git", ".luarc.json", ".luarc.jsonc")
    elseif server == "jdtls" then
        return util.root_pattern("build.gradle", "pom.xml", ".git")
    elseif server == "rust_analyzer" then
        return util.root_pattern("Cargo.toml", ".git")
    elseif server == "pyright" then
        return util.root_pattern("pyproject.toml", "setup.py", ".git")
    elseif server == "tsserver" or server == "ts_ls" then
        return util.root_pattern("package.json", "tsconfig.json", ".git")
    end
    return util.find_git_ancestor or vim.loop.cwd()
end

return M
