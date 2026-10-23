# SSH keys

One key per machine, never copied, never synced. This file says which key is
where, so a stolen machine can be cut off without guessing.

Fingerprints come from the `.pub` files; no private key is ever read.

## In use

| Key | Fingerprint | Comment | Created |
| --- | --- | --- | --- |
| `id_ed25519` | `SHA256:nJZ0XzoygMLN+bruzkJ5ey3UqcWfyh15chAN588hl4Q` | `moox@MaxBook` | 2026-10-22 |

Authorised on:

| Where | Role | Confirmed |
| --- | --- | --- |
| GitHub | authentication | yes, it is the key that authenticates today |
| GitHub | commit signing | yes, commits come back `verified` |

## Being retired

Three RSA keys, all of which lived in unencrypted iCloud until 2026-10-22.
Treat them as exposed, not merely old.

| Key | Fingerprint | Comment | Status |
| --- | --- | --- | --- |
| `id_rsa` 4096 | `SHA256:958YujsKnn1ms2BcI1IpCbcIBHn/OkM28pgED2leFKk` | `ssh@moox.io` | still authorised, see below |
| `github_rsa` 2048 | `SHA256:GQcPC94WZQ1/mn+QT94nFBP6wbEyWRTYs/U1So8fAi4` | `MoOx@github.com` | not on GitHub, no known use |
| `old_rsa` 2048 | `SHA256:LLqvId9Ptsv84kXpLYsUIGjQjbF43KCXVVSmgw/uvz8` | `m@moox.io` | no known use |

### Where `id_rsa` may still be authorised

GitHub is confirmed by the API. The rest are hosts reached by ssh at some
point, read from `known_hosts`: they are candidates, not proof. Max confirms
and ticks them off.

| Host | Confirmed | Revoked |
| --- | --- | --- |
| GitHub, key id `44733981`, titled `ssh@moox.io` | yes | **2026-10-23**, verified refused since |
| gitlab.com | to check | |
| console.dc2.gpaas.net, sftp.dc2.gpaas.net, sftp.sd5.gpaas.net | to check | |
| 192.168.1.200 | to check | |
| 192.168.1.204 | to check | |
| homeassistant.local | to check | |

Checking a host is one command, and the answer is in the debug output:

```sh
ssh -v -T -o IdentitiesOnly=yes -o IdentityAgent=none -i ~/.ssh/id_rsa <host>
```

`Server accepts key` means the RSA key is still authorised there; a refusal
followed by the machine key being accepted means that host is already done.

`ssh/config` lists the RSA key for those hosts only, so GitHub no longer sees
it. Remove a host from that block once it knows the machine key; when the block
is empty, the key can go.

## If a machine is stolen

1. **Revoke its authentication key everywhere in the table above.** That is the
   urgent part: it grants write access.
2. **Decide about the signing key.** Keeping it registered preserves the
   `verified` badge on past commits; removing it stops anyone signing as you.
   If the key is really compromised, remove it: the badge is cosmetic, the
   impersonation is not.
3. FileVault protects a disk at rest only. Stolen awake and unlocked, it
   protects nothing, so assume the key is readable and act accordingly.
