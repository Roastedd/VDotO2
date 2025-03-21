// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$socialPostsHash() => r'b798656b88539131321c600f2e06d23433fe4254';

/// Provider for social posts
///
/// Copied from [socialPosts].
@ProviderFor(socialPosts)
final socialPostsProvider =
    AutoDisposeStreamProvider<List<SocialPost>>.internal(
  socialPosts,
  name: r'socialPostsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$socialPostsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SocialPostsRef = AutoDisposeStreamProviderRef<List<SocialPost>>;
String _$postCommentsHash() => r'd30db87158e0016fd9ff5fc1553b61efd4b28e16';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Provider for post comments
///
/// Copied from [postComments].
@ProviderFor(postComments)
const postCommentsProvider = PostCommentsFamily();

/// Provider for post comments
///
/// Copied from [postComments].
class PostCommentsFamily extends Family<AsyncValue<List<Comment>>> {
  /// Provider for post comments
  ///
  /// Copied from [postComments].
  const PostCommentsFamily();

  /// Provider for post comments
  ///
  /// Copied from [postComments].
  PostCommentsProvider call(
    String postId,
  ) {
    return PostCommentsProvider(
      postId,
    );
  }

  @override
  PostCommentsProvider getProviderOverride(
    covariant PostCommentsProvider provider,
  ) {
    return call(
      provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'postCommentsProvider';
}

/// Provider for post comments
///
/// Copied from [postComments].
class PostCommentsProvider extends AutoDisposeStreamProvider<List<Comment>> {
  /// Provider for post comments
  ///
  /// Copied from [postComments].
  PostCommentsProvider(
    String postId,
  ) : this._internal(
          (ref) => postComments(
            ref as PostCommentsRef,
            postId,
          ),
          from: postCommentsProvider,
          name: r'postCommentsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCommentsHash,
          dependencies: PostCommentsFamily._dependencies,
          allTransitiveDependencies:
              PostCommentsFamily._allTransitiveDependencies,
          postId: postId,
        );

  PostCommentsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final String postId;

  @override
  Override overrideWith(
    Stream<List<Comment>> Function(PostCommentsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostCommentsProvider._internal(
        (ref) => create(ref as PostCommentsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Comment>> createElement() {
    return _PostCommentsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCommentsProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostCommentsRef on AutoDisposeStreamProviderRef<List<Comment>> {
  /// The parameter `postId` of this provider.
  String get postId;
}

class _PostCommentsProviderElement
    extends AutoDisposeStreamProviderElement<List<Comment>>
    with PostCommentsRef {
  _PostCommentsProviderElement(super.provider);

  @override
  String get postId => (origin as PostCommentsProvider).postId;
}

String _$socialServiceHash() => r'f0861eadc68f92af9080492ea493e82393a3cc62';

/// Provider for social service
///
/// Copied from [SocialService].
@ProviderFor(SocialService)
final socialServiceProvider =
    AutoDisposeStreamNotifierProvider<SocialService, List<SocialPost>>.internal(
  SocialService.new,
  name: r'socialServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$socialServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SocialService = AutoDisposeStreamNotifier<List<SocialPost>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
