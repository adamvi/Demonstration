#####################################################################################
###
### R Script for Demonstration SGP analyses
###
#####################################################################################

### Load SGP Package

require(SGP)
require(SGPdata)
options(error=recover)


### Load SIMEX matrices

load("Data/Base_Files/DEMO_SIMEX_Baseline_Matrices.Rdata")


### prepareSGP

Demonstration_SGP <- prepareSGP(sgpData_LONG, data_supplementary=list(INSTRUCTOR_NUMBER=sgpData_INSTRUCTOR_NUMBER))
Demonstration_SGP@SGP$Coefficient_Matrices <- DEMO_SIMEX_Baseline_Matrices


### abcSGP

Demonstration_SGP <- abcSGP(
	sgp_object=Demonstration_SGP,
	steps=c("analyzeSGP", "combineSGP", "summarizeSGP", "outputSGP"),
	calculate.simex.baseline=TRUE,
	parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SGP_SCALE_SCORE_TARGETS=4, SUMMARY=4, GA_PLOTS=4, SG_PLOTS=1)))


### Output SchoolView tables

outputSGP(Demonstration_SGP, output.type="SchoolView")


### Save results

save(Demonstration_SGP, file="Data/Demonstration_SGP.Rdata")
