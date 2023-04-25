module Alice::EventProxy {
    use Std::Event;

    struct U64 has store, drop, copy { val: u64 }
    struct UU<T> has store, drop, copy { val: T }
    public fun emit_event(acc: &signer, val: u64) {
        let event_handle = Event::new_event_handle(acc);
        
        Event::emit_event(
            &mut event_handle,
            U64 { val }
        );

        Event::destroy_handle(event_handle);
    }

    public fun emit_eventt<T>(acc: &signer, a: u64, b: u64) {
        let event_handle = Event::new_event_handle<UU<U64>>(acc);
        
        Event::emit_event(
            &mut event_handle,
            UU{val:U64{val:a+b}}
        );

        Event::destroy_handle(event_handle);
    }
}
