//
// Filename    : TestTransformation
// Description : Tests for the Transformation class
// Organization: University of Heidelberg
// Created     : 2009-09-30
//
// Copyright 2008 University of Heidelberg
//
// This library is free software; you can redistribute it and/or modify it
// under the terms of the GNU Lesser General Public License as published
// by the Free Software Foundation; either version 2.1 of the License, or
// any later version.
//
// This library is distributed in the hope that it will be useful, but
// WITHOUT ANY WARRANTY, WITHOUT EVEN THE IMPLIED WARRANTY OF
// MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.  The software and
// documentation provided hereunder is on an "as is" basis, and the
// University of Heidelberg have no obligations to
// provide maintenance, support, updates, enhancements or modifications.
// In no event shall the University of Heidelberg be
// liable to any party for direct, indirect, special, incidental or
// consequential damages, including lost profits, arising out of the use of
// this software and its documentation, even if the University of 
// Heidelberg have been advised of the possibility of such
// damage.  See the GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this library; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.
//
// The original code contained here was initially developed by:
//
//     Ralph Gauges
//     BIOQUANT/BQ0018
//     Im Neuenheimer Feld 267
//     69120 Heidelberg
//     Germany
//
//     mailto:ralph.gauges@bioquant.uni-heidelberg.de
//
// Contributor(s):



#include <sbml/common/common.h>
#include <sbml/common/extern.h>

#include "Transformation.h"
#include "Text.h"

#include <check.h>
#include <limits>

LIBSBML_CPP_NAMESPACE_USE

BEGIN_C_DECLS

static Transformation *T;
static RenderPkgNamespaces *renderns;

void
TransformationTest_setup (void)
{
  renderns = new (std::nothrow) RenderPkgNamespaces();
    T = new (std::nothrow) Text(renderns);

    if (T == NULL)
    {
        fail("new(std::nothrow)Text(renderns) returned a NULL pointer.");
    }

}

void 
TransformationTest_teardown (void)
{
    delete T;
    delete renderns;
}

START_TEST (test_Transformation_setMatrix )
{
    fail_unless(!T->isSetMatrix());
    const double* m=T->Transformation::getMatrix();
    fail_unless(m != NULL);
    double newM[12]={12.0,11.0,10.0,9.0,8.0,7.0,6.0,5.0,4.0,3.0,2.0,1.0};
    T->Transformation::setMatrix(newM);
    fail_unless(T->isSetMatrix());
    m=T->Transformation::getMatrix();
    fail_unless(m != NULL);
    // test the twelve values
    fail_unless(fabs((m[0] - 12.0) / 12.0) < 1e-9); 
    fail_unless(fabs((m[1] - 11.0) / 11.0) < 1e-9); 
    fail_unless(fabs((m[2] - 10.0) / 10.0) < 1e-9); 
    fail_unless(fabs((m[3] - 9.0) / 9.0) < 1e-9); 
    fail_unless(fabs((m[4] - 8.0) / 8.0) < 1e-9); 
    fail_unless(fabs((m[5] - 7.0) / 7.0) < 1e-9); 
    fail_unless(fabs((m[6] - 6.0) / 6.0) < 1e-9); 
    fail_unless(fabs((m[7] - 5.0) / 5.0) < 1e-9); 
    fail_unless(fabs((m[8] - 4.0) / 4.0) < 1e-9); 
    fail_unless(fabs((m[9] - 3.0) / 3.0) < 1e-9); 
    fail_unless(fabs((m[10] - 2.0) / 2.0) < 1e-9); 
    fail_unless(fabs((m[11] - 1.0) / 1.0) < 1e-9); 
    m=Transformation::getIdentityMatrix();
    fail_unless(m != NULL);
    // test the twelve values
    fail_unless(fabs((m[0] - 1.0) / 1.0) < 1e-9); 
    fail_unless(m[1]  < 1e-9); 
    fail_unless(m[2]  < 1e-9); 
    fail_unless(m[3]  < 1e-9); 
    fail_unless(fabs((m[4] - 1.0) / 1.0) < 1e-9); 
    fail_unless(m[5]  < 1e-9); 
    fail_unless(m[6]  < 1e-9); 
    fail_unless(m[7]  < 1e-9); 
    fail_unless(fabs((m[8] - 1.0) / 1.0) < 1e-9); 
    fail_unless(m[9]  < 1e-9); 
    fail_unless(m[10] < 1e-9); 
    fail_unless(m[11] < 1e-9); 
}
END_TEST 


Suite *
create_suite_Transformation (void)
{
  Suite *suite = suite_create("Transformation");
  TCase *tcase = tcase_create("Transformation");


  tcase_add_checked_fixture( tcase,
                             TransformationTest_setup,
                             TransformationTest_teardown );

  tcase_add_test( tcase, test_Transformation_setMatrix );

  suite_add_tcase(suite, tcase);

  return suite;
}

END_C_DECLS
