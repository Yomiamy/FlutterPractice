class CacheConfig {
  final bool? enabled;
  final int? maxAge;
  final int? maxCount;

  CacheConfig({
    this.enabled,
    this.maxAge,
    this.maxCount,
  });

  factory CacheConfig.fromJson(Map<String, dynamic> json) {
    return CacheConfig(
      enabled: json['enabled'] as bool?,
      maxAge: json['maxAge'] as int?,
      maxCount: json['maxCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enabled': enabled,
      'maxAge': maxAge,
      'maxCount': maxCount,
    };
  }
}