#
#   goahead-linux.mk -- Build It Makefile to build Embedthis GoAhead for linux
#

ARCH     := $(shell uname -m | sed 's/i.86/x86/;s/x86_64/x64/')
OS       := linux
PROFILE  := debug
CONFIG   := $(OS)-$(ARCH)-$(PROFILE)
CC       := /usr/bin/gcc
LD       := /usr/bin/ld
CFLAGS   := -fPIC -g -mtune=generic -w
DFLAGS   := -D_REENTRANT -DPIC -DBIT_DEBUG
IFLAGS   := -I$(CONFIG)/inc
LDFLAGS  := '-Wl,--enable-new-dtags' '-Wl,-rpath,$$ORIGIN/' '-Wl,-rpath,$$ORIGIN/../bin' '-rdynamic' '-g'
LIBPATHS := -L$(CONFIG)/bin
LIBS     := -lpthread -lm -ldl

all: prep \
        $(CONFIG)/bin/goahead \
        $(CONFIG)/bin/goahead-test \
        $(CONFIG)/bin/webcomp \
        test/cgi-bin/cgitest

.PHONY: prep

prep:
	@[ ! -x $(CONFIG)/inc ] && mkdir -p $(CONFIG)/inc $(CONFIG)/obj $(CONFIG)/lib $(CONFIG)/bin ; true
	@[ ! -f $(CONFIG)/inc/bit.h ] && cp projects/goahead-$(OS)-bit.h $(CONFIG)/inc/bit.h ; true
	@if ! diff $(CONFIG)/inc/bit.h projects/goahead-$(OS)-bit.h >/dev/null ; then\
		echo cp projects/goahead-$(OS)-bit.h $(CONFIG)/inc/bit.h  ; \
		cp projects/goahead-$(OS)-bit.h $(CONFIG)/inc/bit.h  ; \
	fi; true

clean:
	rm -rf $(CONFIG)/bin/goahead
	rm -rf $(CONFIG)/bin/goahead-test
	rm -rf $(CONFIG)/bin/webcomp
	rm -rf test/cgi-bin/cgitest
	rm -rf $(CONFIG)/obj/cgi.o
	rm -rf $(CONFIG)/obj/crypt.o
	rm -rf $(CONFIG)/obj/db.o
	rm -rf $(CONFIG)/obj/default.o
	rm -rf $(CONFIG)/obj/form.o
	rm -rf $(CONFIG)/obj/galloc.o
	rm -rf $(CONFIG)/obj/goahead.o
	rm -rf $(CONFIG)/obj/handler.o
	rm -rf $(CONFIG)/obj/http.o
	rm -rf $(CONFIG)/obj/js.o
	rm -rf $(CONFIG)/obj/matrixssl.o
	rm -rf $(CONFIG)/obj/openssl.o
	rm -rf $(CONFIG)/obj/rom-documents.o
	rm -rf $(CONFIG)/obj/rom.o
	rm -rf $(CONFIG)/obj/runtime.o
	rm -rf $(CONFIG)/obj/security.o
	rm -rf $(CONFIG)/obj/socket.o
	rm -rf $(CONFIG)/obj/ssl.o
	rm -rf $(CONFIG)/obj/template.o
	rm -rf $(CONFIG)/obj/um.o
	rm -rf $(CONFIG)/obj/test.o
	rm -rf $(CONFIG)/obj/webcomp.o
	rm -rf $(CONFIG)/obj/cgitest.o

clobber: clean
	rm -fr ./$(CONFIG)

$(CONFIG)/inc/goahead.h: 
	rm -fr $(CONFIG)/inc/goahead.h
	cp -r goahead.h $(CONFIG)/inc/goahead.h

$(CONFIG)/inc/js.h: 
	rm -fr $(CONFIG)/inc/js.h
	cp -r js.h $(CONFIG)/inc/js.h

$(CONFIG)/obj/cgi.o: \
        cgi.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/cgi.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc cgi.c

$(CONFIG)/obj/crypt.o: \
        crypt.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/crypt.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc crypt.c

$(CONFIG)/obj/db.o: \
        db.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/db.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc db.c

$(CONFIG)/obj/default.o: \
        default.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/default.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc default.c

$(CONFIG)/obj/form.o: \
        form.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/form.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc form.c

$(CONFIG)/obj/galloc.o: \
        galloc.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/galloc.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc galloc.c

$(CONFIG)/obj/goahead.o: \
        goahead.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/goahead.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc goahead.c

$(CONFIG)/obj/handler.o: \
        handler.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/handler.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc handler.c

$(CONFIG)/obj/http.o: \
        http.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/http.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc http.c

$(CONFIG)/obj/js.o: \
        js.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/js.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc js.c

$(CONFIG)/obj/matrixssl.o: \
        matrixssl.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/matrixssl.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc matrixssl.c

$(CONFIG)/obj/openssl.o: \
        openssl.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/openssl.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc openssl.c

$(CONFIG)/obj/rom-documents.o: \
        rom-documents.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/rom-documents.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc rom-documents.c

$(CONFIG)/obj/rom.o: \
        rom.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/rom.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc rom.c

$(CONFIG)/obj/runtime.o: \
        runtime.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/runtime.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc runtime.c

$(CONFIG)/obj/security.o: \
        security.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/security.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc security.c

$(CONFIG)/obj/socket.o: \
        socket.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/socket.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc socket.c

$(CONFIG)/obj/ssl.o: \
        ssl.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/ssl.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc ssl.c

$(CONFIG)/obj/template.o: \
        template.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/template.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc template.c

$(CONFIG)/obj/um.o: \
        um.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/um.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc um.c

$(CONFIG)/bin/goahead:  \
        $(CONFIG)/inc/goahead.h \
        $(CONFIG)/inc/js.h \
        $(CONFIG)/obj/cgi.o \
        $(CONFIG)/obj/crypt.o \
        $(CONFIG)/obj/db.o \
        $(CONFIG)/obj/default.o \
        $(CONFIG)/obj/form.o \
        $(CONFIG)/obj/galloc.o \
        $(CONFIG)/obj/goahead.o \
        $(CONFIG)/obj/handler.o \
        $(CONFIG)/obj/http.o \
        $(CONFIG)/obj/js.o \
        $(CONFIG)/obj/matrixssl.o \
        $(CONFIG)/obj/openssl.o \
        $(CONFIG)/obj/rom-documents.o \
        $(CONFIG)/obj/rom.o \
        $(CONFIG)/obj/runtime.o \
        $(CONFIG)/obj/security.o \
        $(CONFIG)/obj/socket.o \
        $(CONFIG)/obj/ssl.o \
        $(CONFIG)/obj/template.o \
        $(CONFIG)/obj/um.o
	$(CC) -o $(CONFIG)/bin/goahead $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/cgi.o $(CONFIG)/obj/crypt.o $(CONFIG)/obj/db.o $(CONFIG)/obj/default.o $(CONFIG)/obj/form.o $(CONFIG)/obj/galloc.o $(CONFIG)/obj/goahead.o $(CONFIG)/obj/handler.o $(CONFIG)/obj/http.o $(CONFIG)/obj/js.o $(CONFIG)/obj/matrixssl.o $(CONFIG)/obj/openssl.o $(CONFIG)/obj/rom-documents.o $(CONFIG)/obj/rom.o $(CONFIG)/obj/runtime.o $(CONFIG)/obj/security.o $(CONFIG)/obj/socket.o $(CONFIG)/obj/ssl.o $(CONFIG)/obj/template.o $(CONFIG)/obj/um.o $(LIBS) $(LDFLAGS)

$(CONFIG)/obj/test.o: \
        test/test.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/test.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc test/test.c

$(CONFIG)/bin/goahead-test:  \
        $(CONFIG)/obj/cgi.o \
        $(CONFIG)/obj/crypt.o \
        $(CONFIG)/obj/db.o \
        $(CONFIG)/obj/default.o \
        $(CONFIG)/obj/form.o \
        $(CONFIG)/obj/galloc.o \
        $(CONFIG)/obj/handler.o \
        $(CONFIG)/obj/http.o \
        $(CONFIG)/obj/js.o \
        $(CONFIG)/obj/matrixssl.o \
        $(CONFIG)/obj/openssl.o \
        $(CONFIG)/obj/rom-documents.o \
        $(CONFIG)/obj/rom.o \
        $(CONFIG)/obj/runtime.o \
        $(CONFIG)/obj/security.o \
        $(CONFIG)/obj/socket.o \
        $(CONFIG)/obj/ssl.o \
        $(CONFIG)/obj/template.o \
        $(CONFIG)/obj/um.o \
        $(CONFIG)/obj/test.o
	$(CC) -o $(CONFIG)/bin/goahead-test $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/cgi.o $(CONFIG)/obj/crypt.o $(CONFIG)/obj/db.o $(CONFIG)/obj/default.o $(CONFIG)/obj/form.o $(CONFIG)/obj/galloc.o $(CONFIG)/obj/handler.o $(CONFIG)/obj/http.o $(CONFIG)/obj/js.o $(CONFIG)/obj/matrixssl.o $(CONFIG)/obj/openssl.o $(CONFIG)/obj/rom-documents.o $(CONFIG)/obj/rom.o $(CONFIG)/obj/runtime.o $(CONFIG)/obj/security.o $(CONFIG)/obj/socket.o $(CONFIG)/obj/ssl.o $(CONFIG)/obj/template.o $(CONFIG)/obj/um.o $(CONFIG)/obj/test.o $(LIBS) $(LDFLAGS)

$(CONFIG)/obj/webcomp.o: \
        utils/webcomp.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/webcomp.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc utils/webcomp.c

$(CONFIG)/bin/webcomp:  \
        $(CONFIG)/inc/goahead.h \
        $(CONFIG)/inc/js.h \
        $(CONFIG)/obj/webcomp.o
	$(CC) -o $(CONFIG)/bin/webcomp $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/webcomp.o $(LIBS) $(LDFLAGS)

$(CONFIG)/obj/cgitest.o: \
        test/cgitest.c \
        $(CONFIG)/inc/bit.h
	$(CC) -c -o $(CONFIG)/obj/cgitest.o $(CFLAGS) $(DFLAGS) -I$(CONFIG)/inc test/cgitest.c

test/cgi-bin/cgitest:  \
        $(CONFIG)/inc/goahead.h \
        $(CONFIG)/inc/js.h \
        $(CONFIG)/obj/cgitest.o
	$(CC) -o test/cgi-bin/cgitest $(LDFLAGS) $(LIBPATHS) $(CONFIG)/obj/cgitest.o $(LIBS) $(LDFLAGS)

