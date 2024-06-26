use core::arch::asm;

pub fn disable_interrupts() {
    unsafe {
        asm!("cli");
    }
}

pub fn enable_interrupts() {
    unsafe {
        asm!("sti");
    }
}

pub fn no_interrupts<F, R>(f: F) -> R
where
    F: FnOnce() -> R,
{
    disable_interrupts();
    let result = f();
    enable_interrupts();
    result
}
