/**
 * @file local-distrib.i
 * @brief Casting to most specific packages object for python
 * @author SBMLTeam
 *
 * <!--------------------------------------------------------------------------
 * This file is part of libSBML. Please visit http://sbml.org for more
 * information about SBML, and the latest version of libSBML.
 *
 * Copyright (C) 2013-2018 jointly by the following organizations:
 * 1. California Institute of Technology, Pasadena, CA, USA
 * 2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 * 3. University of Heidelberg, Heidelberg, Germany
 *
 * Copyright (C) 2009-2013 jointly by the following organizations:
 * 1. California Institute of Technology, Pasadena, CA, USA
 * 2. EMBL European Bioinformatics Institute (EMBL-EBI), Hinxton, UK
 *
 * Copyright (C) 2006-2008 by the California Institute of Technology,
 * Pasadena, CA, USA
 *
 * Copyright (C) 2002-2005 jointly by the following organizations:
 * 1. California Institute of Technology, Pasadena, CA, USA
 * 2. Japan Science and Technology Agency, Japan
 *
 * This library is free software; you can redistribute it and/or modify it
 * under the terms of the GNU Lesser General Public License as published by the
 * Free Software Foundation. A copy of the license agreement is provided in the
 * file named "LICENSE.txt" included with this software distribution and also
 * available online as http://sbml.org/software/libsbml/license.html
 * ------------------------------------------------------------------------ -->
 */


#ifdef USE_DISTRIB

SBMLCONSTRUCTOR_EXCEPTION(DistribPkgNamespaces)
SBMLCONSTRUCTOR_EXCEPTION(DistribDrawFromDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribInput)
SBMLCONSTRUCTOR_EXCEPTION(DistribUncertValue)
SBMLCONSTRUCTOR_EXCEPTION(DistribUncertBound)
SBMLCONSTRUCTOR_EXCEPTION(DistribExternalDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribExternalParameter)
SBMLCONSTRUCTOR_EXCEPTION(DistribNormalDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribUniformDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribCategoricalDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribCategory)
SBMLCONSTRUCTOR_EXCEPTION(DistribBernoulliDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribBetaDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribBinomialDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribCauchyDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribChiSquareDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribExponentialDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribFDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribGammaDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribGeometricDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribHypergeometricDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribInverseGammaDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribLaPlaceDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribLogNormalDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribLogisticDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribNegativeBinomialDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribParetoDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribPoissonDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribRayleighDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribStudentTDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribWeibullDistribution)
SBMLCONSTRUCTOR_EXCEPTION(DistribUncertainty)
SBMLCONSTRUCTOR_EXCEPTION(DistribUncertStatistics)
SBMLCONSTRUCTOR_EXCEPTION(DistribUncertStatisticSpan)
SBMLCONSTRUCTOR_EXCEPTION(ListOfDistribInputs)
SBMLCONSTRUCTOR_EXCEPTION(ListOfDistribExternalParameters)
SBMLCONSTRUCTOR_EXCEPTION(ListOfDistribCategories)

/**
 * Convert DistribContinuousUnivariateDistribution objects into the most specific object possible.
 */
%typemap(out) DistribContinuousUnivariateDistribution*
{
  $result = SWIG_NewPointerObj($1, GetDowncastSwigTypeForPackage($1,
    "distrib"), $owner | %newpointer_flags);
}

/**
 * Convert DistribDiscreteUnivariateDistribution objects into the most specific object possible.
 */
%typemap(out) DistribDiscreteUnivariateDistribution*
{
  $result = SWIG_NewPointerObj($1, GetDowncastSwigTypeForPackage($1,
    "distrib"), $owner | %newpointer_flags);
}

/**
 * Convert DistribCategoricalUnivariateDistribution objects into the most specific object possible.
 */
%typemap(out) DistribCategoricalUnivariateDistribution*
{
  $result = SWIG_NewPointerObj($1, GetDowncastSwigTypeForPackage($1,
    "distrib"), $owner | %newpointer_flags);
}

#endif // USE_DISTRIB

