# mfp-bubbles-thesan
Code used to calculate ionized bubbles sizes using the mean-free path (MFP) method for the THESAN simulations.

Below is a brief overview of the code. See https://arxiv.org/abs/2310.03783 for more details.

The main code is thesan-mfp-hist-grid.cc. This code calculates the mean-free path ionized bubble size in the THESAN simulations by performing second-order ray tracing over lines of sight isotropically distributed according to the HEALPix prescription for each simulation cell. The ray lengths are calculated to be the distances from the initial cell to the nearest neutral cell in the HEALPix-specified directions. If a cell is itself neutral, the bubble size in mfp_avgs is set to 0, and it does not contribute to the histograms. The run.sh script contains basic commands to compile and run the code on Mac laptops and on the MIT Engaging cluster. The output file is an hdf5 file created in the user-specified output directory. 

The output file contains the following datasets:

"mfp_hist": 1D histogram of all ray lengths in units of cell lengths

"mfp_hist_xHII": 2D histogram of log(ray length) and ionized fraction of initial cell

"mfp_hist_logT": 2D histogram of log(ray length) and log(temperature) of initial cell

"mfp_hist_logD": 2D histogram of log(ray length) and log(overdensity + 1) of initial cell

"mfp_avgs": 3D array of bubble sizes calculated for each cell as the average length of the n_LOS rays per cell


and the following "Header" attributes:


"BoxSize": simulation box size

"NumPixels": total number of cells

"NumBins": number of bins in "mfp_hist"

"NumBinsLogR": number of log(ray length) bins in "mfp_hist_xHII", "mfp_hist_logT", and "mfp_hist_logD"

"NumBinsHII": number of ionized fraction bins in "mfp_hist_xHII"

"NumBinsLogT": number of log(temperature) bins in "mfp_hist_logT"

"NumBinsLogD": number of log(overdensity + 1) bins in "mfp_hist_logD"

"MinLogR": minimum bin edge of log(ray length) in "mfp_hist_xHII", "mfp_hist_logT", and "mfp_hist_logD"

"MaxLogR": maximum bin edge of log(ray length) in "mfp_hist_xHII", "mfp_hist_logT", and "mfp_hist_logD"

"MinHII": minimum bin edge of ionized fraction in "mfp_hist_xHII"

"MaxHII": maximum bin edge of ionized fraction in "mfp_hist_xHII"

"MinLogT": minimum bin edge of log(temperature) bins in "mfp_hist_logT"

"MaxLogT": maximum bin edge of log(temperature) bins in "mfp_hist_logT"

"MinLogD": minimum bin edge of log(overdensity + 1) bins in "mfp_hist_logD"

"MaxLogD": maximum bin edge of log(overdensity + 1) bins in "mfp_hist_logD"

"NumExp": exponent used in number of HEALPix directions for each cell

"NumDirections": number of lines of sight per cell (12 * 4^NumExp)

"NumBinsPerCell": number of ray tracing bins per cell

"NumLoopsPerBox": maximum number of box lengths a ray length can be

"Time": scale factor at snapshot

"UnitLength_in_cm": code length in cm

"UnitMass_in_g": code mass in g

"UnitVelocity_in_cm_per_s": code velocity in cm/s

"HubbleParam": H0 / (100 km/s/Mpc)

"Omega0": cosmological fraction of dark matter + baryons

"OmegaBaryon": cosmological fraction of baryons

"OmegaLambda": cosmological fraction of cosmological constant

"Redshift": redshift of snapshot