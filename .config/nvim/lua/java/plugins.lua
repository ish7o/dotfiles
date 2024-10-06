vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)

    use "wbthomason/packer.nvim"

    use 'mfussenegger/nvim-dap'
    use 'mfussenegger/nvim-jdtls'
    use 'nvim-lua/plenary.nvim'
end)
