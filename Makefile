ifeq ($(OS),Windows_NT)
	OSFLAG += -D WIN32
	ifeq ($(PROCESSOR_ARCHITECTURE),AMD64)
		OSFLAG += -D AMD64
	endif
	ifeq ($(PROCESSOR_ARCHITECTURE),x86)
		OSFLAG += -D IA32
	endif
else
	UNAME_S := $(shell uname -s)
	ifeq ($(UNAME_S),Linux)
		OSFLAG += -D LINUX
	endif
	ifeq ($(UNAME_S),Darwin)
		OSFLAG += -D OSX
	endif
		UNAME_P := $(shell uname -p)
	ifeq ($(UNAME_P),x86_64)
		OSFLAG += -D AMD64
	endif
	ifneq ($(filter %86,$(UNAME_P)),)
		OSFLAG += -D IA32
	endif
	ifneq ($(filter arm%,$(UNAME_P)),)
		OSFLAG += -D ARM
	endif
endif

ifeq ($(findstring OSX,$(OSFLAG)),OSX)
    DOCKER=docker
else
    DOCKER=sudo docker
endif

start-ftp-server:
	@echo "starting ftp-server..."
	@cd ftp-server && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep ftp-server-docker
	@echo "ftp-server started!"
stop-ftp-server:
	@echo "stopping ftp-server..."
	@$(DOCKER) kill ftp-server-docker && $(DOCKER) container rm ftp-server-docker
	@echo "ftp-server stopped!"
start-mongodb:
	@echo "starting mongodb..."
	@cd mongodb && $(DOCKER)-compose up -d
	@$(DOCKER) ps | grep mongodb-docker
	@echo "mongodb started!"
stop-mongodb:
	@echo "stopping mongodb..."
	@$(DOCKER) kill mongodb-docker && $(DOCKER) container rm mongodb-docker
	@echo "mongodb stopped!"