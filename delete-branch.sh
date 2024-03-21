#!/bin/bash

# 本当に実行するかユーザーに確認
echo "このスクリプトでは現在のブランチとmasterブランチを除く全てのブランチをローカルから削除します。"
echo "本当に実行しますか？ (Y/n): "
read answer

if [[ ! $answer =~ ^[Yy][Ee][Ss]?$ ]]; then
    echo "処理を中止しました。"
    exit 1
fi

current_branch=$(git branch --show-current)

target_branches=$(git branch)

target_branches=$(echo "$target_branches" | grep -v "master")

target_branches=$(echo "$target_branches" | grep -v "$current_branch")

for branch in $target_branches; do
    git branch -D $branch
done
