return {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release -DCMAKE_POLICY_VERSION_MINIMUM=3.5 && cmake --build build --config Release",
      -- after build cp nvim-data/lazy/telescope-fzf-native/build/fzf.dir/Release/libfzf.dll ...build/
      -- building the cmds above manually in cmd helped to build the dll
      config = function()
        require("telescope").load_extension("fzf")
      end,
      cond = vim.fn.executable("cmake") == 1,
}

