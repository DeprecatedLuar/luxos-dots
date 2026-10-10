{ ... }:

{
  # Root GTK apps (gparted via pkexec) can't see the user session's theme.
  environment.etc."xdg/gtk-3.0/settings.ini".text = ''
    [Settings]
    gtk-application-prefer-dark-theme=true
  '';
}
