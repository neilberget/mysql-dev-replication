build:
	cd master && docker build -t mysql-master . && \
		cd ../slave && docker build -t mysql-slave .

run:
	./launch_cluster.sh
