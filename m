Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel1.hp.com (atlrel1.hp.com [156.153.255.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94E35482F
	for <parisc-linux@parisc-linux.org>; Fri, 15 Jun 2001 18:57:04 -0600 (MDT)
Cc: amodra@bigpond.net.au, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] new g++/exceptions problem 
In-Reply-To: Your message of "Fri, 15 Jun 2001 18:50:36 MDT."
             <E15B4IO-000111-00@noam.fc.hp.com>
References: <E15B4IO-000111-00@noam.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 15 Jun 2001 18:57:02 -0600
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E15B4Oc-00011t-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= 
= I built apt against the new exception-handling

The following shows what appears to be the same problem:
$ cat hello.c
#include <stdio.h>
int main() {printf("hello world\n");}
$ g++ -o hello hello.c
$ ./hello
Bus error
$

which makes me think something in the C++ exception initialization is
the culprit -- another wild guess
