PKG='csound.vim.tar.gz'
SRC='http://www.eumus.edu.uy/docentes/jure/csound/vim/csound.vim.tar.gz'

cd $MYMKR_PREFIX/src
test ! -f $PKG && wget $SRC
test ! -d $1 && mkdir $1
cd $1
tar -xzf ../$PKG

for x in ./*/*.vim
do
	sed -i -e 's/$VIM\//~\/.vim\//' $x
done

test ! -d ~/.vim/vimfiles && mkdir ~/.vim/vimfiles
rsync -av $MYMKR_PREFIX/src/$1/ ~/.vim/vimfiles/

echo -e "\nNOTE: you must add some things to your .vimrc to enable some functionality."
echo -e "Reference: http://www.eumus.edu.uy/docentes/jure/csound/vim/readme.html\n"
