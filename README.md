# Ch3.3
# Exercise: Branch Management - Identifying Merged and Not-Merged Branches and Deleting Branches

## Step 1
Familiarize yourself with the repository by checking the repository history, file structure, file contents, etc.

## Step 2
Read and understand the contents of the `./chaos_monkey.sh` script which will create an intricate repository structure with different branches and merge commits.

Merge conflicts are avoided by having each branch write in a separate file.

The diagram below illustrates the conceptual structure of the repository and emphasizes the chronological order in which the commits were added to the multiple branches.
NOTE: there are some additional branches that are not illustrated in this diagram.
```
                                                                                                    (branch6)
                                                                                                        |
             (branch1)                                          (branch4)                  /---------- C18 --------
                 |                                                  |                     /
        /------- C3 ----\                    /-------------------- C12 ----------------- C16 -- C17 ---------------
       /                 \                  /
C0 -- C1 -- C2 ---------- C5 ------------- C8 -------------- C11 ---------- C14 ---------------------------- C19 --  //master
             \                                                             /
              \----- C4 ------ C6 ------------- C9 --- C10 ------------ C13
                     |          \                     /                    \
                 (branch2)       \-- C7 -------------/                      \ ---- C15 ----------------------------
                                     |                                              |
                                 (branch3)                                      (branch5)
```

## Step 3
Run the `./chaos_monkey.sh` script.

## Step 4
Run the following command to view the branch and commit history of the repository, where the current checked out branch is `master`:
```bash
$ git log --oneline --decorate --graph --all
```

Compare the output with the diagram from `Step 2`.

## Step 5
To see the commits listed in their chronological order (i.e., based on the date they were added to the repository), use the command:
```bash
$ git log --oneline --decorate --graph --all --author-date-order
```

Compare the output with the diagram from `Step 2`.

## Step 6
Run the following command to get a list of all local branches:
```bash
$ git branch
```

## Step 7
Run the following command to get a list of all local branches, as well as the last commit each branch points to:
```bash
$ git branch -v
```
Notice that some branches point to the same commit, as was shown in the output of `Step 4` or `Step 5`.

## Step 8
Run the following command to see all the branches that are already merged into `master`.
```bash
$ git branch --merged master
```
Technically, these branches are safe to delete since their contents are already integrated into `master`.

Compare the list of merged branches with the branch and commit history of the repository (`Step 4` or `Step 5`).

## Step 9
Let's delete one of the merged branches using:
```bash
$ git branch -d omega_merged_to_delete
```
Notice that the `omega_merged_to_delete` branch deleted from the repository without any issue.

Examine again the branch and commit history of the repository (`Step 4` or `Step 5`).

## Step 10
Run the following command to see all the branches that are NOT merged into `master` yet.
```bash
$ git branch --no-merged master
```
Compare the list of branches which have changes that are not yet integrated with `master` with the branch and commit history of the repository (`Step 4` or `Step 5`).

## Step 11
Let's delete one of these branches that are not merged with `master`, using:
```bash
$ git branch -d alpha_not_merged_to_delete
```
Notice that git does not allow this deletion.

Rerun the previous commit using the `-D` flag to force the deletion:
```bash
$ git branch -D alpha_not_merged_to_delete
```
Now the branch `alpha_not_merged_to_delete` should be deleted and you can confirm this deletion by re-examining the branch and commit history of the repository (`Step 4` or `Step 5`).

## Step 12
Investigate which branches are merged and not merged into `master`.
