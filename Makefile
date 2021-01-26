#
# Makefile for empty
#
# Usage:
# 	make all install clean
# or
# 	make `uname -s` install clean
# or 
# 	make `uname -s`-gcc install clean
#

DEBUG = 1

CC =	gcc
LIBS =	-lutil

ifeq (DEBUG,1)
CFLAGS = -g
endif

PREFIX = /usr/local

all:
	${CC} ${CFLAGS} -Wall -o empty empty.c ${LIBS}

Linux:		all
Cygwin:		all

install:
ifeq (DEBUG,0)
	[ -f `which strip` ] && strip empty
endif
	[ -d ${PREFIX}/bin ] && cp empty ${PREFIX}/bin || mkdir -p ${PREFIX}/bin && cp empty ${PREFIX}/bin
	[ -d ${PREFIX}/man/man1 ] && cp empty.1 ${PREFIX}/man/man1 || mkdir -p ${PREFIX}/man/man1 && cp empty.1 ${PREFIX}/man/man1

deinstall:
	rm ${PREFIX}/bin/empty
	rm ${PREFIX}/man/man1/empty.1

uninstall:	deinstall

clean:
	rm empty
