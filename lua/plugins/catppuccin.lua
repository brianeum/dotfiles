return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- 사용할 플레이버 (예: "latte", "frappe", "macchiato", "mocha")
      flavour = "frappe",
      -- 배경 투명도 설정 (gruvbox의 transparent_mode와 유사한 역할)
      transparent_background = false,
      -- 터미널에서도 색상이 적용되도록
      term_colors = true,
      -- 비활성 창 dim 효과 (gruvbox의 dim_inactive와 유사)
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      -- 문법 하이라이팅 스타일을 gruvbox 기본 설정에 가깝게 지정
      styles = {
        comments    = { "italic" },   -- gruvbox: comments = true (이탤릭)
        conditionals = { "italic" },  -- 조건문도 이탤릭 처리 (gruvbox의 emphasis와 유사)
        loops       = {},             -- 별도 스타일 없음
        functions   = { "bold" },     -- 함수는 볼드 처리 (gruvbox의 bold = true)
        keywords    = { "bold" },     -- 키워드 볼드 처리
        strings     = { "bold" },   -- 문자열 이탤릭 (gruvbox: italic.strings = true)
        variables   = {},             -- 기본 스타일 유지
        numbers     = {},             -- 기본 스타일 유지
        booleans    = {},             -- 기본 스타일 유지
        properties  = {},             -- 기본 스타일 유지
        types       = {},             -- 기본 스타일 유지
      },
      -- gruvbox의 나머지 옵션(undercurl, underline, strikethrough 등)은
      -- catppuccin에서는 내부적으로 처리되거나 custom_highlights를 통해 추가로 오버라이드할 수 있습니다.
      color_overrides = {},
      custom_highlights = {},
    })
    vim.cmd("colorscheme catppuccin")
  end,
}

