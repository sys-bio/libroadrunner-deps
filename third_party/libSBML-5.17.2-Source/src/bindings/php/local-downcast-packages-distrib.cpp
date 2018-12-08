/**
 * @file local-downcast-packages-distrib.cpp
 * @brief Casting to most specific packages object for php
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
else if (pkgName == "distrib")
{
  switch ( sb->getTypeCode() )
  {
    case SBML_LIST_OF:
      name = sb->getElementName();
      if (name == "listOfDistribInputs")
      {
        return SWIGTYPE_p_ListOfDistribInputs;
      }
      else if (name == "listOfExternalParameters")
      {
        return SWIGTYPE_p_ListOfDistribExternalParameters;
      }
      else if (name == "listOfCategories")
      {
        return SWIGTYPE_p_ListOfDistribCategories;
      }

      return SWIGTYPE_p_ListOf;

    case SBML_DISTRIB_DRAWFROMDISTRIBUTION:
      return SWIGTYPE_p_DistribDrawFromDistribution;

    case SBML_DISTRIB_DISTRIBINPUT:
      return SWIGTYPE_p_DistribInput;

    case SBML_DISTRIB_UNCERTVALUE:
      return SWIGTYPE_p_DistribUncertValue;

    case SBML_DISTRIB_UNCERTBOUND:
      return SWIGTYPE_p_DistribUncertBound;

    case SBML_DISTRIB_EXTERNALDISTRIBUTION:
      return SWIGTYPE_p_DistribExternalDistribution;

    case SBML_DISTRIB_EXTERNALPARAMETER:
      return SWIGTYPE_p_DistribExternalParameter;

    case SBML_DISTRIB_NORMALDISTRIBUTION:
      return SWIGTYPE_p_DistribNormalDistribution;

    case SBML_DISTRIB_UNIFORMDISTRIBUTION:
      return SWIGTYPE_p_DistribUniformDistribution;

    case SBML_DISTRIB_CATEGORICALDISTRIBUTION:
      return SWIGTYPE_p_DistribCategoricalDistribution;

    case SBML_DISTRIB_CATEGORY:
      return SWIGTYPE_p_DistribCategory;

    case SBML_DISTRIB_BERNOULLIDISTRIBUTION:
      return SWIGTYPE_p_DistribBernoulliDistribution;

    case SBML_DISTRIB_BETADISTRIBUTION:
      return SWIGTYPE_p_DistribBetaDistribution;

    case SBML_DISTRIB_BINOMIALDISTRIBUTION:
      return SWIGTYPE_p_DistribBinomialDistribution;

    case SBML_DISTRIB_CAUCHYDISTRIBUTION:
      return SWIGTYPE_p_DistribCauchyDistribution;

    case SBML_DISTRIB_CHISQUAREDISTRIBUTION:
      return SWIGTYPE_p_DistribChiSquareDistribution;

    case SBML_DISTRIB_EXPONENTIALDISTRIBUTION:
      return SWIGTYPE_p_DistribExponentialDistribution;

    case SBML_DISTRIB_FDISTRIBUTION:
      return SWIGTYPE_p_DistribFDistribution;

    case SBML_DISTRIB_GAMMADISTRIBUTION:
      return SWIGTYPE_p_DistribGammaDistribution;

    case SBML_DISTRIB_GEOMETRICLDISTRIBUTION:
      return SWIGTYPE_p_DistribGeometricDistribution;

    case SBML_DISTRIB_HYPERGEOMETRICDISTRIBUTION:
      return SWIGTYPE_p_DistribHypergeometricDistribution;

    case SBML_DISTRIB_INVERSEGAMMADISTRIBUTION:
      return SWIGTYPE_p_DistribInverseGammaDistribution;

    case SBML_DISTRIB_LAPLACEDISTRIBUTION:
      return SWIGTYPE_p_DistribLaPlaceDistribution;

    case SBML_DISTRIB_LOGNORMALDISTRIBUTION:
      return SWIGTYPE_p_DistribLogNormalDistribution;

    case SBML_DISTRIB_LOGISTICDISTRIBUTION:
      return SWIGTYPE_p_DistribLogisticDistribution;

    case SBML_DISTRIB_NEGATIVEBINOMIALDISTRIBUTION:
      return SWIGTYPE_p_DistribNegativeBinomialDistribution;

    case SBML_DISTRIB_PARETODISTRIBUTION:
      return SWIGTYPE_p_DistribParetoDistribution;

    case SBML_DISTRIB_POISSONDISTRIBUTION:
      return SWIGTYPE_p_DistribPoissonDistribution;

    case SBML_DISTRIB_RAYLEIGHDISTRIBUTION:
      return SWIGTYPE_p_DistribRayleighDistribution;

    case SBML_DISTRIB_STUDENTTDISTRIBUTION:
      return SWIGTYPE_p_DistribStudentTDistribution;

    case SBML_DISTRIB_WEIBULLDISTRIBUTION:
      return SWIGTYPE_p_DistribWeibullDistribution;

    case SBML_DISTRIB_UNCERTAINTY:
      return SWIGTYPE_p_DistribUncertainty;

    case SBML_DISTRIB_UNCERTSTATISTICS:
      return SWIGTYPE_p_DistribUncertStatistics;

    case SBML_DISTRIB_UNCERTSTATISTICSPAN:
      return SWIGTYPE_p_DistribUncertStatisticSpan;

    default:
      return SWIGTYPE_p_SBase;
    }
  }

  #endif // USE_DISTRIB

