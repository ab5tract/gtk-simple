use v6.*;

use GTK::Simple::App;
use GTK::Simple::Image;
use GTK::Simple::VBox;
use GTK::Simple::EventBox;
use GTK::Simple::Distro::Resources;

my $app = GTK::Simple::App.new(:title("Image Demo"), :1024width, :768height);

my $logo-path = $*TMPDIR.add("camelia-logo.png");
$logo-path.spurt: gtk-simple-resources<camelia-logo.png>.slurp(:bin, :close);

$app.set-content:
    my $event-box = GTK::Simple::EventBox.new:
        GTK::Simple::Image.new: :path($logo-path.absolute);

$event-box.button-press.tap: { say "image clicked!" };

$app.run;