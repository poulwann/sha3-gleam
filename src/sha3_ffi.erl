-module(sha3_ffi).
-export([hash_sha3_224/1, hash_sha3_256/1, hash_sha3_384/1, hash_sha3_512/1]).

hash_sha3_224(Data) ->
    try
        Hash = crypto:hash(sha3_224, Data),
        {ok, Hash}
    catch
        error:Reason ->
            {error, atom_to_binary(Reason)}
    end.

hash_sha3_256(Data) ->
    try
        Hash = crypto:hash(sha3_256, Data),
        {ok, Hash}
    catch
        error:Reason ->
            {error, atom_to_binary(Reason)}
    end.

hash_sha3_384(Data) ->
    try
        Hash = crypto:hash(sha3_384, Data),
        {ok, Hash}
    catch
        error:Reason ->
            {error, atom_to_binary(Reason)}
    end.

hash_sha3_512(Data) ->
    try
        Hash = crypto:hash(sha3_512, Data),
        {ok, Hash}
    catch
        error:Reason ->
            {error, atom_to_binary(Reason)}
    end.