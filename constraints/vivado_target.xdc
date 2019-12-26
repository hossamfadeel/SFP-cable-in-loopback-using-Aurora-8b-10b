## XDC generated for xczu15eg-ffvc900-1 device
# 125.0MHz GT Reference clock constraint
create_clock -period 8.000 -name GT_DIFF_REFCLK1 [get_ports GT_DIFF_REFCLK1_clk_p]
# Reference clock location
set_property PACKAGE_PIN G7 [get_ports GT_DIFF_REFCLK1_clk_n]
set_property PACKAGE_PIN G8 [get_ports GT_DIFF_REFCLK1_clk_p]




set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]
