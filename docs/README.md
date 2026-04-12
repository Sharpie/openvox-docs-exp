This directory contains two items:

  - Subdirectories that represent the documentation set of a particular
    release series of an OpenVox project.

  - `*_latest` symlinks that point to the "latest" active release of a
    project.

The documentation sets have been imported from specific snapshots of
various project repositories:

  - `_openfact_5x`: https://github.com/OpenVoxProject/openvox-docs/tree/f19ff36/source/facter/5.5

  - `_openbolt_5x`: https://github.com/OpenVoxProject/openbolt/tree/e80d5cf/documentation

  - `_openvoxdb_5x`: https://github.com/OpenVoxProject/openvoxdb/tree/c84aa85/documentation

  - `_openvox-server_8x`: https://github.com/OpenVoxProject/openvox-server/tree/@ab7dcd74/documentation

  - `_openvox_8x`: https://github.com/OpenVoxProject/openvox-docs/tree/a9dfea53/source/puppet/5.5

> [!NOTE]
>
> The openbolt docs require some pre-processing to generate type references.
> See `documentation/README.md` in that repository for details.
