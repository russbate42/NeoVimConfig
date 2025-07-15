print('In transparent')
return {
    {
    'tribela/transparent.nvim',
    event = 'VimEnter',
    config = {
        auto = true, -- Automatically applies transparent
        extra_groups = {Lazy}, -- If you want to add some groups to be transparent. eg: { 'Pmenu', 'CocFloating' }
        excludes = {}, -- If you want to excludes from default transparent groups. eg: { 'LineNr' }
        }
    }
}
