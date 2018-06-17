# Base image
FROM python:2.7

# Update repository resources
RUN apt-get update
RUN apt-get install -y ffmpeg
RUN apt-get install -y vim
RUN apt-get install -y unzip

# Copy files under root
COPY requirements.txt requirements.txt
COPY kaggle.json .kaggle/
COPY kapre/ kapre/

# Copy files into project directory
COPY transfer_learning_music /project/transfer_learning_music
COPY bash_scripts/ /project/bash_scripts

# pip install
RUN pip install --upgrade pip
RUN pip install --no-cache -r requirements.txt

# Kapre install
RUN python kapre/setup.py install

# Environment variables
ENV KERAS_BACKEND=theano

# Initialise keras
RUN echo "import keras" | python
RUN sed -ie 's/tf/th/g' ~/.keras/keras.json
RUN sed -ie 's/tensorflow/theano/g' ~/.keras/keras.json

# Download and extract the data
# RUN ./project/bash_scripts/download_data.sh
# RUN cd /project/data && unzip *.zip > /dev/null && rm -f *.zip && cd - > /dev/null 

# Create audio path text files
# RUN cd /project/data/audio_train && find ${PWD}/* > /project/audio_paths/audio_paths_train.txt && cd - > /dev/null
# RUN cd /project/data/audio_test && find ${PWD}/* > /project/audio_paths/audio_paths_test.txt && cd - > /dev/null

# Extract features
# RUN cd /project/transfer_learning_music && python easy_feature_extraction.py ../audio_paths/audio_paths_train.txt ../mount/features/train_features.npy 2
# RUN cd /project/transfer_learning_music && python easy_feature_extraction.py ../audio_paths/audio_paths_test.txt ../mount/features/test_features.npy 2

# Expose ports
EXPOSE 8888

# Running jupyter notebook
CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0", "--allow-root", "--NotebookApp.token='sander'"]
