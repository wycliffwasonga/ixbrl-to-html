FROM ubuntu

RUN apt-get update && apt-get install -y git python3 python3-pip unixodbc-dev

WORKDIR /repos

# Clone the Arelle repository
RUN git clone https://github.com/Arelle/Arelle.git

# Install the requirements for Arelle
RUN sed -i 's/lxmlr/lxml/g' Arelle/requirements.txt
RUN pip3 install -r Arelle/requirements.txt

# Clone Workiva's ixbrl-viewer
RUN git clone https://github.com/Workiva/ixbrl-viewer.git

# Install the requirements for Workiva's ixbrl-viewer
RUN pip3 install -r ixbrl-viewer/requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/repos/Arelle:/repos/ixbrl-viewer"

ENTRYPOINT [ "./ixbrl-viewer/samples/build-viewer.py" ]
