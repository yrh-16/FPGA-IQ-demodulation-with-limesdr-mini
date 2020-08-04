	component cordic20200720 is
		port (
			clk    : in  std_logic                     := 'X';             -- clk
			areset : in  std_logic                     := 'X';             -- reset
			x      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- x
			y      : in  std_logic_vector(11 downto 0) := (others => 'X'); -- y
			q      : out std_logic_vector(11 downto 0)                     -- q
		);
	end component cordic20200720;

	u0 : component cordic20200720
		port map (
			clk    => CONNECTED_TO_clk,    --    clk.clk
			areset => CONNECTED_TO_areset, -- areset.reset
			x      => CONNECTED_TO_x,      --      x.x
			y      => CONNECTED_TO_y,      --      y.y
			q      => CONNECTED_TO_q       --      q.q
		);

