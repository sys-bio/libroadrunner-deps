/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.sbml.libsbml;

/** 
 *  Base class for extending {@link SBMLDocument} in packages.
 <p>
 * <p style='color: #777; font-style: italic'>
This class of objects is defined by libSBML only and has no direct
equivalent in terms of SBML components.  This class is not prescribed by
the SBML specifications, although it is used to implement features
defined in SBML.
</p>

 <p>
 * The {@link SBMLDocumentPlugin} class is a specialization of {@link SBasePlugin}
 * designed specifically for extending {@link SBMLDocument}.  All package
 * extensions must extend {@link SBMLDocument} to implement support for SBML
 * Level&nbsp;3 packages; these extensions can be subclasses of this
 * class or from a derived class of this class.
 <p>
 * <h2>How to extend {@link SBMLDocumentPlugin} for a package implementation</h2>
 * <p>
 * The following subsections detail the basic steps necessary to use
 * {@link SBMLDocumentPlugin} to extend {@link SBMLDocument} for a given package extension.
 <p>
 * <h3>1. Identify the changes necessary to {@link SBMLDocument}</h3>
 <p>
 * The specification for a SBML Level&nbsp;3 package will define the
 * changes to the SBML <code>&lt;sbml&gt;</code> element.  Packages
 * typically do not make any changes beyond adding an attribute named
 * 'required' (discussed below), so in most cases, the extension of
 * {@link SBMLDocument} is very simple.  However, some packages do more.  For
 * instance, the Hierarchical Model Composition package adds subobjects
 * for lists of model definitions.  {@link SBMLDocumentPlugin} supports all these
 * cases.
 <p>
 * <h3>2. Create the {@link SBMLDocumentPlugin} subclass</h3>
 <p>
 * A package extension will only define one subclass of {@link SBMLDocumentPlugin}.
 * Below, we describe in detail the different parts of a subclass
 * definition.
 <p>
 * <h4>2.1 Override {@link SBasePlugin} class-related methods</h4>
 <p>
 * The derived class must override the constructor, copy constructor, assignment
 * operator (<code>operator=</code>) and <code>clone()</code> methods from
 * {@link SBasePlugin}.
 <p>
 * <h4>2.2 Determine the necessary value of the 'required' attribute</h4>
 <p>
 * At minimum, it is necessary for a package implementation to add the
 * 'required' attribute to the SBML <code>&lt;sbml&gt;</code> element
 * mandated by SBML for all Level&nbsp;3 packages, and this is done using
 * this class as a base.  If the 'required' attribute is the <em>only</em>
 * addition necessary for a particular SBML Level&nbsp;3 package, then the
 * subclass of {@link SBMLDocumentPlugin} for the package can have a very simple
 * implementation.  Some Level&nbsp;3 packages add additional attributes or
 * elements to <code>&lt;sbml&gt;</code>, and their implementations would
 * go into the subclassed {@link SBMLDocumentPlugin}.
 <p>
 * {@link SBMLDocumentPlugin} provides methods with default implementations that
 * support managing the 'required' attribute, so package extension code
 * does not need to provide implementations&mdash;they only need to set the
 * correct value for the SBML Level&nbsp;3 package based on its
 * specification.  The following are the virtual methods for working with
 * the 'required' attribute.  Package extensions would only need to
 * override them in special circumstances:
 <p>
 * <ul>
 * <li> <code>setRequired(boolean value)</code>: This method sets the value
 * of the flag.
 <p>
 * <li> <code>getRequired()</code>: This method gets the value of the
 * 'required' flag.
 <p>
 * <li> <code>isSetRequired()</code>: This method tests if the value has
 * been set.
 <p>
 * <li> <code>unsetRequired()</code>: This method unsets the value of the
 * 'required' flag.
 *
 * </ul> <p>
 * <h4>2.3 Define protected data members</h4>
 <p>
 * An extended {@link SBMLDocument} object may need more than just the 'required'
 * attribute, depending on what is defined in the specification for the
 * package being implemented.  Data attributes on the extended
 * <code>&lt;sbml&gt;</code> object in an SBML package will have one of the
 * data types <code>String</code>, <code>double</code>,
 * <code>int</code>, or <code>boolean</code>.  Subelements/subobjects will
 * normally be derived from the {@link ListOf} class or from {@link SBase}.
 <p>
 * The additional data members must be properly initialized in the class
 * constructor, and must be properly copied in the copy constructor and
 * assignment operator.
 <p>
 * <h4>2.4 Override virtual methods for attributes</h4>
 <p>
 * If the extended component is defined by the SBML Level&nbsp;3 package to
 * have attributes, then the extended {@link SBMLDocumentPlugin} class definition
 * needs to override the following internal methods that come from
 * {@link SBasePlugin} (the base class of {@link SBMLDocumentPlugin}) and provide
 * appropriate implementations:
 <p>
 * <ul>
 * <li> <code>addExpectedAttributes(ExpectedAttributes& attributes)</code>: This
 * method should add the attributes that are expected to be found on this kind
 * of extended component in an SBML file or data stream.
 <p>
 * <li> <code>readAttributes(XMLAttributes attributes, ExpectedAttributes&
 * expectedAttributes)</code>: This method should read the attributes
 * expected to be found on this kind of extended component in an SBML file or
 * data stream.
 <p>
 * <li> <code>hasRequiredAttributes()</code>: This method should return <code>true</code>
 * if all of the required attribute for this extended component are present on
 * instance of the object.
 <p>
 * <li> <code>writeAttributes(XMLOutputStream stream)</code>: This method should
 * write out the attributes of an extended component.  The implementation should
 * use the different kinds of <code>writeAttribute</code> methods defined by
 * {@link XMLOutputStream} to achieve this.
 *
 * </ul> <p>
 * <h4>2.5 Override virtual methods for subcomponents</h4>
 <p>
 * If the extended component is defined by the Level&nbsp;3 package to have
 * subcomponents (i.e., full XML elements rather than mere attributes),
 * then the extended class definition needs to override the following
 * internal methods on {@link SBasePlugin} (the base class of {@link SBMLDocumentPlugin})
 * and provide appropriate implementations:
 <p>
 * <ul>
 * <li> <code>createObject(XMLInputStream stream)</code>: Subclasses must
 * override this method to create, store, and then return an SBML object
 * corresponding to the next {@link XMLToken} in the {@link XMLInputStream}.  To do this,
 * implementations can use methods like <code>peek()</code> on {@link XMLInputStream} to
 * test if the next object in the stream is something expected for the package.
 * For example, LayoutModelPlugin uses <code>peek()</code> to examine the next
 * element in the input stream, then tests that element against the Layout
 * namespace and the element name <code>'listOfLayouts'</code> to see if it's
 * the single subcomponent (ListOfLayouts) permitted on a {@link Model} object using the
 * Layout package.  If it is, it returns the appropriate object.
 <p>
 * <li> <code>connectToParent(SBase sbase)</code>: This creates a parent-child
 * relationship between a given extended component and its subcomponent(s).
 <p>
 * <li> <code>setSBMLDocument(SBMLDocument d)</code>: This method should set the
 * parent {@link SBMLDocument} object on the subcomponent object instances, so that the
 * subcomponent instances know which {@link SBMLDocument} contains them.
 <p>
 * <li> <code>enablePackageInternal(String& pkgURI, String& pkgPrefix,
 * boolean flag)</code>: This method should enable or disable the subcomponent
 * based on whether a given XML namespace is active.
 <p>
 * <li> <code>writeElements(XMLOutputStream stream)</code>: This method must be
 * overridden to provide an implementation that will write out the expected
 * subcomponents/subelements to the XML output stream.
 <p>
 * <li> <code>readOtherXML(SBase parentObject, {@link XMLInputStream} stream)</code>:
 * This function should be overridden if elements of annotation, notes, MathML
 * content, etc., need to be directly parsed from the given {@link XMLInputStream}
 * object.
 <p>
 * <li> <code>hasRequiredElements()</code>: This method should return <code>true</code> if
 * a given object contains all the required subcomponents defined by the
 * specification for that SBML Level&nbsp;3 package.
 *
 * </ul> <p>
 * <h4>2.6 Override virtual methods for XML namespaces</h4>
 <p>
 * If the package needs to add additional <code>xmlns</code> attributes to
 * declare additional XML namespace URIs, the extended class should
 * override the following method coming from {@link SBasePlugin} (the parent class
 * of {@link SBMLDocumentPlugin}):
 <p>
 * <ul>
 * <li> <code>writeXMLNS(XMLOutputStream stream)</code>: This method should
 * write out any additional XML namespaces that might be needed by a package
 * implementation.
 *
 * </ul> <p>
 * <h4>2.7 Implement additional methods as needed</h4>
 <p>
 * Extended {@link SBMLDocumentPlugin} implementations can add whatever additional
 * utility methods are useful for their implementation.
 */

public class SBMLDocumentPlugin extends SBasePlugin {
   private long swigCPtr;

   protected SBMLDocumentPlugin(long cPtr, boolean cMemoryOwn)
   {
     super(libsbmlJNI.SBMLDocumentPlugin_SWIGUpcast(cPtr), cMemoryOwn);
     swigCPtr = cPtr;
   }

   protected static long getCPtr(SBMLDocumentPlugin obj)
   {
     return (obj == null) ? 0 : obj.swigCPtr;
   }

   protected static long getCPtrAndDisown (SBMLDocumentPlugin obj)
   {
     long ptr = 0;

     if (obj != null)
     {
       ptr             = obj.swigCPtr;
       obj.swigCMemOwn = false;
     }

     return ptr;
   }

  protected void finalize() {
    delete();
  }

  public synchronized void delete() {
    if (swigCPtr != 0) {
      if (swigCMemOwn) {
        swigCMemOwn = false;
        libsbmlJNI.delete_SBMLDocumentPlugin(swigCPtr);
      }
      swigCPtr = 0;
    }
    super.delete();
  }

  
/**
   * Creates a new {@link SBMLDocumentPlugin} object using the given parameters.
   <p>
   * <p>
 * In the XML representation of an SBML document, XML namespaces are used to
 * identify the origin of each XML construct used.  XML namespaces are
 * identified by their unique resource identifiers (URIs).  The core SBML
 * specifications stipulate the namespaces that must be used for core SBML
 * constructs; for example, all XML elements that belong to SBML Level&nbsp;3
 * Version&nbsp;1 Core must be placed in the XML namespace identified by the URI
 * <code>'http://www.sbml.org/sbml/level3/version1/core'</code>.  Individual
 * SBML Level&nbsp;3 packages define their own XML namespaces; for example,
 * all elements belonging to the SBML Level&nbsp;3 Layout Version&nbsp;1
 * package must be placed in the XML namespace
 * <code>'http://www.sbml.org/sbml/level3/version1/layout/version1/'</code>.
   <p>
   * <p>
 * The {@link SBMLNamespaces} object encapsulates SBML Level/Version/namespaces
 * information.  It is used to communicate the SBML Level, Version, and (in
 * Level&nbsp;3) packages used in addition to SBML Level&nbsp;3 Core.  A
 * common approach to using libSBML's {@link SBMLNamespaces} facilities is to create an
 * {@link SBMLNamespaces} object somewhere in a program once, then hand that object
 * as needed to object constructors that accept {@link SBMLNamespaces} as arguments.
   <p>
   * @param uri the URI of the SBML Level&nbsp;3 package implemented by
   * this libSBML package extension.
   <p>
   * @param prefix the XML namespace prefix being used for the package.
   <p>
   * @param sbmlns the {@link SBMLNamespaces} object for the package.
   */ public
 SBMLDocumentPlugin(String uri, String prefix, SBMLNamespaces sbmlns) {
    this(libsbmlJNI.new_SBMLDocumentPlugin__SWIG_0(uri, prefix, SBMLNamespaces.getCPtr(sbmlns), sbmlns), true);
  }

  
/**
   * Copy constructor.
   <p>
   * This creates a copy of this object.
   <p>
   * @param orig the {@link SBMLDocumentPlugin} instance to copy.
   */ public
 SBMLDocumentPlugin(SBMLDocumentPlugin orig) {
    this(libsbmlJNI.new_SBMLDocumentPlugin__SWIG_1(SBMLDocumentPlugin.getCPtr(orig), orig), true);
  }

  
/**
   * Creates and returns a deep copy of this {@link SBMLDocumentPlugin} object.
   <p>
   * @return the (deep) copy of this {@link SBMLDocumentPlugin} object.
   */ public
 SBasePlugin cloneObject() {
    long cPtr = libsbmlJNI.SBMLDocumentPlugin_cloneObject(swigCPtr, this);
    return (cPtr == 0) ? null : new SBMLDocumentPlugin(cPtr, true);
  }

  
/**
   * Sets the SBML 'required' attribute value.
   <p>
   * <p>
 * SBML Level&nbsp;3 requires that every package defines an attribute named
 * 'required' on the root <code>&lt;sbml&gt;</code> element in an SBML file
 * or data stream.  The attribute, being in the namespace of the Level&nbsp;3
 * package in question, must be prefixed by the XML namespace prefix
 * associated with the package.  The value of the 'required' attribute
 * indicates whether constructs in that package may change the mathematical
 * interpretation of constructs defined in SBML Level&nbsp;3 Core.  A
 * 'required' value of <code>true</code> indicates that the package may do so.  The
 * value of the attribute is set by the Level&nbsp;3 package specification,
 * and does <em>not</em> depend on the actual presence or absence of particular
 * package constructs in a given SBML document: in other words, if the
 * package specification defines any construct that can change the model's
 * meaning, the value of the 'required' attribute must always be set to 
 * <code>true</code> in any SBML document that uses the package.
 <p>
 * The XML namespace declaration for an SBML Level&nbsp;3 package is an
 * indication that a model makes use of features defined by that package,
 * while the 'required' attribute indicates whether the features may be
 * ignored without compromising the mathematical meaning of the model.  Both
 * are necessary for a complete reference to an SBML Level&nbsp;3 package.
   <p>
   * @param value the value to be assigned to the 'required' attribute.
   * The 'required' attribute takes a Boolean value, either <code>true</code> or
   * <code>false.</code>
   <p>
   * <p>
 * @return integer value indicating success/failure of the
 * function.   The possible values
 * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_UNEXPECTED_ATTRIBUTE LIBSBML_UNEXPECTED_ATTRIBUTE}
   *
   * </ul> <p>
   * @see #getRequired()
   * @see #isSetRequired()
   * @see #unsetRequired()
   */ public
 int setRequired(boolean value) {
    return libsbmlJNI.SBMLDocumentPlugin_setRequired(swigCPtr, this, value);
  }

  
/**
   * Returns the value of the 'required' attribute.
   <p>
   * <p>
 * SBML Level&nbsp;3 requires that every package defines an attribute named
 * 'required' on the root <code>&lt;sbml&gt;</code> element in an SBML file
 * or data stream.  The attribute, being in the namespace of the Level&nbsp;3
 * package in question, must be prefixed by the XML namespace prefix
 * associated with the package.  The value of the 'required' attribute
 * indicates whether constructs in that package may change the mathematical
 * interpretation of constructs defined in SBML Level&nbsp;3 Core.  A
 * 'required' value of <code>true</code> indicates that the package may do so.  The
 * value of the attribute is set by the Level&nbsp;3 package specification,
 * and does <em>not</em> depend on the actual presence or absence of particular
 * package constructs in a given SBML document: in other words, if the
 * package specification defines any construct that can change the model's
 * meaning, the value of the 'required' attribute must always be set to 
 * <code>true</code> in any SBML document that uses the package.
 <p>
 * The XML namespace declaration for an SBML Level&nbsp;3 package is an
 * indication that a model makes use of features defined by that package,
 * while the 'required' attribute indicates whether the features may be
 * ignored without compromising the mathematical meaning of the model.  Both
 * are necessary for a complete reference to an SBML Level&nbsp;3 package.
   <p>
   * @return the boolean value of 'required' attribute for the SBML package.
   <p>
   * @see #setRequired(boolean value)
   * @see #isSetRequired()
   * @see #unsetRequired()
   */ public
 boolean getRequired() {
    return libsbmlJNI.SBMLDocumentPlugin_getRequired(swigCPtr, this);
  }

  
/**
   * Returns the value of the 'required' attribute.
   <p>
   * <p>
 * SBML Level&nbsp;3 requires that every package defines an attribute named
 * 'required' on the root <code>&lt;sbml&gt;</code> element in an SBML file
 * or data stream.  The attribute, being in the namespace of the Level&nbsp;3
 * package in question, must be prefixed by the XML namespace prefix
 * associated with the package.  The value of the 'required' attribute
 * indicates whether constructs in that package may change the mathematical
 * interpretation of constructs defined in SBML Level&nbsp;3 Core.  A
 * 'required' value of <code>true</code> indicates that the package may do so.  The
 * value of the attribute is set by the Level&nbsp;3 package specification,
 * and does <em>not</em> depend on the actual presence or absence of particular
 * package constructs in a given SBML document: in other words, if the
 * package specification defines any construct that can change the model's
 * meaning, the value of the 'required' attribute must always be set to 
 * <code>true</code> in any SBML document that uses the package.
 <p>
 * The XML namespace declaration for an SBML Level&nbsp;3 package is an
 * indication that a model makes use of features defined by that package,
 * while the 'required' attribute indicates whether the features may be
 * ignored without compromising the mathematical meaning of the model.  Both
 * are necessary for a complete reference to an SBML Level&nbsp;3 package.
   <p>
   * @return <code>true</code> if the 'required' attribute of this {@link SBMLDocument}
   * has been set to <code>true</code>, <code>false</code> otherwise.
   */ public
 boolean isSetRequired() {
    return libsbmlJNI.SBMLDocumentPlugin_isSetRequired(swigCPtr, this);
  }

  
/**
   * Unsets the value of the 'required' attribute of this {@link SBMLDocumentPlugin}.
   <p>
   * <p>
 * @return integer value indicating success/failure of the
 * function.   The possible values
 * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * </ul>
   */ public
 int unsetRequired() {
    return libsbmlJNI.SBMLDocumentPlugin_unsetRequired(swigCPtr, this);
  }

  
/** * @internal */ public
 boolean isCompFlatteningImplemented() {
    return libsbmlJNI.SBMLDocumentPlugin_isCompFlatteningImplemented(swigCPtr, this);
  }

  
/** * @internal */ public
 long checkConsistency() {
    return libsbmlJNI.SBMLDocumentPlugin_checkConsistency(swigCPtr, this);
  }

}
