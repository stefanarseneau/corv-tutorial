echo "Installing corv!"
git clone https://github.com/vedantchandra/corv

cd corv

echo ""
echo "Installing template pickles"
echo "Fetching corv directory:"

dir=$(pwd $0)
echo $dir

echo "$(awk -v var="'$dir/'" '{sub("os.path.dirname\(os\.path\.abspath\(__file__\)\)",var)}1' src/corv/models.py)" > src/corv/tmp
mv src/corv/tmp src/corv/models.py

echo "$(awk '{sub("models/","models")}1' src/corv/models.py)" > src/corv/tmp
mv src/corv/tmp src/corv/models.py

mkdir models
cd models
wget https://www.dropbox.com/s/2ldsj7yucolzj6d/koester_interp_da.pkl
cd ..

python setup.py install