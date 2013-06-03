Demonstration
=============

SGP source code and documentation associated with Demonstration SGP analyses. Output follows from running *Demonstration_SGP.R*.

```R
### Load SGP Package

require(SGP)
options(error=recover)


### abcSGP

Demonstration_SGP <- abcSGP(
			sgp_object=sgpData_LONG,
			data_supplementary=list(INSTRUCTOR_NUMBER=sgpData_INSTRUCTOR_NUMBER),
			sgPlot.demo.report=TRUE,
			parallel.config=list(BACKEND="PARALLEL", WORKERS=list(PERCENTILES=4, BASELINE_PERCENTILES=4, PROJECTIONS=4, LAGGED_PROJECTIONS=4, SUMMARY=4, GA_PLOTS=4, SG_PLOTS=1)))

### Output SchoolView tables

outputSGP(Demonstration_SGP, output.type="SchoolView")


### Save results

save(Demonstration_SGP, file="Data/Demonstration_SGP.Rdata")
```
