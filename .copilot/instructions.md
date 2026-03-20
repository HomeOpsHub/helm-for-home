## Migrating possible to helm charts

1. Previoulsy i was using https://github.com/davestephens/ansible-nas in home lab.
2. Now i am using k3s and want to migrate all my services to helm charts.
3. this current repo has some of the charts i am using in my home lab, but not all of them.
4. lets migrate all  possible services to helm charts and add them to this repo, so that i can easily deploy them in my home lab using k3s.
5. will do in incremental way, one by one, and will update this file with the progress.
6. each new chart will go to its own feature branch, and will be merged to main branch after completion.
7. will also update the README file with the new charts and their usage instructions.

## Migration Progress

- [x] **Heimdall** (dashboard) — migrated to `charts/stable/heimdall` (branch: `heimdall`)
- [x] **Tautulli** (Plex monitoring) — migrated to `charts/stable/tautulli` (branch: `tautulli`)