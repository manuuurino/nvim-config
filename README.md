# My neovim configs

## setup the repository for development

### git repository

```bash
git clone https://github.com/manuuurino/nvim-config.git
cd nvim-config
```

### git worktree

```bash
git clone --bare https://github.com/manuuurino/nvim-config.git
cd nvim-config
git worktree add --checkout setup setup
git worktree add --checkout astronvim-v3-main astronvim-v3/main
git worktree add --checkout astronvim-v4-main astronvim-v4/main
```

### adding the remotes

```bash
git remote add remote-template-astronvim-v3 https://github.com/AstroNvim/user_example.git
git remote add remote-template-astronvim-v4 https://github.com/AstroNvim/template.git
git remote add local-nvim-config ~/.config/nvim/
git remote add local-nvim-config-user ~/.config/nvim/lua/user/
```
