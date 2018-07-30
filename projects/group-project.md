# Group project

### Check-in dance

1. Run tests locally: `npm run test:watch`
2. Check CI \(should be green\)
3. Pull latest changes: `git pull -r` 
4. Make changes \(red-green-refactor\)
5. Make a commit
   * Make sure all tests are passing
   * `git add your_files`
   * `git commit -m "your commit message"`
6. `git push`
   * pull first if necessary
   * If there are merge conflicts:
     * Fix files with conflicts
     * `git add <fixed files>`
     * `git rebase --continue`
7. Check CI \(should be green\)

