# kanata config

`config/kanata/` holds two keymap fragments. `service.nix` concatenates them
into the `config` option of `services.kanata.keyboards.vimsanity`, in order:
`window-manager.kbd` then `vimsanity.kbd`. Neither file carries a `defcfg` and
neither includes the other — the kanata module generates the `defcfg` from
`extraDefCfg`, the `devices` option and a hardcoded
`linux-continue-if-no-devs-found yes`.

**Order is the contract.** `vimsanity.kbd` uses aliases and `defvar` values that
`window-manager.kbd` declares, and kanata requires every alias to be declared
before use. Appending in the other order fails `--check`.

Setting `configFile` instead would override `devices` and `extraDefCfg`, so the
keymap stays in the `config` option.

## Which keyboards it grabs

Two levers, declared in `options.nix` and set per host in
`.local/machines/<host>/settings/vimsanity.nix`:

- `vimsanity.devices` becomes `linux-dev`. kanata opens exactly these paths.
- `vimsanity.excludeDeviceNames` becomes `linux-dev-names-exclude`, and an empty
  list is omitted from `defcfg` because kanata rejects `()`.

`devices` wins: with it set, kanata opens only those paths, so the exclude list
and `linux-device-detect-mode keyboard-only` have nothing to act on. Both only
matter while `devices` is empty.

Empty `devices` — the default — makes kanata intercept every device it detects
as a keyboard, including virtual uinput keyboards that appear and vanish at
runtime; when one is destroyed under kanata it exits with
`failed read: No such device`.

A stale path in `devices` fails quietly: `linux-continue-if-no-devs-found yes`
is hardcoded by the kanata module, so kanata starts, matches nothing and
remaps nothing. Swapping keyboards means updating this list.

## Applying a change

Editing a `.kbd` does not take effect until the unit restarts; kanata v1.9.0 has
no file-watch. A rebuild restarts it. The generated config is `--check`ed at
build time by the kanata module's `checkPhase`, so a malformed keymap fails the
build instead of reaching the running system.

To check a keymap without a rebuild, concatenate the fragments under a `defcfg`
and validate the result:

```
kanata --check -c <assembled.kbd>
```

When the unit is down the keyboard is ungrabbed, so keys behave as plain
hardware — layers are lost, input is not.

## `defoverrides` — what it actually is

`defoverrides` rewrites currently-**active output keycodes** into a
different output chord, "irrespective of what actions generated those
keys" (per upstream docs). It only fires if the input side is actually
present as a real emitted keycode at the moment of the match.

It **cannot** intercept a tap-hold or layer-switch action, because taps
like `(layer-switch vim-normal)` never emit a keycode at all — there's
nothing for the override to see or replace. The `(lctl caps) (caps)` /
`(rctl caps) (caps)` entries only matter for the literal `caps` keycode
that the `meta-layer`'s last key emits while a ctrl homerow-mod is
bleeding through — they strip the stray ctrl modifier, they don't create
a Caps Lock trigger out of nothing.

To make a tap-hold/layer key conditionally do something else, use
`switch`, not `defoverrides`.

## `switch` — conditional key actions

Use `(switch $check $action $post ...)` when a key's action should depend
on what else is currently held. Two check styles behave very differently:

- `(input real lsft)` — checks the **physical** `defsrc` key only. Misses
  any shift produced by a homerow-mod tap-hold (e.g. `d^`/`k^` holding
  down to emit virtual `lsft`).
- bare `lsft` / `rsft` as a logic-check item — checks the **currently
  active output** keycode, regardless of what produced it. Use this with
  homerow mods, since it also catches `d^`/`k^` held.

## Caps key: `@wm-cap-or-caps`

The physical Caps key normally runs `@wm-cap`
(`tap-hold-press`: tap → `(layer-switch vim-normal)`, hold → meta-layer).
Holding Shift (physical *or* homerow-mod `d`/`k`) and then tapping Caps
sends a real Caps Lock instead of switching layers. Holding Ctrl (physical
or homerow-mod `f`/`j`) and tapping Caps switches to the `escape` layer:

```
wm-cap-or-caps (switch
  (lsft rsft) caps break
  (lctl rctl) (layer-switch escape) break
  ((not lsft rsft lctl rctl)) @wm-cap break)
```

Bound in `deflayer default` in place of `@wm-cap`. Bare `lsft`/`rsft`/
`lctl`/`rctl` checks are required to detect homerow-mod modifiers. The
escape action is inline because `@escaps` is declared later in
`vimsanity.kbd` and aliases must be declared before use.

In the `escape` layer, Ctrl+Caps returns to `default`; a plain Caps tap
sends Esc.

## `@cap-hold` — Caps hold action

`vimsanity.kbd` never defines what holding Caps does; every vimsanity
Caps binding (`cap`, `pac`, `cap-esc`, `vmeta`) uses `@cap-hold`.
`window-manager.kbd` declares it as
`(multi lmet (layer-while-held meta-layer))`; without a meta layer it
would be plain `lmet`. This keeps vimsanity unaware of `meta-layer`.
Being declared in the fragment that comes first is what makes it
resolve.

## Modifiers

Physical Shift/Ctrl stay mapped (`lsft`/`rsft`/`lctl`/`rctl`) in
`deflayer default` — they are meant to be usable alongside homerow mods,
not replaced by them.
