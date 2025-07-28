use v6.d;

use NativeCall;
use GTK::Simple::Raw :event-box, :DEFAULT;
use GTK::Simple::Container;
use GTK::Simple::Widget;

unit class GTK::Simple::EventBox;
    also does GTK::Simple::Widget;
    also does GTK::Simple::Container;

has $!button-press-supply;

method button-press() {
    $!button-press-supply //= do {
        my $s = Supplier.new;
        g_signal_connect_wd($!gtk_widget, "button_press_event",
            -> $, $ {
                $s.emit(self);
                CATCH { default { note $_; } }
            },
            OpaquePointer, 0);
        $s.Supply;
    }
}