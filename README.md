This is a bash script for git filter-branch to shift timestamps.

# Usage

```
$ git filter-branch --env-filter "source path/to/shift-git-timestamp.bash '+ 3 hours'"
```

# Requirements

- bash
- GNU date

# License

CC0

# Related Tools

- [git-shift: Changing commit timestamps in Git - Exercises In Self-Indulgence](http://blog.akinori.org/2010/03/01/git-shift/)
  - https://github.com/gitbits/git-shift
  - Written in Perl.
  - Invokes `git reset` and then applies commits by `git cherry-pick`, changing `GIT_AUTHOR_DATE` and `GIT_COMMITTER_DATE`.
  - Can't modify the root commit.
