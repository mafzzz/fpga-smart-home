derive_clock_uncertainty
create_clock -period 50MHz -name {clk50M} [get_ports {clk50M}]
set_clock_groups -exclusive -group {clk50M}

