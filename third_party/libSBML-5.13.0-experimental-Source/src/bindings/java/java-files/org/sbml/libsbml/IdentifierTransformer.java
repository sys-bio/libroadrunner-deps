/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 2.0.6
 *
 * Do not make changes to this file unless you know what you are doing--modify
 * the SWIG interface file instead.
 * ----------------------------------------------------------------------------- */

package org.sbml.libsbml;

/** 
 *  Base class for identifier transformers.
 * @internal
 */

public class IdentifierTransformer {
   private long swigCPtr;
   protected boolean swigCMemOwn;

   protected IdentifierTransformer(long cPtr, boolean cMemoryOwn)
   {
     swigCMemOwn = cMemoryOwn;
     swigCPtr    = cPtr;
   }

   protected static long getCPtr(IdentifierTransformer obj)
   {
     return (obj == null) ? 0 : obj.swigCPtr;
   }

   protected static long getCPtrAndDisown (IdentifierTransformer obj)
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
        libsbmlJNI.delete_IdentifierTransformer(swigCPtr);
      }
      swigCPtr = 0;
    }
  }

  protected void swigDirectorDisconnect() {
    swigCMemOwn = false;
    delete();
  }

  public void swigReleaseOwnership() {
    swigCMemOwn = false;
    libsbmlJNI.IdentifierTransformer_change_ownership(this, swigCPtr, false);
  }

  public void swigTakeOwnership() {
    swigCMemOwn = true;
    libsbmlJNI.IdentifierTransformer_change_ownership(this, swigCPtr, true);
  }

  public IdentifierTransformer() {
    this(libsbmlJNI.new_IdentifierTransformer(), true);
    libsbmlJNI.IdentifierTransformer_director_connect(this, swigCPtr, swigCMemOwn, true);
  }

  public int transform(SBase element) {
    return (getClass() == IdentifierTransformer.class) ? libsbmlJNI.IdentifierTransformer_transform(swigCPtr, this, SBase.getCPtr(element), element) : libsbmlJNI.IdentifierTransformer_transformSwigExplicitIdentifierTransformer(swigCPtr, this, SBase.getCPtr(element), element);
  }

}
