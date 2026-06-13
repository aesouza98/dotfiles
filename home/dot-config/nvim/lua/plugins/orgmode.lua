return {
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/Documents/Notes/**/*',
      org_default_notes_file = '~/Documents/Notes/inbox.org',
      org_todo_keywords = { 'BACKLOG', 'TODO', 'NEXT', 'DOING(c)', 'BLOCKED', '|', 'DONE', 'CANCELLED' },
      win_split_mode = 'auto',
      org_capture_templates = { 
        t = { 
          description = 'Task',
          template = '* TODO %?\n %u',
          target = '~/Documents/Notes/tasks.org',
        },
        d = {
          description = "Daily review",
          template = [[
* %^t Daily Review
:PROPERTIES:
:ROOM: %^{Room}
:QUARTER: %^{Quarter}
:END:

- Card 1
- Card 2

%?
            ]],
          target = "~/Documents/Notes/meetings.org",
        },
        J = {
          description = 'Journal',
          template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?',
          target = '~/Documents/Notes/journal/%<%Y-%m>.org'
        },
      }
    })
    -- Experimental LSP support
    vim.lsp.enable('org')
  end,
}
