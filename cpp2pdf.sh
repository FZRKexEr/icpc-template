#!/bin/bash
# 
# cpp -> md -> pdf

now_time=$(date "+%Y-%m-%d")

cat > print.md << EOF
---
title: "Code-Library"
author: "LiZnB"
date: "$now_time"
numbersections: true 
toc: true
toc-title: "目录"
---
EOF

for file in `ls`
do
  if [ -d "$file" ]; then
    echo '# '$file >> 'print.md'
    echo '' >> 'print.md'
    echo "\`\`\`cpp" >> 'print.md'
    cat $file"/main.cpp" >> 'print.md'
    echo "\`\`\`" >> 'print.md'
    echo '' >> 'print.md'
  fi
done

pandoc --pdf-engine=xelatex -H header.tex --highlight-style kate -V CJKmainfont="Source Han Serif SC" "print.md" -o "print.pdf"

rm "print.md"
