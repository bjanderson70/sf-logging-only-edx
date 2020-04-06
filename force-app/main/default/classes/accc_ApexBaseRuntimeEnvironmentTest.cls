/**
 * Copyright (c) 2016-2018, Bill Anderson.  All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *   * Redistributions of source code must retain the above copyright
 *     notice, this list of conditions and the following disclaimer.
 *
 *   * Redistributions in binary form must reproduce the above copyright
 *     notice, this list of conditions and the following disclaimer in
 *     the documentation and/or other materials provided with the
 *     distribution.
 *
 *   * Neither the name of Bill Anderson nor the names of its
 *     contributors may be used to endorse or promote products derived
 *     from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 *
 * @author Bill Anderson
 * @description Test the apex base runtime environment
 *
 *  NOTE: This is an abbreviate version: Cahcing, Cache Strategy and Messaging were removed
 *
 * @group Common Test Layer
 */
@isTest
private class accc_ApexBaseRuntimeEnvironmentTest {

    private static accc_IApexRunEnvironment theEnvironment = null;

    //
    // test equals for validity
    //
    @isTest static void testMethodsValidity() {
        accc_IApexRunEnvironment env = accc_ApexBaseRuntimeEnvironmentTest.getTheEnvironment();
        accc_IConfigurationProvider provider = env.provider();
        accc_ILogger logger = env.logger();
        accc_IFallbackResources fallback = env.fallbackResources();
        accc_IApexFactory factory = env.objectFactory();
        accc_IApexExceptionHandler excpHandler = env.exceptionhandler();
        accc_IPreviousTransactionResult trResult = env.transactionResult();


        system.assertEquals(accc_ApexTestUtilities.isProvider(provider), true);
        system.assertEquals(accc_ApexTestUtilities.isLogger(logger), true);
        system.assertEquals(accc_ApexTestUtilities.isFallback(fallback), true);
        system.assertEquals(accc_ApexTestUtilities.isExceptionHandler(excpHandler), true);
        system.assertEquals(accc_ApexTestUtilities.isFactory(factory), true);
        system.assertEquals(accc_ApexTestUtilities.isPreviousTransactionResult(trResult),  true);

    } // end of testMethodsValidity

    // test not equals
    @isTest static void testMethodsInValid() {
        accc_IApexRunEnvironment env = accc_ApexBaseRuntimeEnvironmentTest.getTheEnvironment();
        accc_IConfigurationProvider provider = env.provider();
        accc_ILogger logger = env.logger();
        accc_IFallbackResources fallback = env.fallbackResources();
        accc_IApexFactory factory = env.objectFactory();
        accc_IApexExceptionHandler excpHandler = env.exceptionhandler();
        accc_IPreviousTransactionResult trResult = env.transactionResult();

        system.assertNotEquals(accc_ApexTestUtilities.isLogger(provider), true);
        system.assertNotEquals(accc_ApexTestUtilities.isProvider(logger), true);
        system.assertNotEquals(accc_ApexTestUtilities.isFactory(fallback), true);
        system.assertNotEquals(accc_ApexTestUtilities.isExceptionHandler(factory), true);
        system.assertNotEquals(accc_ApexTestUtilities.isFallback(excpHandler), true);
        system.assertNotEquals(accc_ApexTestUtilities.isProvider(trResult), true);

    } // end of testMethodsInValid

    //
    // test valid types/class
    //
    @isTest static void testSetMethodsAreValid() {
        accc_IApexRunEnvironment env = accc_ApexBaseRuntimeEnvironmentTest.getTheEnvironment();
        env.provider(null);
        accc_IConfigurationProvider provider = env.provider();
        env.logger(null);
        accc_ILogger logger = env.logger();
        env.fallbackResources(null);
        accc_IFallbackResources fallback = env.fallbackResources();
        env.objectFactory(null);
        accc_IApexFactory factory = env.objectFactory();
        env.exceptionhandler(null);
        accc_IApexExceptionHandler excpHandler = env.exceptionhandler();
        env.transactionResult(null);
        accc_IPreviousTransactionResult trResult = env.transactionResult();


        system.assertNotEquals(accc_ApexTestUtilities.isLogger(provider), true);
        system.assertNotEquals(accc_ApexTestUtilities.isProvider(logger), true);
        system.assertNotEquals(accc_ApexTestUtilities.isFactory(fallback), true);
        system.assertNotEquals(accc_ApexTestUtilities.isLogger(factory), true);
        system.assertNotEquals(accc_ApexTestUtilities.isProvider(excpHandler), true);
        system.assertNotEquals(accc_ApexTestUtilities.isLogger(trResult), true);

    } // end of testSetMethodsAreValid

    @isTest
    static void testPublicGetters() {
        accc_ApexBaseRuntimeEnvironment env = new accc_ApexBaseRuntimeEnvironment();
        Map<String, Object> getters = new Map<String, Object> {
            'accc_IApexFactory' => env.objectFactory(),
            'accc_IFallbackResources' => env.fallbackResources(),
            'accc_IApexExceptionHandler' => env.exceptionHandler(),
            'accc_IConfigurationProvider' => env.provider(),
            'accc_ILogger' => env.logger(),
            'accc_IPreviousTransactionResult' => env.transactionResult()

        };
        for ( String key : getters.keyset()) {
            System.assertNotEquals(null, getters.get(key), ' Error :' + key + ' was NULL');
        }
    } // end of testPublicGetters

    @isTest
    static void testProtectedGetters() {
        accc_ApexBaseRuntimeEnvironment env = new accc_ApexBaseRuntimeEnvironment();
        Map<String, Object> getters = new Map<String, Object> {
            'accc_IApexFactory' => env.theFactory,
            'accc_IFallbackResources' => env.theResource,
            'accc_IApexExceptionHandler' => env.theExceptionHandler,
            'accc_IConfigurationProvider' => env.theProvider,
            'accc_ILogger' => env.theLogger,
            'accc_IPreviousTransactionResult' => env.thePreviousTransactionResult

        };
        for ( String key : getters.keyset()) {
            System.assertEquals(null, getters.get(key), ' Error :' + key + ' is NOT NULL');
        }
    } // end of testProtectedGetters
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    // PRIVATE FUNCTIONs
    /////////////////////////////////////////////////////////////////////////////////////////////////////
    //
    // Get the environment we are testing
    //
    private static accc_IApexRunEnvironment getTheEnvironment() {

        if ( accc_ApexBaseRuntimeEnvironmentTest.theEnvironment == null ) {
            // need to ensure the ApexTestFactory is used as it includes
            // resources not found in the ApexFactory which is used in 'accc_ApexBaseRuntimeEnvironment'
            //
            accc_IApexFactory testFactory = new accc_ApexTestObjectFactory();
            accc_IFallbackResources testFallback = (accc_IFallbackResources)testFactory.create(accc_ApexTestUtilities.FallbackTestResource);
            accc_ApexBaseRuntimeEnvironmentTest.theEnvironment = new accc_ApexBaseRuntimeEnvironment();
            accc_ApexBaseRuntimeEnvironmentTest.theEnvironment.objectFactory(testFactory);
            accc_ApexBaseRuntimeEnvironmentTest.theEnvironment.fallbackResources(testFallback);
        }

        return accc_ApexBaseRuntimeEnvironmentTest.theEnvironment;
    } // end of getTheEnvironment

} // end of accc_ApexBaseRuntimeEnvironmentTest