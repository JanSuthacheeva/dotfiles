return {
    'vim-test/vim-test',
     config = function()
        vim.cmd([[
            let test#php#pest#executable = 'php artisan test'
            let test#php#pest#options = '--colors=always'
            let test#php#pest#options = '-v'
            let test#strategy = 'neovim_sticky'
        ]])
    end
}
