From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [PATCH] [PARISC] Clean up syslog output of
Date: Sun, 15 Jul 2007 18:55:11 +0000
Message-ID: <20070715185511.GB9938__8172.72640201754$1416624415$gmane$org@tausq.org>
References: <200707151935.27525.deller@gmx.de> <200707151849.l6FInDB4011476@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <randolph@tausq.org>
In-Reply-To: <200707151849.l6FInDB4011476@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> I find the dumps useful.  While in most cases gdb is necessary
> to fix bugs, it's not 100 % reliable when used to examine core
> dumps (sorry Randolph).  The getdents bug that I tracked down
> a few weeks ago was a case in point.

I agree the dumps are a useful tool in addition to gdb; but I would like
to know more what is not reliable with gdb core dump debugging. I
actually find that gdb's core dump debugging is often times more
reliable than using gdb to debug running programs.

The biggest problem I've had with gdb is with debugging threaded apps.
gdb is still quite buggy for multithread debugging :(

randolph
