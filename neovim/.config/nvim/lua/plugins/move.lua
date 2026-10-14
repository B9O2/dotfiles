return {
  'fedepujol/move.nvim',
  keys = {
    { ',', ':MoveBlock -1<cr>', mode = 'v', desc = 'Move Block Up' },
    { '.', ':MoveBlock 1<cr>', mode = 'v', desc = 'Move Block Down' },
    { '<M-h>', ':MoveHBlock -1<cr>', mode = 'v', desc = 'Move Block Left' },
    { '<M-l>', ':MoveHBlock 1<cr>', mode = 'v', desc = 'Move Block Right' },
  },
  opts = {
    char = {
      enable = true,
    },
  },
}
