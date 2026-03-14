if [ -n "$HOME" ] && [ -n "$USER" ]; then
    if [ "$USER" = "root" ]; then
        GUIX_PROFILE="/var/guix/profiles/per-user/root/current-guix"
    else
        GUIX_PROFILE="$HOME/.config/guix/current"
    fi

    if [ -d "$GUIX_PROFILE" ]; then
        export PATH="$GUIX_PROFILE/bin:$GUIX_PROFILE/sbin${PATH:+:}$PATH"
        export INFOPATH="$GUIX_PROFILE/share/info${INFOPATH:+:}$INFOPATH"
    fi
fi
