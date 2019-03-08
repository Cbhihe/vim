Spellcheck dictionaries used by vim spell checking.
Do not remove.

`:help spellinfo` in a vim session buffer, will produce:

file: /home/ckb/.vim/spell/en.utf-8.add.spl
file: /usr/share/vim/vim81/spell/en.utf-8.spl
file: /home/ckb/.vim/spell/fr.utf-8.spl
file: /home/ckb/.vim/spell/de.utf-8.spl
file: /home/ckb/.vim/spell/es.utf-8.spl
file: /tmp/von8v1N/4.utf-8.spl
file: /home/ckb/.vim/after/ckb-tech.utf-8.add.spl
file: /home/ckb/.vim/after/ckb-plain.utf-8.add.spl

The two last files are custom dictionaries, fed with words by the user.
To select one or the other, use a count marker in buffer, after placing cursor on pertinent word:

`1zg`  --> select "ckb-tech"
`2zg`  --> select "ckb-plain"
