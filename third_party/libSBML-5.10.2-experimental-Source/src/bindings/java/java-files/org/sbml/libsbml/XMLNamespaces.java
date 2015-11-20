/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.4
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.sbml.libsbml;

/** 
 *  An XML Namespace.
 <p>
 * <p style='color: #777; font-style: italic'>
This class of objects is defined by libSBML only and has no direct
equivalent in terms of SBML components.  This class is not prescribed by
the SBML specifications, although it is used to implement features
defined in SBML.
</p>

 <p>
 * This class serves to organize functionality for tracking XML namespaces
 * in a document or data stream.  The namespace declarations are stored as
 * a list of pairs of XML namespace URIs and prefix strings.  These
 * correspond to the parts of a namespace declaration on an XML element.
 * For example, in the following XML fragment,
 * <pre class='fragment'>
&lt;annotation&gt;
    &lt;mysim:nodecolors xmlns:mysim='urn:lsid:mysim.org'
         mysim:bgcolor='green' mysim:fgcolor='white'/&gt;
&lt;/annotation&gt;
</pre>
 * there is one namespace declaration.  Its URI is
 * <code>urn:lsid:mysim.org</code> and its prefix is <code>mysim</code>.
 * This pair could be stored as one item in an {@link XMLNamespaces} list.
 <p>
 * {@link XMLNamespaces} provides various methods for manipulating the list of
 * prefix-URI pairs.  Individual namespaces stored in a given XMLNamespace
 * object instance can be retrieved based on their index using
 * {@link XMLNamespaces#getPrefix(int index)}, or by their characteristics such as
 * their URI or position in the list.
 */

public class XMLNamespaces {
   private long swigCPtr;
   protected boolean swigCMemOwn;

   protected XMLNamespaces(long cPtr, boolean cMemoryOwn)
   {
     swigCMemOwn = cMemoryOwn;
     swigCPtr    = cPtr;
   }

   protected static long getCPtr(XMLNamespaces obj)
   {
     return (obj == null) ? 0 : obj.swigCPtr;
   }

   protected static long getCPtrAndDisown (XMLNamespaces obj)
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
        libsbmlJNI.delete_XMLNamespaces(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  /**
   * Equality comparison method for XMLNamespaces.
   * <p>
   * Because the Java methods for libSBML are actually wrappers around code
   * implemented in C++ and C, certain operations will not behave as
   * expected.  Equality comparison is one such case.  An instance of a
   * libSBML object class is actually a <em>proxy object</em>
   * wrapping the real underlying C/C++ object.  The normal <code>==</code>
   * equality operator in Java will <em>only compare the Java proxy objects</em>,
   * not the underlying native object.  The result is almost never what you
   * want in practical situations.  Unfortunately, Java does not provide a
   * way to override <code>==</code>.
   *  <p>
   * The alternative that must be followed is to use the
   * <code>equals()</code> method.  The <code>equals</code> method on this
   * class overrides the default java.lang.Object one, and performs an
   * intelligent comparison of instances of objects of this class.  The
   * result is an assessment of whether two libSBML Java objects are truly 
   * the same underlying native-code objects.
   *  <p>
   * The use of this method in practice is the same as the use of any other
   * Java <code>equals</code> method.  For example,
   * <em>a</em><code>.equals(</code><em>b</em><code>)</code> returns
   * <code>true</code> if <em>a</em> and <em>b</em> are references to the
   * same underlying object.
   *
   * @param sb a reference to an object to which the current object
   * instance will be compared
   *
   * @return <code>true</code> if <code>sb</code> refers to the same underlying 
   * native object as this one, <code>false</code> otherwise
   */
  public boolean equals(Object sb)
  {
    if ( this == sb ) 
    {
      return true;
    }
    return swigCPtr == getCPtr((XMLNamespaces)(sb));
  }

  /**
   * Returns a hashcode for this XMLNamespaces object.
   *
   * @return a hash code usable by Java methods that need them.
   */
  public int hashCode()
  {
    return (int)(swigCPtr^(swigCPtr>>>32));
  }

  
/**
   * Creates a new empty list of XML namespace declarations.
   */ public
 XMLNamespaces() throws org.sbml.libsbml.XMLConstructorException {
    this(libsbmlJNI.new_XMLNamespaces__SWIG_0(), true);
  }

  
/**
   * Copy constructor; creates a copy of this {@link XMLNamespaces} list.
   <p>
   * @param orig the {@link XMLNamespaces} object to copy
   <p>
   * @throws XMLConstructorException
   * Thrown if the argument <code>orig</code> is <code>null.</code>
   */ public
 XMLNamespaces(XMLNamespaces orig) throws org.sbml.libsbml.XMLConstructorException {
    this(libsbmlJNI.new_XMLNamespaces__SWIG_1(XMLNamespaces.getCPtr(orig), orig), true);
  }

  
/**
   * Creates and returns a deep copy of this {@link XMLNamespaces} object.
   <p>
   * @return the (deep) copy of this {@link XMLNamespaces} object.
   */ public
 XMLNamespaces cloneObject() {
    long cPtr = libsbmlJNI.XMLNamespaces_cloneObject(swigCPtr, this);
    return (cPtr == 0) ? null : new XMLNamespaces(cPtr, true);
  }

  
/**
   * Appends an XML namespace prefix and URI pair to this list of namespace
   * declarations.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  If there is an XML namespace with the given <code>uri</code> prefix
   * in this list, then its corresponding URI will be overwritten by the
   * new <code>uri</code> unless the uri represents the core sbml namespace.
   * Calling programs could use one of the other {@link XMLNamespaces}
   * methods, such as
   * {@link XMLNamespaces#hasPrefix(String)} and 
   * {@link XMLNamespaces#hasURI(String)} to
   * inquire whether a given prefix and/or URI
   * is already present in this {@link XMLNamespaces} object.
   * If the <code>uri</code> represents the sbml namespaces then it will not be
   * overwritten, as this has potentially serious consequences. If it
   * is necessary to replace the sbml namespace the namespace should be removed
   * prior to adding the new namespace.
   <p>
   * @param uri a string, the uri for the namespace
   * @param prefix a string, the prefix for the namespace
   <p>
   * @return integer value indicating success/failure of the
   * function.   The possible values
   * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_INVALID_OBJECT LIBSBML_INVALID_OBJECT}
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_FAILED LIBSBML_OPERATION_FAILED}
   *
   * </ul> <p>
   * 
</dl><dl class="docnote"><dt><b>Documentation note:</b></dt><dd>
The native C++ implementation of this method defines a default argument
value. In the documentation generated for different libSBML language
bindings, you may or may not see corresponding arguments in the method
declarations. For example, in Java and C#, a default argument is handled by
declaring two separate methods, with one of them having the argument and
the other one lacking the argument. However, the libSBML documentation will
be <em>identical</em> for both methods. Consequently, if you are reading
this and do not see an argument even though one is described, please look
for descriptions of other variants of this method near where this one
appears in the documentation.
</dd></dl>
 
   */ public
 int add(String uri, String prefix) {
    return libsbmlJNI.XMLNamespaces_add__SWIG_0(swigCPtr, this, uri, prefix);
  }

  
/**
   * Appends an XML namespace prefix and URI pair to this list of namespace
   * declarations.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  If there is an XML namespace with the given <code>uri</code> prefix
   * in this list, then its corresponding URI will be overwritten by the
   * new <code>uri</code> unless the uri represents the core sbml namespace.
   * Calling programs could use one of the other {@link XMLNamespaces}
   * methods, such as
   * {@link XMLNamespaces#hasPrefix(String)} and 
   * {@link XMLNamespaces#hasURI(String)} to
   * inquire whether a given prefix and/or URI
   * is already present in this {@link XMLNamespaces} object.
   * If the <code>uri</code> represents the sbml namespaces then it will not be
   * overwritten, as this has potentially serious consequences. If it
   * is necessary to replace the sbml namespace the namespace should be removed
   * prior to adding the new namespace.
   <p>
   * @param uri a string, the uri for the namespace
   * @param prefix a string, the prefix for the namespace
   <p>
   * @return integer value indicating success/failure of the
   * function.   The possible values
   * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_INVALID_OBJECT LIBSBML_INVALID_OBJECT}
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_FAILED LIBSBML_OPERATION_FAILED}
   *
   * </ul> <p>
   * 
</dl><dl class="docnote"><dt><b>Documentation note:</b></dt><dd>
The native C++ implementation of this method defines a default argument
value. In the documentation generated for different libSBML language
bindings, you may or may not see corresponding arguments in the method
declarations. For example, in Java and C#, a default argument is handled by
declaring two separate methods, with one of them having the argument and
the other one lacking the argument. However, the libSBML documentation will
be <em>identical</em> for both methods. Consequently, if you are reading
this and do not see an argument even though one is described, please look
for descriptions of other variants of this method near where this one
appears in the documentation.
</dd></dl>
 
   */ public
 int add(String uri) {
    return libsbmlJNI.XMLNamespaces_add__SWIG_1(swigCPtr, this, uri);
  }

  
/**
   * Removes an XML Namespace stored in the given position of this list.
   <p>
   * @param index an integer, position of the namespace to remove.
   <p>
   * @return integer value indicating success/failure of the
   * function.   The possible values
   * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_INDEX_EXCEEDS_SIZE LIBSBML_INDEX_EXCEEDS_SIZE}
   * </ul>
   */ public
 int remove(int index) {
    return libsbmlJNI.XMLNamespaces_remove__SWIG_0(swigCPtr, this, index);
  }

  
/**
   * Removes an XML Namespace with the given prefix.
   <p>
   * @param prefix a string, prefix of the required namespace.
   <p>
   * @return integer value indicating success/failure of the
   * function.   The possible values
   * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_INDEX_EXCEEDS_SIZE LIBSBML_INDEX_EXCEEDS_SIZE}
   *
   * </ul> <p>
   * @see #remove(int index)
   */ public
 int remove(String prefix) {
    return libsbmlJNI.XMLNamespaces_remove__SWIG_1(swigCPtr, this, prefix);
  }

  
/**
   * Clears (deletes) all XML namespace declarations in this {@link XMLNamespaces}
   * object.
   <p>
   * @return integer value indicating success/failure of the
   * function. The possible values
   * returned by this function are:
   * <ul>
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_SUCCESS LIBSBML_OPERATION_SUCCESS}
   * <li> {@link libsbmlConstants#LIBSBML_OPERATION_FAILED LIBSBML_OPERATION_FAILED}
   *
   * </ul> <p>
   * @see #remove(int index)
   */ public
 int clear() {
    return libsbmlJNI.XMLNamespaces_clear(swigCPtr, this);
  }

  
/**
   * Look up the index of an XML namespace declaration by URI.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  If this {@link XMLNamespaces} object contains a pair with the given
   * URI <code>uri</code>, this method returns its index in the list.
   <p>
   * @param uri a string, the URI of the sought-after namespace.
   <p>
   * @return the index of the given declaration, or <code>-1</code> if not
   * present.
   */ public
 int getIndex(String uri) {
    return libsbmlJNI.XMLNamespaces_getIndex(swigCPtr, this, uri);
  }

  
/**
   * Tests whether the given uri is contained in this set of namespaces. 
   */ public
 boolean containsUri(String uri) {
    return libsbmlJNI.XMLNamespaces_containsUri(swigCPtr, this, uri);
  }

  
/**
   * Look up the index of an XML namespace declaration by prefix.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  If this {@link XMLNamespaces} object contains a pair with the given
   * prefix <code>prefix</code>, this method returns its index in the list.
   <p>
   * @param prefix a string, the prefix string of the sought-after
   * namespace
   <p>
   * @return the index of the given declaration, or <code>-1</code> if not
   * present.
   */ public
 int getIndexByPrefix(String prefix) {
    return libsbmlJNI.XMLNamespaces_getIndexByPrefix(swigCPtr, this, prefix);
  }

  
/**
   * Returns the total number of URI-and-prefix pairs stored in this
   * particular {@link XMLNamespaces} instance.
   <p>
   * @return the number of namespaces in this list.
   */ public
 int getLength() {
    return libsbmlJNI.XMLNamespaces_getLength(swigCPtr, this);
  }

  
/**
   * Returns the total number of URI-and-prefix pairs stored in this
   * particular {@link XMLNamespaces} instance.
   <p>
   * @return the number of namespaces in this list.
   <p>
   * This function is an alias for getLength introduced for consistency
   * with other XML classes.
   */ public
 int getNumNamespaces() {
    return libsbmlJNI.XMLNamespaces_getNumNamespaces(swigCPtr, this);
  }

  
/**
   * Look up the prefix of an XML namespace declaration by its position.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  This method returns the prefix of the <code>n</code>th
   * element in that list (if it exists).  Callers should use
   * {@link XMLAttributes#getLength()} first to find out how many namespaces are
   * stored in the list.
   <p>
   * @param index an integer, position of the sought-after prefix
   <p>
   * @return the prefix of an XML namespace declaration in this list (by
   * position), or an empty string if the <code>index</code> is out of range
   <p>
   * @see #getLength()
   */ public
 String getPrefix(int index) {
    return libsbmlJNI.XMLNamespaces_getPrefix__SWIG_0(swigCPtr, this, index);
  }

  
/**
   * Look up the prefix of an XML namespace declaration by its URI.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  This method returns the prefix for a pair that has the
   * given <code>uri</code>.
   <p>
   * @param uri a string, the URI of the prefix being sought
   <p>
   * @return the prefix of an XML namespace declaration given its URI, or
   * an empty string if no such <code>uri</code> exists in this {@link XMLNamespaces} object
   */ public
 String getPrefix(String uri) {
    return libsbmlJNI.XMLNamespaces_getPrefix__SWIG_1(swigCPtr, this, uri);
  }

  
/**
   * Look up the URI of an XML namespace declaration by its position.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  This method returns the URI of the <code>n</code>th element
   * in that list (if it exists).  Callers should use
   * {@link XMLAttributes#getLength()} first to find out how many namespaces are
   * stored in the list.
   <p>
   * @param index an integer, position of the required URI.
   <p>
   * @return the URI of an XML namespace declaration in this list (by
   * position), or an empty string if the <code>index</code> is out of range.
   <p>
   * @see #getLength()
   */ public
 String getURI(int index) {
    return libsbmlJNI.XMLNamespaces_getURI__SWIG_0(swigCPtr, this, index);
  }

  
/**
   * Look up the URI of an XML namespace declaration by its prefix.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  This method returns the namespace URI for a pair that has
   * the given <code>prefix</code>.
   <p>
   * @param prefix a string, the prefix of the required URI
   <p>
   * @return the URI of an XML namespace declaration having the given 
   * <code>prefix</code>, or an empty string if no such prefix-and-URI pair exists
   * in this {@link XMLNamespaces} object
   <p>
   * 
</dl><dl class="docnote"><dt><b>Documentation note:</b></dt><dd>
The native C++ implementation of this method defines a default argument
value. In the documentation generated for different libSBML language
bindings, you may or may not see corresponding arguments in the method
declarations. For example, in Java and C#, a default argument is handled by
declaring two separate methods, with one of them having the argument and
the other one lacking the argument. However, the libSBML documentation will
be <em>identical</em> for both methods. Consequently, if you are reading
this and do not see an argument even though one is described, please look
for descriptions of other variants of this method near where this one
appears in the documentation.
</dd></dl>
 
   <p>
   * @see #getURI()
   */ public
 String getURI(String prefix) {
    return libsbmlJNI.XMLNamespaces_getURI__SWIG_1(swigCPtr, this, prefix);
  }

  
/**
   * Look up the URI of an XML namespace declaration by its prefix.
   <p>
   * An {@link XMLNamespaces} object stores a list of pairs of namespaces and their
   * prefixes.  This method returns the namespace URI for a pair that has
   * the given <code>prefix</code>.
   <p>
   * @param prefix a string, the prefix of the required URI
   <p>
   * @return the URI of an XML namespace declaration having the given 
   * <code>prefix</code>, or an empty string if no such prefix-and-URI pair exists
   * in this {@link XMLNamespaces} object
   <p>
   * 
</dl><dl class="docnote"><dt><b>Documentation note:</b></dt><dd>
The native C++ implementation of this method defines a default argument
value. In the documentation generated for different libSBML language
bindings, you may or may not see corresponding arguments in the method
declarations. For example, in Java and C#, a default argument is handled by
declaring two separate methods, with one of them having the argument and
the other one lacking the argument. However, the libSBML documentation will
be <em>identical</em> for both methods. Consequently, if you are reading
this and do not see an argument even though one is described, please look
for descriptions of other variants of this method near where this one
appears in the documentation.
</dd></dl>
 
   <p>
   * @see #getURI()
   */ public
 String getURI() {
    return libsbmlJNI.XMLNamespaces_getURI__SWIG_2(swigCPtr, this);
  }

  
/**
   * Predicate returning <code>true</code> or <code>false</code> depending on whether this
   * {@link XMLNamespaces} list is empty.
   <p>
   * @return <code>true</code> if this {@link XMLNamespaces} list is empty, <code>false</code> otherwise.
   */ public
 boolean isEmpty() {
    return libsbmlJNI.XMLNamespaces_isEmpty(swigCPtr, this);
  }

  
/**
   * Predicate returning <code>true</code> or <code>false</code> depending on whether an XML
   * Namespace with the given URI is contained in this {@link XMLNamespaces} list.
   <p>
   * @param uri a string, the uri for the namespace
   <p>
   * @return <code>true</code> if an XML Namespace with the given URI is contained in
   * this {@link XMLNamespaces} list, <code>false</code> otherwise.
   */ public
 boolean hasURI(String uri) {
    return libsbmlJNI.XMLNamespaces_hasURI(swigCPtr, this, uri);
  }

  
/**
   * Predicate returning <code>true</code> or <code>false</code> depending on whether an XML
   * Namespace with the given prefix is contained in this {@link XMLNamespaces}
   * list.
   <p>
   * @param prefix a string, the prefix for the namespace
   <p>
   * @return <code>true</code> if an XML Namespace with the given URI is contained in
   * this {@link XMLNamespaces} list, <code>false</code> otherwise.
   */ public
 boolean hasPrefix(String prefix) {
    return libsbmlJNI.XMLNamespaces_hasPrefix(swigCPtr, this, prefix);
  }

  
/**
   * Predicate returning <code>true</code> or <code>false</code> depending on whether an XML
   * Namespace with the given URI and prefix pair is contained in this
   * {@link XMLNamespaces} list.
   <p>
   * @param uri a string, the URI for the namespace
   * @param prefix a string, the prefix for the namespace
   <p>
   * @return <code>true</code> if an XML Namespace with the given uri/prefix pair is
   * contained in this {@link XMLNamespaces} list, <code>false</code> otherwise.
   */ public
 boolean hasNS(String uri, String prefix) {
    return libsbmlJNI.XMLNamespaces_hasNS(swigCPtr, this, uri, prefix);
  }

}
