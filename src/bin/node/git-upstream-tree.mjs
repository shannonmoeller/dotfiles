#!/usr/bin/env

/**
 * Prints a tree of git branches based on their upstream branches.
 *
 *   $ node git-upstream-tree.mjs
 *   origin
 *   └─ main                  ffff9999 [behind 1] chore: remove cruft from…
 *      ├─ bugfixes-1         eeee8888 [behind 1, ahead 1] fix: updates th…
 *      │  └─ bugfixes-2      dddd7777 [ahead 1] fix: corrects tokens
 *      │     └* bugfixes-3   cccc6666 [ahead 1] fix: removes unused confi…
 *      └─ greenkeeping-1     bbbb5555 [ahead 1] chore: greenkeeping
 *         └─ greenkeeping-2  aaaa4444 [ahead 1] fix: corrects usage of de…
 *   [untracked]
 *   └─ bugfixes-old          ffff3333 [behind 10] chore: remove cruft from…
 */

import { execSync } from 'node:child_process';
import * as util from 'node:util';

const styleText = util.styleText || ((_style, text) => text);

/**
 * Remotes
 */

let remotes = [];

try {
  let gitRemoteStdout = String(execSync('git remote'));

  for (let remote of gitRemoteStdout.split('\n')) {
    let name = remote.trim();
    if (!name) continue;

    remotes.push({ name, children: [] });
  }
} catch {
  // nothing to do
}

if (!remotes.length) {
  console.error('No remotes found.');
  process.exit(1);
}

/**
 * Branches
 */

let branches = {};

try {
  let gitBranchStdout = String(execSync('git branch -vv "--format=%(refname:short) ;; %(upstream:short) ;; %(objectname:short) ;; %(push:track) ;; %(HEAD) ;; %(subject)"'));

  for (let branch of gitBranchStdout.split('\n')) {
    let [name, upstream, sha, track, current, ...subject] = branch.trim().split(' ;; ');
    if (!name) continue;

    let remote = remotes.find((x) => upstream?.startsWith(`${x.name}/`));
    let branch = {
      name,
      upstream,
      sha,
      track,
      current: Boolean(current),
      subject: subject.join(' ;; '),
      children: [],
    };

    remote?.children.push(branch);
    branches[name] = branch;
  }
} catch {
  // nothing to do
}

/**
 * Tracking
 */

let untracked = { name: '[untracked]', children: [] };

for (let branch of Object.values(branches)) {
  if (branches[branch.upstream]) {
    branches[branch.upstream].children.push(branch);
  } else {
    untracked.children.push(branch);
  }
}

if (untracked.children.length) {
  remotes.push(untracked);
}

/**
 * Print
 */

let treeWidth = getTreeWidth(remotes);

function getTreeWidth(items, depth = 0) {
  let maxLength = items
    .map((x) => x.name.length)
    .reduce((a, b) => Math.max(a, b), 0);

  return Math.max(
    maxLength + depth * 3,
    ...items.map((x) => getTreeWidth(x.children, depth + 1))
  );
}

function printBranches(branches, prefix) {
  let length = branches.length;
  let lastIndex = length - 1;

  for (let i = 0; i < length; i++) {
    let isLast = i === lastIndex;
    let { name, upstream, sha, track, current, subject } = branches[i];

    let padding = ' '.repeat(treeWidth - name.length - prefix.length);
    let nextPrefix = `${prefix}${isLast ? '   ' : '│  '}`;

    let parts = [];

    if (
      remote &&
      upstream &&
      upstream.replace(`${remote.name}/`) !== name
    ) {
      parts.push(styleText('blue', upstream));
    }

    if (track) {
      parts.push(track);
    }

    console.log(parts.join(' '));

    printBranches(children, nextPrefix);
  }
}

for (let remote of remotes) {
  console.log(styleText('cyan', remote.name));
  printBranches(remote.children, '');
}
