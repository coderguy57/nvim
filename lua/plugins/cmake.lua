return {
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("cmake-tools").setup({
        cmake_command = "cmake",
        cmake_regenerate_on_save = true,
        cmake_build_directory = "build",
        cmake_generate_options = {
          "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON",
          "-DCMAKE_BUILD_TYPE=Debug",
          -- If you like Ninja:
          -- "-G", "Ninja",
        },
        cmake_dap_configuration = {
          name = "cpp",
          type = "codelldb",
          request = "launch",
          cwd = "${workspaceFolder}",
        },
        cmake_build_options = { "-j" },
        cmake_executor = { name = "terminal", opts = { direction = "horizontal" } },
        cmake_runner = { name = "terminal", opts = { direction = "horizontal" } },
      })
    end,
  },
}

