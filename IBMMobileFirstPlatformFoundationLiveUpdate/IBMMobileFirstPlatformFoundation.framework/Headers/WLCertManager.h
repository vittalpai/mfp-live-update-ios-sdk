/*
 * Licensed Materials - Property of IBM
 * 5725-I43 (C) Copyright IBM Corp. 2006, 2013. All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or
 * disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import "WLASN1Parser.h"
#import "WLCertManagerCommon.h"

@interface WLCertManager : NSObject <WLASN1ParserDelegate>

/**
 * Save an x509 certificate to the keychain.
 * certificate - NSData representation of the certificate
 */
+(void) saveCertificate:(NSData *) certificateData withLabel:(NSData *)certificateLabel;

/**
 * Checks to see if a certificate with a specific label exists in the keychain.
 */
+(BOOL) isCertificateExist:(NSData *)certificateLabel;

/**
 * Checks to see if a certificate with a specific label exists in the keychain and that it is a valid certificate.
 */
+(BOOL) doesValidCertificateExist:(NSData *)certificateLabel;

/**
 *
 * Signs the header and payload with SHA256 / RSA 512
 * csrPayload- NSMutableDictionary with the content sign on.
 * return - the signed string.
 *
 */
+ (NSString *) signJWSPartsWithPayload:(NSDictionary *)payloadJSON withPrivateKeyLabel:(NSData *)privateKeyLabel
                    withPublicKeyLabel:(NSData *)publicKeyLabel withKeySize:(NSNumber *)keySizeInBits;

/**
 *
 * Signs the header and payload with SHA256 / RSA 512
 * csrPayload- NSMutableDictionary with the content sign on.
 * additional param - signer KeyId
 * return - the signed string.
 *
 */
+ (NSString *) signJWSPartsWithPayload:(NSDictionary *)payloadJSON withPrivateKeyLabel:(NSData *)privateKeyLabel
                    withPublicKeyLabel:(NSData *)publicKeyLabel withKeySize:(NSNumber *)keySizeInBits bySigner:(NSString *) kid;

// KeyChain Utility methods

/**
 * Returns a SecKeyRef representation of a key that matches the keychainTag
 */
+ (SecKeyRef)getKeyChainKeyRef:(NSData *) keychainTag;

/**
 * Returns an NSArray of identities in the keychain matching specified attribute label.
 */
+(NSArray*) getSecIdentityRefs:(NSString *)identityLabel;

/**
 * Sign payload with privateKey
 */
+ (NSData *) signData:(NSString *)paylaod privateKey:(SecKeyRef)privateKey;

/**
 * Remove certificate specified by certificateLabel from keychain
 */
+(BOOL) removeCertificate:(NSData *)certificateLabel;

/**
 * Remove key specified by keyTag from keychain
 */
+(BOOL) removeKey:(NSData *)keyTag;

/**
 * Convenience method to clear the keychain.
 */
+(BOOL) clearKeychain;

+(NSString *) createX509Csr:(NSDictionary *)csrDetailsJSON withPrivateKeyLabel:(NSData *)privateKeyLabel withPublicKeyLabel:(NSData *)publicKeyLabel withKeySize:(NSNumber *)keySizeInBits;
+(NSString *) generateKeyPairAndSignCsr:(NSDictionary *)payloadJSON withPrivateKeyLabel:(NSData *)privateKeyLabel
                     withPublicKeyLabel:(NSData *)publicKeyLabel withKeySize:(NSNumber *)keySizeInBits;

@end
