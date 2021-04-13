import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'sdk.g.dart';

@JsonSerializable()
class CardConfigSdk {
  final String issuerName;
  final String acquirerName;
  final String series;
  final int startNumber;
  final int count;
  final List<int> pin;
  final List<int> pin2;
  final List<int> pin3;
  final String hexCrExKey;
  final String cvc;
  final int pauseBeforePin2;
  final bool smartSecurityDelay;
  final String curveID;
  final SigningMethodMaskSdk signingMethods;
  final int maxSignatures;
  final bool isReusable;
  final bool allowSetPIN1;
  final bool allowSetPIN2;
  final bool useActivation;
  final bool useCvc;
  final bool useNDEF;
  final bool useDynamicNDEF;
  final bool useOneCommandAtTime;
  final bool useBlock;
  final bool allowSelectBlockchain;
  final bool prohibitPurgeWallet;
  final bool allowUnencrypted;
  final bool allowFastEncryption;
  final bool protectIssuerDataAgainstReplay;
  final bool prohibitDefaultPIN1;
  final bool disablePrecomputedNDEF;
  final bool skipSecurityDelayIfValidatedByIssuer;
  final bool skipCheckPIN2CVCIfValidatedByIssuer;
  final bool skipSecurityDelayIfValidatedByLinkedTerminal;
  final bool restrictOverwriteIssuerExtraData;
  final bool requireTerminalTxSignature;
  final bool requireTerminalCertSignature;
  final bool checkPIN3OnCard;
  final bool createWallet;
  final CardDataSdk cardData;
  final List<NdefRecordSdk> ndefRecords;

  CardConfigSdk({
    this.issuerName,
    this.acquirerName,
    this.series,
    this.startNumber,
    this.count,
    this.pin,
    this.pin2,
    this.pin3,
    this.hexCrExKey,
    this.cvc,
    this.pauseBeforePin2,
    this.smartSecurityDelay,
    this.curveID,
    this.signingMethods,
    this.maxSignatures,
    this.isReusable,
    this.allowSetPIN1,
    this.allowSetPIN2,
    this.useActivation,
    this.useCvc,
    this.useNDEF,
    this.useDynamicNDEF,
    this.useOneCommandAtTime,
    this.useBlock,
    this.allowSelectBlockchain,
    this.prohibitPurgeWallet,
    this.allowUnencrypted,
    this.allowFastEncryption,
    this.protectIssuerDataAgainstReplay,
    this.prohibitDefaultPIN1,
    this.disablePrecomputedNDEF,
    this.skipSecurityDelayIfValidatedByIssuer,
    this.skipCheckPIN2CVCIfValidatedByIssuer,
    this.skipSecurityDelayIfValidatedByLinkedTerminal,
    this.restrictOverwriteIssuerExtraData,
    this.requireTerminalTxSignature,
    this.requireTerminalCertSignature,
    this.checkPIN3OnCard,
    this.createWallet,
    this.cardData,
    this.ndefRecords,
  });

  factory CardConfigSdk.fromJson(Map<String, dynamic> json) => _$CardConfigSdkFromJson(json);

  Map<String, dynamic> toJson() => _$CardConfigSdkToJson(this);
}

@JsonSerializable()
class CardDataSdk {
  final String issuerName;
  final String batchId;
  final String blockchainName;
  @JsonKey(includeIfNull: false)
  final String tokenSymbol;
  @JsonKey(includeIfNull: false)
  final String tokenContractAddress;
  @JsonKey(includeIfNull: false)
  final int tokenDecimal;
  @JsonKey(includeIfNull: false)
  final List<int> manufacturerSignature;
  final String manufactureDateTime;
  final ProductMaskSdk productMask;

  CardDataSdk({
    this.productMask,
    this.issuerName,
    this.manufacturerSignature,
    this.batchId,
    this.blockchainName,
    this.manufactureDateTime,
    this.tokenSymbol,
    this.tokenContractAddress,
    this.tokenDecimal,
  });

  factory CardDataSdk.fromJson(Map<String, dynamic> json) => _$CardDataSdkFromJson(json);

  Map<String, dynamic> toJson() => _$CardDataSdkToJson(this);
}

@JsonSerializable()
class SigningMethodMaskSdk {
  final int rawValue;

  SigningMethodMaskSdk(this.rawValue);

  factory SigningMethodMaskSdk.fromJson(Map<String, dynamic> json) => _$SigningMethodMaskSdkFromJson(json);

  Map<String, dynamic> toJson() => _$SigningMethodMaskSdkToJson(this);
}

class KeyPairSdk{
  final Uint8List publicKey;
  final Uint8List privateKey;

  KeyPairSdk(this.publicKey, this.privateKey);

  factory KeyPairSdk.fromJson(Map<String, dynamic> json) => _$KeyPairSdkFromJson(json);

  Map<String, dynamic> toJson() => _$KeyPairSdkToJson(this);

  Map<String, dynamic> _$KeyPairSdkToJson(
      KeyPairSdk instance) =>
      <String, dynamic>{
        'privateKey': instance.privateKey,
        'privateKey': instance.privateKey,
      };
}


KeyPairSdk _$KeyPairSdkFromJson(Map<String, dynamic> json) {
  return KeyPairSdk(
    Uint8List.fromList(json['publicKey'] ?? []),
    Uint8List.fromList(json['privateKey'] ?? []),
  );
}

@JsonSerializable()
class ManufacturerSdk{
  final KeyPairSdk keyPairSdk;
  final String name;

  ManufacturerSdk(this.keyPairSdk, this.name);

  factory ManufacturerSdk.fromJson(Map<String, dynamic> json) => _$ManufacturerSdkFromJson(json);

  Map<String, dynamic> toJson() => _$ManufacturerSdkToJson(this);
}

@JsonSerializable()
class AcquirerSdk{
  final KeyPairSdk keyPairSdk;
  final String name;
  final String id;

  AcquirerSdk(this.keyPairSdk, this.name, this.id);

  factory AcquirerSdk.fromJson(Map<String, dynamic> json) => _$AcquirerSdkFromJson(json);

  Map<String, dynamic> toJson() => _$AcquirerSdkToJson(this);
}
@JsonSerializable()
class IssuerSdk{
  final String name;
  final String id;
  final KeyPairSdk dataKeyPair;
  final KeyPairSdk transactionKeyPair;

  IssuerSdk(this.name, this.id, this.dataKeyPair, this.transactionKeyPair);

  factory IssuerSdk.fromJson(Map<String, dynamic> json) => _$IssuerSdkFromJson(json);

  Map<String, dynamic> toJson() => _$IssuerSdkToJson(this);
}
@JsonSerializable()
class ProductMaskSdk {
  final int rawValue;

  ProductMaskSdk(this.rawValue);

  factory ProductMaskSdk.fromJson(Map<String, dynamic> json) => _$ProductMaskSdkFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMaskSdkToJson(this);
}

@JsonSerializable()
class NdefRecordSdk {
  final String type;
  final String value;

  NdefRecordSdk({this.type, this.value});

  factory NdefRecordSdk.fromJson(Map<String, dynamic> json) => _$NdefRecordSdkFromJson(json);

  Map<String, dynamic> toJson() => _$NdefRecordSdkToJson(this);
}

enum PinType { PIN1, PIN2, PIN3 }
