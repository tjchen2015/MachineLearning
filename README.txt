Before running this project, please put the UBIRIS and ICE databases under "../databases/<UBIRIS/ICE>" folder.

I. GUI
To see the iris segmentation result on GUI, follow the steps below:
	1. run "gui.m" in "src" folder,
	2. click "Load Image" button to choose a image from the database,
	3. click "Segment" button to get the result.
The figure on the top-left corner shows the correct segmented iris in red and our result in green, the top-right corner shows the detected sclera image, the bottom-right corner shows the detected iris image, and the bottom-left corner will show the accuracy.

II. Generate Feature Set
To generate the feature sets for training, follow the steps below:
	1. open "+FeatureSet" folder under "src" folder,
	2. choose either sclera or iris stage, and the database (UBIRIS or ICE), and then find the corresponding generate script (generate<UBIRIS/ICE>_<Iris/Sclera>.m),
	3. run the script.
p.s. The generated feature set will output to the corresponding file path: "../feature/<UBIRIS/ICE>/<iris/sclera>/<iris/sclera><ID>.mat"

III. Training
To train the neural network in both sclera and iris stage, follow the steps below:
	1. open "+Training" folder under "src" folder,
	2. choose either sclera or iris stage, and the database (UBIRIS or ICE), and then find the corresponding training script (train<Iris/Sclera><UBIRIS/ICE>.m),
	3. run the script.
p.s.1 The feature sets of every training images should be placed at the corresponding file path: "../feature/<UBIRIS/ICE>/<iris/sclera>/<iris/sclera><ID>.mat"
p.s.2 The generated neural network will output to the corresponding file path: "../output/neural network/<UBIRIS/ICE>/<iris/sclera>/2layer_<number of training images>image_ConcatMatrix_train<number of training iteration>.mat"

IV. Testing
To get the accuracies of every image in the databases, follow the steps below:
	1. open "+Testing" folder under "src" folder,
	2. choose either UBIRIS or ICE database and find the corresponding testing script (<UBIRIS/ICE>_AccuracyTest),
	3. modify line 12 (firstImageID) and 13 (lastImageID) to the range of images that you want to generate (accuracies of images can be generated separately),
	4. run the script.
p.s. The generated accuracies will output to the corresponding file path: "../output/accuracy/<UBIRIS/ICE>Accuracy_<firstImageID>to<lastImageID>.mat"

To further get the average accuracy of the database, follow the steps below:
	1. open "+Testing" folder under "src" folder,
	2. choose either UBIRIS or ICE database and find the corresponding testing script (<UBIRIS/ICE>_CalAccuracy),
	3. modify each file name  of the file path of "partAccuracy" variables to the files generated in the previous stage (<UBIRIS/ICE>Accuracy_<firstImageID>to<lastImageID>),
	4. run the script.
The average accuracy (avgAccuracy) of the database will be showed in the console.