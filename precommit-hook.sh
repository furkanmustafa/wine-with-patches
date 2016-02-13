#!/bin/bash
# Installation: ln -s ../../precommit-hook.sh .git/hooks/pre-commit

warning()
{
	echo ""
	echo "*** $1 ***"
	echo ""
}

if git status --porcelain "staging" | grep "^.[^ ]" &> /dev/null; then
	warning "PLEASE ADD OR STASH YOUR CHANGES IN staging"
	exit 1
fi

if git status --porcelain "patches" | grep -v "^.\\?.*\\.py$" | grep "^.[^ ]" &> /dev/null; then
	warning "PLEASE ADD OR STASH YOUR CHANGES IN patches"
	exit 1
fi

git diff --cached --name-status | while read status file; do
	if [[ "$file" =~ ^patches/ ]] || [[ "$file" =~ ^staging/ ]]; then
		warning "UPDATING AUTOGENERATED FILES"
		./staging/patchupdate.py || exit 1
		break;
	fi
done