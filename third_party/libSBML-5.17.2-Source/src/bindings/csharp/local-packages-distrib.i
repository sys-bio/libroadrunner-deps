/**
 * @file local-packages-distrib.i
 * @brief Casting to most specific packages object for csharp
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
%typemap(cscode) DistribExtension
%{
  public override SBasePlugin DowncastSBasePlugin(IntPtr cPtr, bool owner)
  {
    if (cPtr.Equals(IntPtr.Zero)) return null;

    SBasePlugin sbp = new SBasePlugin(cPtr, false);
    SBase sb = sbp.getParentSBMLObject();

    switch ( sb.getTypeCode() )
    {
      case (int) libsbml.SBML_FUNCTION_DEFINITION:
        return new DistribFunctionDefinitionPlugin(cPtr, owner);

      case (int) libsbml.SBML_DOCUMENT:
        return new DistribSBMLDocumentPlugin(cPtr, owner);

      default:
        return new DistribSBasePlugin(cPtr, owner);
    }
  }

  public override SBase DowncastSBase(IntPtr cPtr, bool owner)
  {
    if (cPtr.Equals(IntPtr.Zero)) return null;

    SBase sb = new SBase(cPtr, false);
    switch ( sb.getTypeCode() )
    {
      case (int) libsbml.SBML_LIST_OF:
        string name = sb.getElementName();
        if (name == "listOfDistribInputs")
        {
          return new ListOfDistribInputs(cPtr, owner);
        }
        else if (name == "listOfExternalParameters")
        {
          return new ListOfDistribExternalParameters(cPtr, owner);
        }
        else if (name == "listOfCategories")
        {
          return new ListOfDistribCategories(cPtr, owner);
        }

        return new ListOf(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_DRAWFROMDISTRIBUTION:
        return new DistribDrawFromDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_DISTRIBINPUT:
        return new DistribInput(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNCERTVALUE:
        return new DistribUncertValue(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNCERTBOUND:
        return new DistribUncertBound(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_EXTERNALDISTRIBUTION:
        return new DistribExternalDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_EXTERNALPARAMETER:
        return new DistribExternalParameter(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_NORMALDISTRIBUTION:
        return new DistribNormalDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNIFORMDISTRIBUTION:
        return new DistribUniformDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_CATEGORICALDISTRIBUTION:
        return new DistribCategoricalDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_CATEGORY:
        return new DistribCategory(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_BERNOULLIDISTRIBUTION:
        return new DistribBernoulliDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_BETADISTRIBUTION:
        return new DistribBetaDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_BINOMIALDISTRIBUTION:
        return new DistribBinomialDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_CAUCHYDISTRIBUTION:
        return new DistribCauchyDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_CHISQUAREDISTRIBUTION:
        return new DistribChiSquareDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_EXPONENTIALDISTRIBUTION:
        return new DistribExponentialDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_FDISTRIBUTION:
        return new DistribFDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_GAMMADISTRIBUTION:
        return new DistribGammaDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_GEOMETRICLDISTRIBUTION:
        return new DistribGeometricDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_HYPERGEOMETRICDISTRIBUTION:
        return new DistribHypergeometricDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_INVERSEGAMMADISTRIBUTION:
        return new DistribInverseGammaDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_LAPLACEDISTRIBUTION:
        return new DistribLaPlaceDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_LOGNORMALDISTRIBUTION:
        return new DistribLogNormalDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_LOGISTICDISTRIBUTION:
        return new DistribLogisticDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_NEGATIVEBINOMIALDISTRIBUTION:
        return new DistribNegativeBinomialDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_PARETODISTRIBUTION:
        return new DistribParetoDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_POISSONDISTRIBUTION:
        return new DistribPoissonDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_RAYLEIGHDISTRIBUTION:
        return new DistribRayleighDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_STUDENTTDISTRIBUTION:
        return new DistribStudentTDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_WEIBULLDISTRIBUTION:
        return new DistribWeibullDistribution(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNCERTAINTY:
        return new DistribUncertainty(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNCERTSTATISTICS:
        return new DistribUncertStatistics(cPtr, owner);

      case (int) libsbml.SBML_DISTRIB_UNCERTSTATISTICSPAN:
        return new DistribUncertStatisticSpan(cPtr, owner);

      default:
        return new SBase(cPtr, owner);
    }
  }

%}

COVARIANT_RTYPE_CLONE(DistribExtension)
COVARIANT_RTYPE_CLONE(DistribDrawFromDistribution)
COVARIANT_RTYPE_CLONE(DistribInput)
COVARIANT_RTYPE_CLONE(DistribUncertValue)
COVARIANT_RTYPE_CLONE(DistribUncertBound)
COVARIANT_RTYPE_CLONE(DistribExternalDistribution)
COVARIANT_RTYPE_CLONE(DistribExternalParameter)
COVARIANT_RTYPE_CLONE(DistribNormalDistribution)
COVARIANT_RTYPE_CLONE(DistribUniformDistribution)
COVARIANT_RTYPE_CLONE(DistribCategoricalDistribution)
COVARIANT_RTYPE_CLONE(DistribCategory)
COVARIANT_RTYPE_CLONE(DistribBernoulliDistribution)
COVARIANT_RTYPE_CLONE(DistribBetaDistribution)
COVARIANT_RTYPE_CLONE(DistribBinomialDistribution)
COVARIANT_RTYPE_CLONE(DistribCauchyDistribution)
COVARIANT_RTYPE_CLONE(DistribChiSquareDistribution)
COVARIANT_RTYPE_CLONE(DistribExponentialDistribution)
COVARIANT_RTYPE_CLONE(DistribFDistribution)
COVARIANT_RTYPE_CLONE(DistribGammaDistribution)
COVARIANT_RTYPE_CLONE(DistribGeometricDistribution)
COVARIANT_RTYPE_CLONE(DistribHypergeometricDistribution)
COVARIANT_RTYPE_CLONE(DistribInverseGammaDistribution)
COVARIANT_RTYPE_CLONE(DistribLaPlaceDistribution)
COVARIANT_RTYPE_CLONE(DistribLogNormalDistribution)
COVARIANT_RTYPE_CLONE(DistribLogisticDistribution)
COVARIANT_RTYPE_CLONE(DistribNegativeBinomialDistribution)
COVARIANT_RTYPE_CLONE(DistribParetoDistribution)
COVARIANT_RTYPE_CLONE(DistribPoissonDistribution)
COVARIANT_RTYPE_CLONE(DistribRayleighDistribution)
COVARIANT_RTYPE_CLONE(DistribStudentTDistribution)
COVARIANT_RTYPE_CLONE(DistribWeibullDistribution)
COVARIANT_RTYPE_CLONE(DistribUncertainty)
COVARIANT_RTYPE_CLONE(DistribUncertStatistics)
COVARIANT_RTYPE_CLONE(DistribUncertStatisticSpan)
COVARIANT_RTYPE_CLONE(ListOfDistribInputs)
COVARIANT_RTYPE_CLONE(ListOfDistribExternalParameters)
COVARIANT_RTYPE_CLONE(ListOfDistribCategories)

COVARIANT_RTYPE_LISTOF_GET_REMOVE(DistribInput)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(DistribExternalParameter)
COVARIANT_RTYPE_LISTOF_GET_REMOVE(DistribCategory)

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


//
// Convert DistribContinuousUnivariateDistribution objects into the most
//  specific object possible.
//
%typemap("csout") DistribContinuousUnivariateDistribution*
{
  return (DistribContinuousUnivariateDistribution)
    libsbml.DowncastSBase($imcall, $owner);
}

//
// Convert DistribDiscreteUnivariateDistribution objects into the most specific
//  object possible.
//
%typemap("csout") DistribDiscreteUnivariateDistribution*
{
  return (DistribDiscreteUnivariateDistribution) libsbml.DowncastSBase($imcall,
    $owner);
}

//
// Convert DistribCategoricalUnivariateDistribution objects into the most
//  specific object possible.
//
%typemap("csout") DistribCategoricalUnivariateDistribution*
{
  return (DistribCategoricalUnivariateDistribution)
    libsbml.DowncastSBase($imcall, $owner);
}



#endif // USE_DISTRIB

