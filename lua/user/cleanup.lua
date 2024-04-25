---@type LazySpec
return {
	-- NOTE: removes mappings options that are used for the profile mapping
	"AstroNvim/astrocore",
	---@param opts AstroCoreOpts
	opts = function(_, opts)
		require("util.mapping").remove_options_from_mappings(
			opts.mappings,
			{ "lazyvim_mapping_profile_mapping" },
			{ "n", "x", "o", "i", "v" }
		)
	end,
}
