return {
  'fedepujol/move.nvim',
  keys = {
    { ',', ':MoveBlock -1<cr>', mode = 'v', desc = 'Move Block Up' },
    { '.', ':MoveBlock 1<cr>', mode = 'v', desc = 'Move Block Down' },
    { '<', ':MoveHBlock -1<cr>', mode = 'v', desc = 'Move Block Left' },
    { '>', ':MoveHBlock 1<cr>', mode = 'v', desc = 'Move Block Right' },
  },
  opts = {
    char = {
      enable = true,
    },
  },
}
