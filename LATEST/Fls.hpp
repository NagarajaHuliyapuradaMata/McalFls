#pragma once
/******************************************************************************/
/* File   : Fls.hpp                                                           */
/* Author : NAGARAJA HM (c) since 1982. All rights reserved.                  */
/******************************************************************************/

/******************************************************************************/
/* #INCLUDES                                                                  */
/******************************************************************************/
#include "CfgFls.hpp"
#include "Fls_core.hpp"
#include "infFls_Exp.hpp"

/******************************************************************************/
/* #DEFINES                                                                   */
/******************************************************************************/

/******************************************************************************/
/* MACROS                                                                     */
/******************************************************************************/

/******************************************************************************/
/* TYPEDEFS                                                                   */
/******************************************************************************/
class module_Fls:
      INTERFACES_EXPORTED_FLS
      public abstract_module
   ,  public class_Fls_Functionality
{
   private:
/******************************************************************************/
/* OBJECTS                                                                    */
/******************************************************************************/

   public:
/******************************************************************************/
/* FUNCTIONS                                                                  */
/******************************************************************************/
      FUNC(void, FLS_CODE) InitFunction(
         CONSTP2CONST(CfgModule_TypeAbstract, FLS_CONFIG_DATA, FLS_APPL_CONST) lptrCfgModule
      );
      FUNC(void, FLS_CODE) DeInitFunction (void);
      FUNC(void, FLS_CODE) MainFunction   (void);
      FLS_CORE_FUNCTIONALITIES
};

/******************************************************************************/
/* CONSTS                                                                     */
/******************************************************************************/

/******************************************************************************/
/* PARAMS                                                                     */
/******************************************************************************/

/******************************************************************************/
/* OBJECTS                                                                    */
/******************************************************************************/
extern VAR(module_Fls, FLS_VAR) Fls;

/******************************************************************************/
/* EOF                                                                        */
/******************************************************************************/

