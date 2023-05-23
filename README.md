Store transaction:info= BytecodeInfo { bytecode: Module(CompiledModule { version: 4, self_module_handle_idx: ModuleHandleIndex(0), module_handles: [ModuleHandle { address: AddressIdentifierIndex(0), name: IdentifierIndex(0) }, ModuleHandle { address: AddressIdentifierIndex(1), name: IdentifierIndex(1) }, ModuleHandle { address: AddressIdentifierIndex(0), name: IdentifierIndex(2) }, ModuleHandle { address: AddressIdentifierIndex(0), name: IdentifierIndex(3) }, ModuleHandle { address: AddressIdentifierIndex(0), name: IdentifierIndex(4) }], struct_handles: [], function_handles: [FunctionHandle { module: ModuleHandleIndex(0), name: IdentifierIndex(5), parameters: SignatureIndex(0), return_: SignatureIndex(1), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(0), name: IdentifierIndex(6), parameters: SignatureIndex(0), return_: SignatureIndex(1), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(0), name: IdentifierIndex(7), parameters: SignatureIndex(1), return_: SignatureIndex(1), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(0), name: IdentifierIndex(8), parameters: SignatureIndex(2), return_: SignatureIndex(1), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(4), name: IdentifierIndex(9), parameters: SignatureIndex(4), return_: SignatureIndex(1), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(1), name: IdentifierIndex(10), parameters: SignatureIndex(5), return_: SignatureIndex(6), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(4), name: IdentifierIndex(11), parameters: SignatureIndex(6), return_: SignatureIndex(3), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(3), name: IdentifierIndex(12), parameters: SignatureIndex(2), return_: SignatureIndex(3), type_parameters: [] }, FunctionHandle { module: ModuleHandleIndex(2), name: IdentifierIndex(13), parameters: SignatureIndex(7), return_: SignatureIndex(1), type_parameters: [] }], field_handles: [], friend_decls: [], struct_def_instantiations: [], function_instantiations: [], field_instantiations: [], signatures: [Signature([Signer, U64, U64]), Signature([]), Signature([U64, U64]), Signature([U64]), Signature([Reference(Signer), U64, U64]), Signature([Reference(Signer)]), Signature([Address]), Signature([Reference(Signer), U64])], identifiers: [Identifier("ScriptBook"), Identifier("Signer"), Identifier("EventProxy"), Identifier("Math"), Identifier("Storage"), Identifier("store_sum_func"), Identifier("sum_func"), Identifier("test"), Identifier("test2"), Identifier("store_sum"), Identifier("address_of"), Identifier("get_sum"), Identifier("add"), Identifier("emit_event")], address_identifiers: [D43593C715FDD31C61141ABD04A99FD6822C8558854CCDE39A5684E7A56DA27D, 0000000000000000000000000000000000000000000000000000000000000001], constant_pool: [], struct_defs: [], function_defs: [FunctionDefinition { function: FunctionHandleIndex(0), visibility: Script, acquires_global_resources: [], code: Some(CodeUnit { locals: SignatureIndex(3), code: [ImmBorrowLoc(0), CopyLoc(1), CopyLoc(2), Call(4), ImmBorrowLoc(0), Call(5), Call(6), StLoc(3), MoveLoc(1), MoveLoc(2), Add, MoveLoc(3), Eq, BrTrue(16), LdU64(101), Abort, Ret] }) }, FunctionDefinition { function: FunctionHandleIndex(1), visibility: Script, acquires_global_resources: [], code: Some(CodeUnit { locals: SignatureIndex(3), code: [MoveLoc(1), MoveLoc(2), Call(7), StLoc(3), ImmBorrowLoc(0), MoveLoc(3), Call(8), Ret] }) }, FunctionDefinition { function: FunctionHandleIndex(2), visibility: Script, acquires_global_resources: [], code: Some(CodeUnit { locals: SignatureIndex(1), code: [Ret] }) }, FunctionDefinition { function: FunctionHandleIndex(3), visibility: Script, acquires_global_resources: [], code: Some(CodeUnit { locals: SignatureIndex(1), code: [MoveLoc(0), MoveLoc(1), Add, LdU64(5), Eq, BrTrue(8), LdU64(101), Abort, Ret] }) }] }, BytecodeRef("/Users/lisheng/mygit/move/testmove/my_modules/build/my/bytecode_modules/ScriptBook.mv", Module)) }




```bash
dove view "gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::Storage::Store<u64>" --api "http://127.0.0.1:9933"
dove view "Alice::Storage::Sum" --api "http://127.0.0.1:9933"
dove view "0x1::Account::Balance<0x1::PONT::T>" --api "http://127.0.0.1:9933"
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::store_sum_func'  --args 3 9 --url "http://127.0.0.1:9933"
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::store_sum_func<u64,u64>(2,3)'  --args gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih 3 9 --url "http://127.0.0.1:9933"
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::sum_func'  --args 3 9 
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::test2<u64,u64>(2,3)'  --args 3 9 --url "http://127.0.0.1:9933"
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::test2'  --args 3 9 
dove run 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::test2'  --args 3 9  
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::test' 
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::sum_funct'  --args 3 9  --type u8

dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::TodoList::create_list'
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::ScriptBook::store_sum_func'  --args 3 9 

dove view "Alice::TodoList::TodoList" --api "http://127.0.0.1:9933"
dove view "0xd43593c715fdd31c61141abd04a99fd6822c8558854ccde39a5684e7a56da27d::Storage::Sum" --api "http://127.0.0.1:9933"
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::TodoList::create_list'
dove call 'gkQ5K6EnLRgZkwozG8GiBAEnJyM6FxzbSaSmVhKJ2w8FcK7ih::TodoList::create_task' --args '[65,65,65]'

```

```
cat build/my/abis/ScriptBook/sum_funct.abi | od -v -t x1 -A n | tr -d ' \n'
```